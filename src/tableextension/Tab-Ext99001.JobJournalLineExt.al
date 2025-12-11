tableextension 99001 "Job Journal Line Ext" extends "Job Journal Line"
{
    fields
    {
        field(99000; "Approval Status"; Enum "ATP TT Approval Status")
        {
            Caption = 'Approval Status';
            DataClassification = ToBeClassified;
        }
        field(99001; Comments; Text[250])
        {
            Caption = 'Comments';
            DataClassification = ToBeClassified;
        }
    }
}
