// src/page/Pag99003.ResourceAPI.al

page 99007 "Resource API"
{
    PageType = API;
    Caption = 'Resources';
    APIPublisher = 'atp';
    APIGroup = 'timetracker';
    APIVersion = 'v1.0';
    EntityName = 'resource';
    EntitySetName = 'resources';
    SourceTable = Resource;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(resourceNo; Rec."No.")
                {
                    Caption = 'Resource No';
                }
                field(displayName; Rec.Name)
                {
                    Caption = 'Display Name';
                }
                field(resourceType; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(webUsername; Rec."Web Username")
                {
                    Caption = 'Web Username';
                }
                field(webPasswordHash; Rec."Web Password Hash")
                {
                    Caption = 'Web Password Hash';
                }
                field(webAccessEnabled; Rec."Web Access Enabled")
                {
                    Caption = 'Web Access Enabled';
                }
                field(lastWebLogin; Rec."Last Web Login")
                {
                    Caption = 'Last Web Login';
                    Editable = true;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    Editable = false;
                }
                field(jobJournalBatch; Rec."Job Journal Batch")
                {
                    Caption = 'Job Journal Batch';
                    Editable = false;
                }
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Last Web Login" <> 0DT then begin
            if Rec."Last Web Login" > CurrentDateTime then
                Error('Last Web Login cannot be in the future');
        end;
    end;
}