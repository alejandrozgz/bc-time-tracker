page 99011 "ATP TT Time Day Detail"
{
    Caption = 'Time Day Detail';
    PageType = List;
    SourceTable = "ATP TT Time Detail";
    SourceTableTemporary = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    StyleExpr = LineStyle;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    StyleExpr = LineStyle;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                }
                field("Hours"; Rec."Hours")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    StyleExpr = LineStyle;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    StyleExpr = LineStyle;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ApproveAll)
            {
                Caption = 'Approve All';
                ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    ApproveAllLines();
                end;
            }

            action(RejectAll)
            {
                Caption = 'Reject All';
                ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    RejectAllLines();
                end;
            }

            action(ApproveSelected)
            {
                Caption = 'Approve Selected';
                ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    ApproveSelectedLines();
                end;
            }

            action(RejectSelected)
            {
                Caption = 'Reject Selected';
                ApplicationArea = All;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    RejectSelectedLines();
                end;
            }
        }
    }

    var
        InResourceNo: Code[20];
        InDate: Date;
        LineStyle: Text[30];

    trigger OnAfterGetRecord()
    begin
        SetLineStyle();
    end;

    procedure SetContext(ResourceNo: Code[20]; WorkDate: Date; var TempDetail: Record "ATP TT Time Detail" temporary)
    begin
        InResourceNo := ResourceNo;
        InDate := WorkDate;

        Rec.Reset();
        Rec.DeleteAll();

        if TempDetail.FindSet() then
            repeat
                Rec := TempDetail;
                Rec.Insert();
            until TempDetail.Next() = 0;
    end;

    local procedure ApproveAllLines()
    var
        TimeDetail: Record "ATP TT Time Detail";
        JobJournalLine: Record "Job Journal Line";
        SavedFilters: Text;
    begin
        SavedFilters := Rec.GetView();
        TimeDetail.Copy(Rec, true);
        if TimeDetail.FindSet() then
            repeat
                if TimeDetail."Source Type" = TimeDetail."Source Type"::Journal then begin
                    JobJournalLine.Get(TimeDetail."Journal Template Name", TimeDetail."Journal Batch Name", TimeDetail."Journal Line No.");
                    JobJournalLine."Approval Status" := JobJournalLine."Approval Status"::Approved;
                    JobJournalLine.Modify();
                end;
            until TimeDetail.Next() = 0;

        Rec.SetView(SavedFilters);
        CurrPage.Update(false);
    end;

    local procedure RejectAllLines()
    var
        TimeDetail: Record "ATP TT Time Detail";
        JobJournalLine: Record "Job Journal Line";
        SavedFilters: Text;
    begin
        SavedFilters := Rec.GetView();
        TimeDetail.Copy(Rec, true);
        if TimeDetail.FindSet() then
            repeat
                if TimeDetail."Source Type" = TimeDetail."Source Type"::Journal then begin
                    JobJournalLine.Get(TimeDetail."Journal Template Name", TimeDetail."Journal Batch Name", TimeDetail."Journal Line No.");
                    JobJournalLine."Approval Status" := JobJournalLine."Approval Status"::Rejected;
                    JobJournalLine.Modify();
                end;
            until TimeDetail.Next() = 0;

        Rec.SetView(SavedFilters);
        CurrPage.Update(false);
    end;

    local procedure ApproveSelectedLines()
    var
        JobJournalLine: Record "Job Journal Line";
        SavedFilters: Text;
    begin
        SavedFilters := Rec.GetView();
        CurrPage.SetSelectionFilter(Rec);
        if Rec.FindSet() then
            repeat
                if Rec."Source Type" = Rec."Source Type"::Journal then begin
                    JobJournalLine.Get(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Journal Line No.");
                    JobJournalLine."Approval Status" := JobJournalLine."Approval Status"::Approved;
                    JobJournalLine.Modify();
                end;
            until Rec.Next() = 0;

        Rec.SetView(SavedFilters);
        CurrPage.Update(false);
    end;

    local procedure RejectSelectedLines()
    var
        JobJournalLine: Record "Job Journal Line";
        SavedFilters: Text;
    begin
        SavedFilters := Rec.GetView();
        CurrPage.SetSelectionFilter(Rec);
        if Rec.FindSet() then
            repeat
                if Rec."Source Type" = Rec."Source Type"::Journal then begin
                    JobJournalLine.Get(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Journal Line No.");
                    JobJournalLine."Approval Status" := JobJournalLine."Approval Status"::Rejected;
                    JobJournalLine.Modify();
                end;
            until Rec.Next() = 0;

        Rec.SetView(SavedFilters);
        CurrPage.Update(false);
    end;

    local procedure SetLineStyle()
    begin
        LineStyle := 'Standard';

        case Rec."Approval Status" of
            Rec."Approval Status"::Pending:
                LineStyle := 'Ambiguous';
            Rec."Approval Status"::Rejected:
                LineStyle := 'Unfavorable';
            Rec."Approval Status"::Approved:
                LineStyle := 'Favorable';
        end;
    end;
}
