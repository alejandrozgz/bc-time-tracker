page 99011 "ATP TT Time Day Detail"
{
    Caption = 'ATP Time Day Detail';
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
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Hours"; Rec."Hours")
                {
                    ApplicationArea = All;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ApproveSelected)
            {
                Caption = 'Approve Selected';
                ApplicationArea = All;
                Image = Approve;
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

    procedure SetContext(ResourceNo: Code[20]; WorkDate: Date; var TempDetail: Record "ATP TT Time Detail" temporary)
    begin
        InResourceNo := ResourceNo;
        InDate := WorkDate;

        Rec.Reset();
        Rec.DeleteAll();

        // Copiar el buffer recibido a Rec (temp)
        if TempDetail.FindSet() then
            repeat
                Rec := TempDetail;
                Rec.Insert();
            until TempDetail.Next() = 0;
    end;

    trigger OnOpenPage()
    begin
        // Opcional: si quieres recargar desde TimeMgt en lugar de recibir buffer
        // var TimeMgt: Codeunit "ATP TT Time Mgt.";
        // TimeMgt.BuildDayDetail(Rec, InResourceNo, InDate);
    end;

    local procedure ApproveSelectedLines()
    var
        CurrRec: Record "ATP TT Time Detail";
        JobJournalLine: Record "Job Journal Line";
    begin
        CurrRec.Copy(Rec);
        if CurrRec.FindSet() then
            repeat
                if CurrRec."Source Type" = CurrRec."Source Type"::Journal then begin
                    // TODO: localizar Job Journal Line por plantilla/lote/line no. y actualizar estado
                    // JobJournalLine.Get(...);
                    // JobJournalLine."<campo estado>" := <Approved>;
                    // JobJournalLine.Modify();
                end;
            until CurrRec.Next() = 0;

        Message('Approval logic to be implemented.');
    end;

    local procedure RejectSelectedLines()
    begin
        // TODO: similar a ApproveSelectedLines, pero marcando como Rejected
        Message('Rejection logic to be implemented.');
    end;
}
