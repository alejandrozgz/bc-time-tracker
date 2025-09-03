pageextension 99000 "Resource Card Ext" extends "Resource Card"
{
    layout
    {
        addafter(General)
        {
            group("Web Access")
            {
                Caption = 'Web Access';

                field("Web Access Enabled"; Rec."Web Access Enabled")
                {
                    ApplicationArea = All;
                }
                field("Web Username"; Rec."Web Username")
                {
                    ApplicationArea = All;
                    Enabled = Rec."Web Access Enabled";
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
                Image = Password;
                Enabled = Rec."Web Access Enabled";

                trigger OnAction()
                var
                    PasswordDialog: Page "Web Password Dialog";
                begin
                    PasswordDialog.SetResourceNo(Rec."No.");
                    PasswordDialog.RunModal();
                end;
            }
        }
    }
}