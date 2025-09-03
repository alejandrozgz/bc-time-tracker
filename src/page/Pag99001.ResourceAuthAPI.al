page 99001 "Resource Auth API"
{
    PageType = API;
    APIPublisher = 'timetracker';
    APIGroup = 'v1';
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
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Web Access Enabled", true);
    end;
}