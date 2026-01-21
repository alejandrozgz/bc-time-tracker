page 99011 "ATP TT Day Detail"
{
    Caption = 'Time Tracker Day Detail';
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
        InFromDate: Date;
        InToDate: Date;
        LineStyle: Text[30];

    trigger OnAfterGetRecord()
    begin
        SetLineStyle();
    end;

    procedure SetContext(ResourceNo: Code[20]; FromDate: Date; ToDate: Date; var TempDetail: Record "ATP TT Time Detail" temporary)
    begin
        InResourceNo := ResourceNo;
        InFromDate := FromDate;
        InToDate := ToDate;

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
        JobJournalLine: Record "Job Journal Line";
        SavedFilters: Text;
    begin
        if Rec.FindSet() then
            repeat
                if Rec."Source Type" = Rec."Source Type"::Journal then begin
                    JobJournalLine.Get(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Journal Line No.");
                    JobJournalLine."Approval Status" := JobJournalLine."Approval Status"::Approved;
                    JobJournalLine.Modify();
                    Rec."Approval Status" := Rec."Approval Status"::Approved;
                    Rec.Modify();
                end;
            until Rec.Next() = 0;
        CurrPage.Update(false);
    end;

    local procedure RejectAllLines()
    var
        JobJournalLine: Record "Job Journal Line";
        SavedFilters: Text;
    begin
        SavedFilters := Rec.GetView();
        Rec.Copy(Rec, true);
        if Rec.FindSet() then
            repeat
                if Rec."Source Type" = Rec."Source Type"::Journal then begin
                    JobJournalLine.Get(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Journal Line No.");
                    JobJournalLine."Approval Status" := JobJournalLine."Approval Status"::Rejected;
                    JobJournalLine.Modify();
                    Rec."Approval Status" := Rec."Approval Status"::Rejected;
                    Rec.Modify();
                end;
            until Rec.Next() = 0;

        Rec.SetView(SavedFilters);
        CurrPage.Update(false);
    end;

    local procedure ApproveSelectedLines()
    var
        JobJournalLine: Record "Job Journal Line";
        SavedFilters: Text;
    begin
        CurrPage.SetSelectionFilter(Rec);
        if Rec.FindSet() then
            repeat
                if Rec."Source Type" = Rec."Source Type"::Journal then begin
                    JobJournalLine.Get(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Journal Line No.");
                    JobJournalLine."Approval Status" := JobJournalLine."Approval Status"::Approved;
                    JobJournalLine.Modify();
                    Rec."Approval Status" := Rec."Approval Status"::Approved;
                    Rec.Modify();
                end;
            until Rec.Next() = 0;

        Rec.Reset();
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
                    Rec."Approval Status" := Rec."Approval Status"::Rejected;
                    Rec.Modify();
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
