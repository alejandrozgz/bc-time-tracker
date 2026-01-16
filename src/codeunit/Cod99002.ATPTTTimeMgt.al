codeunit 99002 "ATP TT Time Mgt."
{
    procedure BuildSummary(var TimeSummary: Record "ATP TT Time Summary" temporary; StartDate: Date; EndDate: Date; ResourceFilter: Code[20])
    var
        JobJournalLine: Record "Job Journal Line";
        JobLedgerEntry: Record "Job Ledger Entry";
        DayDate: Date;
    begin
        TimeSummary.Reset();
        TimeSummary.DeleteAll();

        // --- 1. Acumular Job Journal Line ---
        // TODO: filtrar por plantilla/lote de diario de tiempos
        JobJournalLine.Reset();
        JobJournalLine.SetCurrentKey("Posting Date", Type, "No.");
        JobJournalLine.SetRange("Posting Date", StartDate, EndDate);
        if ResourceFilter <> '' then begin
            JobJournalLine.SetRange(Type, JobJournalLine.Type::Resource);
            JobJournalLine.SetRange("No.", ResourceFilter);
        end;

        if JobJournalLine.FindSet() then
            repeat
                InsertOrUpdateSummary(
                    TimeSummary,
                    JobJournalLine."No.",
                    JobJournalLine."Posting Date",
                    JobJournalLine."Quantity", // Ajusta si usas otro campo de horas
                    true,
                    false,
                    JobJournalLine,
                    JobJournalLine."Approval Status"); // puedes pasar el registro para marcar Has Unapproved
            until JobJournalLine.Next() = 0;

        // --- 2. Acumular Job Ledger Entry ---
        JobLedgerEntry.Reset();
        JobLedgerEntry.SetCurrentKey("Posting Date", Type, "No.");
        JobLedgerEntry.SetRange("Posting Date", StartDate, EndDate);
        if ResourceFilter <> '' then begin
            JobLedgerEntry.SetRange(Type, JobLedgerEntry.Type::Resource);
            JobLedgerEntry.SetRange("No.", ResourceFilter);
        end;

        if JobLedgerEntry.FindSet() then
            repeat
                InsertOrUpdateSummary(
                    TimeSummary,
                    JobLedgerEntry."No.",
                    JobLedgerEntry."Posting Date",
                    JobLedgerEntry.Quantity, // Ajustar según cómo guardes horas
                    false,
                    true,
                    JobLedgerEntry,
                    "ATP TT Approval Status"::Approved);
            until JobLedgerEntry.Next() = 0;
    end;

    local procedure InsertOrUpdateSummary(
    var TimeSummary: Record "ATP TT Time Summary" temporary;
    ResourceNo: Code[20];
    WorkDate: Date;
    Hours: Decimal;
    FromJournal: Boolean;
    FromLedger: Boolean;
    VariantRec: Variant;
    ApprovalStatus: Enum "ATP TT Approval Status")
    begin
        if not TimeSummary.Get(ResourceNo, WorkDate) then begin
            TimeSummary.Init();
            TimeSummary."Resource No." := ResourceNo;
            TimeSummary."Date" := WorkDate;
            TimeSummary."Hours Journal" := 0;
            TimeSummary."Hours Posted" := 0;
            TimeSummary."Total Hours" := 0;
            TimeSummary."Has Unapproved" := false; // solo aquí se inicializa
            TimeSummary.Insert();
        end else
            TimeSummary.LockTable();

        if FromJournal then
            TimeSummary."Hours Journal" += Hours;
        if FromLedger then
            TimeSummary."Hours Posted" += Hours;

        TimeSummary."Total Hours" := TimeSummary."Hours Journal" + TimeSummary."Hours Posted";

        // Acumular: si ya era TRUE no lo pisamos nunca a FALSE
        TimeSummary."Has Unapproved" :=
            TimeSummary."Has Unapproved" or
            (FromJournal and (ApprovalStatus = ApprovalStatus::Pending));

        TimeSummary.Modify();
    end;


    procedure BuildDayDetail(var TimeDetail: Record "ATP TT Time Detail" temporary; ResourceNo: Code[20]; DayDate: Date)
    var
        JobJournalLine: Record "Job Journal Line";
        JobLedgerEntry: Record "Job Ledger Entry";
        EntryNo: Integer;
    begin
        TimeDetail.Reset();
        TimeDetail.DeleteAll();
        EntryNo := 0;

        // --- 1. Job Journal Line ---
        JobJournalLine.Reset();
        JobJournalLine.SetRange(Type, JobJournalLine.Type::Resource);
        JobJournalLine.SetRange("No.", ResourceNo);
        JobJournalLine.SetRange("Posting Date", DayDate);
        if JobJournalLine.FindSet() then
            repeat
                EntryNo += 1;
                TimeDetail.Init();
                TimeDetail."Entry No." := EntryNo;
                TimeDetail."Resource No." := JobJournalLine."No.";
                TimeDetail."Date" := JobJournalLine."Posting Date";
                TimeDetail."Job No." := JobJournalLine."Job No.";
                TimeDetail."Job Task No." := JobJournalLine."Job Task No.";
                TimeDetail."Description" := JobJournalLine.Description;
                TimeDetail."Hours" := JobJournalLine."Quantity";
                TimeDetail."Source Type" := TimeDetail."Source Type"::Journal;
                TimeDetail."Approval Status" := JobJournalLine."Approval Status";
                TimeDetail."Journal Template Name" := JobJournalLine."Journal Template Name";
                TimeDetail."Journal Batch Name" := JobJournalLine."Journal Batch Name";
                TimeDetail."Journal Line No." := JobJournalLine."Line No.";
                TimeDetail.Insert();
            until JobJournalLine.Next() = 0;

        // --- 2. Job Ledger Entry ---
        JobLedgerEntry.Reset();
        JobLedgerEntry.SetRange(Type, JobLedgerEntry.Type::Resource);
        JobLedgerEntry.SetRange("No.", ResourceNo);
        JobLedgerEntry.SetRange("Posting Date", DayDate);

        if JobLedgerEntry.FindSet() then
            repeat
                EntryNo += 1;
                TimeDetail.Init();
                TimeDetail."Entry No." := EntryNo;
                TimeDetail."Resource No." := JobLedgerEntry."No.";
                TimeDetail."Date" := JobLedgerEntry."Posting Date";
                TimeDetail."Job No." := JobLedgerEntry."Job No.";
                TimeDetail."Job Task No." := JobLedgerEntry."Job Task No.";
                TimeDetail."Description" := JobLedgerEntry.Description;
                TimeDetail."Hours" := JobLedgerEntry.Quantity;
                TimeDetail."Source Type" := TimeDetail."Source Type"::Ledger;
                TimeDetail."Job Ledger Entry No." := JobLedgerEntry."Entry No.";
                TimeDetail."Approval Status" := "ATP TT Approval Status"::Approved;
                TimeDetail.Insert();
            until JobLedgerEntry.Next() = 0;
    end;

    procedure OpenDayDetail(ResourceNo: Code[20]; DayDate: Date)
    var
        TimeDetail: Record "ATP TT Time Detail" temporary;
        DayDetailPage: Page "ATP TT Time Day Detail";
    begin
        BuildDayDetail(TimeDetail, ResourceNo, DayDate);
        DayDetailPage.SetContext(ResourceNo, DayDate, TimeDetail);
        DayDetailPage.RunModal();
    end;

    procedure BuildPeriodDetail(var TimeDetail: Record "ATP TT Time Detail" temporary; ResourceNo: Code[20]; FromDate: Date; ToDate: Date)
    var
        JobJournalLine: Record "Job Journal Line";
        JobLedgerEntry: Record "Job Ledger Entry";
        EntryNo: Integer;
    begin
        TimeDetail.Reset();
        TimeDetail.DeleteAll();
        EntryNo := 0;

        // --- 1. Job Journal Line en rango ---
        JobJournalLine.Reset();
        JobJournalLine.SetRange(Type, JobJournalLine.Type::Resource);
        JobJournalLine.SetRange("No.", ResourceNo);
        JobJournalLine.SetRange("Posting Date", FromDate, ToDate);
        // TODO: filtrar por plantilla/lote si aplica

        if JobJournalLine.FindSet() then
            repeat
                EntryNo += 1;
                TimeDetail.Init();
                TimeDetail."Entry No." := EntryNo;
                TimeDetail."Resource No." := JobJournalLine."No.";
                TimeDetail."Date" := JobJournalLine."Posting Date";
                TimeDetail."Job No." := JobJournalLine."Job No.";
                TimeDetail."Job Task No." := JobJournalLine."Job Task No.";
                TimeDetail."Description" := JobJournalLine.Description;
                TimeDetail."Hours" := JobJournalLine."Quantity";
                TimeDetail."Source Type" := TimeDetail."Source Type"::Journal;
                TimeDetail."Journal Template Name" := JobJournalLine."Journal Template Name";
                TimeDetail."Journal Batch Name" := JobJournalLine."Journal Batch Name";
                TimeDetail."Journal Line No." := JobJournalLine."Line No.";
                TimeDetail.Insert();
            until JobJournalLine.Next() = 0;

        // --- 2. Job Ledger Entry en rango ---
        JobLedgerEntry.Reset();
        JobLedgerEntry.SetRange(Type, JobLedgerEntry.Type::Resource);
        JobLedgerEntry.SetRange("No.", ResourceNo);
        JobLedgerEntry.SetRange("Posting Date", FromDate, ToDate);

        if JobLedgerEntry.FindSet() then
            repeat
                EntryNo += 1;
                TimeDetail.Init();
                TimeDetail."Entry No." := EntryNo;
                TimeDetail."Resource No." := JobLedgerEntry."No.";
                TimeDetail."Date" := JobLedgerEntry."Posting Date";
                TimeDetail."Job No." := JobLedgerEntry."Job No.";
                TimeDetail."Job Task No." := JobLedgerEntry."Job Task No.";
                TimeDetail."Description" := JobLedgerEntry.Description;
                TimeDetail."Hours" := JobLedgerEntry.Quantity;
                TimeDetail."Source Type" := TimeDetail."Source Type"::Ledger;
                TimeDetail."Job Ledger Entry No." := JobLedgerEntry."Entry No.";
                TimeDetail.Insert();
            until JobLedgerEntry.Next() = 0;
    end;

    procedure OpenPeriodDetail(ResourceNo: Code[20]; FromDate: Date; ToDate: Date)
    var
        TimeDetail: Record "ATP TT Time Detail" temporary;
        DayDetailPage: Page "ATP TT Time Day Detail";
    begin
        BuildPeriodDetail(TimeDetail, ResourceNo, FromDate, ToDate);
        // Usamos FromDate solo como contexto, la página realmente muestra todo el buffer
        DayDetailPage.SetContext(ResourceNo, FromDate, TimeDetail);
        DayDetailPage.RunModal();
    end;
}
