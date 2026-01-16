page 99001 "ATP Resource Auth API"
{
    PageType = API;
    APIGroup = 'timetracker';
    APIPublisher = 'atp';
    APIVersion = 'v1.0';
    EntityName = 'resourceAuth';
    EntitySetName = 'resourceAuth';
    SourceTable = Resource;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(resourceNo; Rec."No.")
                {
                    Caption = 'Resource No';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(webUsername; Rec."Web Username")
                {
                    Caption = 'Web Username';
                }
                field(webAccessEnabled; Rec."Web Access Enabled")
                {
                    Caption = 'Web Access Enabled';
                }
                field(jobJournalBatch; Rec."Job Journal Batch")
                {
                    Caption = 'Job Journal Batch';
                    Editable = false;
                }
                field(timeEntryMode; Rec."ATT TT Time Entry Mode")
                {
                    Caption = 'Time Entry Mode';
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Web Access Enabled", true);
    end;

    procedure UpdateLastLogin(ResourceNo: Code[20])
    var
        Resource: Record Resource;
    begin
        if Resource.Get(ResourceNo) then begin
            Resource."Last Web Login" := CurrentDateTime;
            Resource.Modify(true);
            Commit();
        end;
    end;
}