pageextension 99000 "Resource Card Ext" extends "Resource Card"
{
    layout
    {
        addafter(General)
        {
            group("Web Access")
            {
                Caption = 'Time Tracker';

                field("Web Access Enabled"; Rec."Web Access Enabled")
                {
                    ApplicationArea = All;
                }
                field("Web Username"; Rec."Web Username")
                {
                    ApplicationArea = All;
                    Enabled = Rec."Web Access Enabled";
                }
                field("Job Journal Batch"; Rec."Job Journal Batch")
                {
                    ApplicationArea = All;
                }
                field("Hours Unit of Measure Code"; Rec."Hours Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Last Web Login"; Rec."Last Web Login")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
            }
        }
    }

    actions
    {
        addafter(Dimensions)
        {
            action("Set Web Password")
            {
                Caption = 'Set Web Password';
                Image = SelectField;
                Enabled = Rec."Web Access Enabled";
                ApplicationArea = All;


                trigger OnAction()
                var
                    PasswordDialog: Page "Web Password Dialog";
                begin
                    PasswordDialog.SetResourceNo(Rec."No.");
                    PasswordDialog.RunModal();
                end;
            }
        }
        addafter(CreateTimeSheets_Promoted)
        {
            actionref("Set Web Password_Promoted"; "Set Web Password")
            {
            }
        }
    }

}