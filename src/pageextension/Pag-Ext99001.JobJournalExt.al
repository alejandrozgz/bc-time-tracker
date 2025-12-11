pageextension 99001 "Job Journal Ext" extends "Job Journal"
{
    layout
    {
        addlast(Control1)
        {
            field("Approval Status"; Rec."Approval Status")
            {
                ApplicationArea = All;
            }
            field(Comments; Rec.Comments)
            {
                ApplicationArea = All;
            }
        }
    }
}
