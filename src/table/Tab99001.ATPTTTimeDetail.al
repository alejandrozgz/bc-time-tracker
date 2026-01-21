table 99001 "ATP TT Time Detail"
{
    Caption = 'Time Tracker Detail';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; "Job No."; Code[20])
        {
            Caption = 'Job No.';
        }
        field(5; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
        }
        field(6; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Hours"; Decimal)
        {
            Caption = 'Hours';
            DecimalPlaces = 0 : 5;
        }
        field(8; "Source Type"; Enum "ATP TT Time Source Type")
        {
            Caption = 'Source Type';
        }
        field(9; "Approval Status"; Enum "ATP TT Approval Status")
        {
            Caption = 'Approval Status';
        }
        field(10; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
        }
        field(11; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(12; "Journal Line No."; Integer)
        {
            Caption = 'Journal Line No.';
        }
        field(13; "Job Ledger Entry No."; Integer)
        {
            Caption = 'Job Ledger Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
