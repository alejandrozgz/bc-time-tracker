page 99006 "ATP Job Journal Line API"
{
    APIGroup = 'timetracker';
    APIPublisher = 'atp';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Job Journal Lines API';
    DelayedInsert = true;
    EntityName = 'jobJournalLine';
    EntitySetName = 'jobJournalLines';
    PageType = API;
    SourceTable = "Job Journal Line";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'ID';
                    Editable = false;
                }
                field(journalTemplateName; Rec."Journal Template Name")
                {
                    Caption = 'Journal Template Name';
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No';
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Job No';
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Job Task No';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(workTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(totalCost; Rec."Total Cost")
                {
                    Caption = 'Total Cost';
                    Editable = false;
                }
                field(totalPrice; Rec."Total Price")
                {
                    Caption = 'Total Price';
                    Editable = false;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    Editable = false;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        JobJournalTemplate: Record "Job Journal Template";
        JobJournalBatch: Record "Job Journal Batch";
        JobJournalLine: Record "Job Journal Line";
        LineNo: Integer;
    begin
        // Ensure Journal Template exists
        if not JobJournalTemplate.Get(Rec."Journal Template Name") then begin
            JobJournalTemplate.Init();
            JobJournalTemplate.Name := Rec."Journal Template Name";
            JobJournalTemplate.Description := 'Time Tracker Template';
            JobJournalTemplate."Page ID" := Page::"Job Journal";
            JobJournalTemplate."Posting Report ID" := Report::"Job Register";
            JobJournalTemplate."Source Code" := 'JOBJNL';
            JobJournalTemplate."Reason Code" := '';
            JobJournalTemplate."Recurring" := false;
            JobJournalTemplate.Insert(true);
        end;

        // Ensure Journal Batch exists
        if not JobJournalBatch.Get(Rec."Journal Template Name", Rec."Journal Batch Name") then begin
            JobJournalBatch.Init();
            JobJournalBatch."Journal Template Name" := Rec."Journal Template Name";
            JobJournalBatch.Name := Rec."Journal Batch Name";
            JobJournalBatch.Description := 'Web App Batch';
            JobJournalBatch.Insert();
        end;

        // Auto-assign Line No if not provided
        if Rec."Line No." = 0 then begin
            JobJournalLine.SetRange("Journal Template Name", Rec."Journal Template Name");
            JobJournalLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
            if JobJournalLine.FindLast() then
                LineNo := JobJournalLine."Line No." + 10000
            else
                LineNo := 10000;
            Rec."Line No." := LineNo;
        end;

        exit(true);
    end;
}