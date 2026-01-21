table 99000 "ATP TT Time Summary"
{
    Caption = 'Time Summary';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(3; "Hours Journal"; Decimal)
        {
            Caption = 'Hours (Journal)';
            DecimalPlaces = 0 : 5;
        }
        field(4; "Hours Posted"; Decimal)
        {
            Caption = 'Hours (Posted)';
            DecimalPlaces = 0 : 5;
        }
        field(5; "Total Hours"; Decimal)
        {
            Caption = 'Total Hours';
            DecimalPlaces = 0 : 5;
        }
        field(10; "Has Unapproved"; Boolean)
        {
            Caption = 'Has Unapproved';
        }
    }

    keys
    {
        key(PK; "Resource No.", "Date")
        {
            Clustered = true;
        }
    }
}
