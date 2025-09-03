page 99000 "Web Password Dialog"
{
    PageType = StandardDialog;
    Caption = 'Set Web Password';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(NewPassword; NewPassword)
                {
                    Caption = 'New Password';
                    ExtendedDatatype = Masked;
                    ApplicationArea = All;
                }
                field(ConfirmPassword; ConfirmPassword)
                {
                    Caption = 'Confirm Password';
                    ExtendedDatatype = Masked;
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        NewPassword: Text[50];
        ConfirmPassword: Text[50];
        ResourceNo: Code[20];

    procedure SetResourceNo(ResNo: Code[20])
    begin
        ResourceNo := ResNo;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        Resource: Record Resource;
        WebAuth: Codeunit "Web Authentication Management";
    begin
        if CloseAction = Action::OK then begin
            if NewPassword <> ConfirmPassword then
                Error('Passwords do not match');

            if StrLen(NewPassword) < 6 then
                Error('Password must be at least 6 characters');

            Resource.Get(ResourceNo);
            Resource."Web Password Hash" := WebAuth.HashPassword(NewPassword);
            Resource.Modify();

            Message('Password updated successfully');
        end;
    end;
}