page 99009 "ATP Time Tracker User Setup"
{
    ApplicationArea = All;
    Caption = 'Time Tracker User Setup';
    PageType = List;
    SourceTable = Resource;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies a description of the resource.';
                }
                field("Web Access Enabled"; Rec."Web Access Enabled")
                {
                    ToolTip = 'Specifies the value of the Web Access Enabled field.', Comment = '%';
                }
                field("Web Username"; Rec."Web Username")
                {
                    ToolTip = 'Specifies the value of the Web Username field.', Comment = '%';
                }
                field("Web Password Hash"; Rec."Web Password Hash")
                {
                    ToolTip = 'Specifies the value of the Web Password Hash field.', Comment = '%';
                }
                field("Job Journal Batch"; Rec."Job Journal Batch")
                {
                    ToolTip = 'Specifies the value of the Job Journal Batch field.', Comment = '%';
                }
                field("Hours Unit of Measure Code"; Rec."Hours Unit of Measure Code")
                {
                }
                field("Last Web Login"; Rec."Last Web Login")
                {
                    ToolTip = 'Specifies the value of the Last Web Login field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ATPSetWebPassword)
            {
                Caption = 'Set Time Tracker Password';
                Image = SelectField;
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
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(ATPSetWebPassword_Promoted; ATPSetWebPassword)
                {
                }
            }
        }
    }
}