tableextension 99000 "Resource Ext" extends Resource
{
    fields
    {
        field(99100; "Web Username"; Text[50])
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

            trigger OnValidate()
            begin
                if "Web Access Enabled" then begin
                    Rec.TestField("Web Username");
                    Rec.TestField("Web Password Hash");
                    Rec.TestField("Job Journal Batch");
                    Rec.TestField("Hours Unit of Measure Code");
                end;
            end;
        }
        field(99103; "Last Web Login"; DateTime)
        {
            Caption = 'Last Web Login';
            Editable = false;
        }
        field(99104; "Job Journal Batch"; Code[10])
        {
            Caption = 'Job Journal Batch';
            TableRelation = "Job Journal Batch".Name where("Journal Template Name" = const('PROJECT'));
        }
        field(99105; "Hours Unit of Measure Code"; Code[10])
        {
            Caption = 'Hours Unit of Measure';
            TableRelation = "Unit of Measure".Code;
        }
    }
}