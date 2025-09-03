page 99003 "Job Tasks API"
{
    PageType = API;
    APIPublisher = 'timetracker';
    APIGroup = 'v1';
    APIVersion = 'v1.0';
    EntityName = 'jobTask';
    EntitySetName = 'jobTasks';
    SourceTable = "Job Task";
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
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(jobTaskType; Rec."Job Task Type")
                {
                    Caption = 'Job Task Type';
                }
            }
        }
    }
}