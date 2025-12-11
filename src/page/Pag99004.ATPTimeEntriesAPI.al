page 99004 "ATP Time Entries API"
{
    PageType = API;
    APIGroup = 'timetracker';
    APIPublisher = 'atp';
    APIVersion = 'v1.0';
    EntityName = 'timeEntry';
    EntitySetName = 'timeEntries';
    SourceTable = "Job Journal Line";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Job No';
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Job Task No';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(resourceNo; Rec."No.")
                {
                    Caption = 'Resource No';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Journal Template Name" := 'JOB';
        Rec."Journal Batch Name" := 'DEFAULT';
        Rec.Type := Rec.Type::Resource;
        Rec."Document No." := 'TIME-' + Format(CurrentDateTime, 0, '<Year4><Month,2><Day,2><Hours24,2><Minutes,2><Seconds,2>');
    end;
}