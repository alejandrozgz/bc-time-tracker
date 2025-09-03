tableextension 99000 "Resource Ext" extends Resource
{
    fields
    {
        field(9999; "Web Username"; Text[50])
        {
            Caption = 'Web Username';
            NotBlank = true;
        }
        field(99101; "Web Password Hash"; Text[250])
        {
            Caption = 'Web Password Hash';
            ExtendedDatatype = Masked;
        }
        field(99102; "Web Access Enabled"; Boolean)
        {
            Caption = 'Web Access Enabled';
            InitValue = false;
        }
        field(99103; "Last Web Login"; DateTime)
        {
            Caption = 'Last Web Login';
            Editable = false;
        }
    }
}