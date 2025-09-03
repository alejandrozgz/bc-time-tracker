page 99005 "Job Planning Lines API"
{
    APIVersion = 'v1.0';
    APIPublisher = 'timetracker';
    APIGroup = 'atp';
    PageType = API;
    Caption = 'Job Planning Lines';
    DelayedInsert = true;
    EntityName = 'jobPlanningLine';
    EntitySetName = 'jobPlanningLines';
    SourceTable = "Job Planning Line";
    Extensible = false;
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
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Job No.';
                    Editable = false;
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Job Task No.';
                    Editable = false;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    Editable = false;
                }
                field(planningDate; Rec."Planning Date")
                {
                    Caption = 'Planning Date';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(totalCost; Rec."Total Cost")
                {
                    Caption = 'Total Cost';
                    Editable = false;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(lineAmount; Rec."Line Amount")
                {
                    Caption = 'Line Amount';
                    Editable = false;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(workTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(planningDueDate; Rec."Planning Due Date")
                {
                    Caption = 'Planning Due Date';
                }

                // Navigation to related Job
                part(job; "Jobs API")
                {
                    Caption = 'Job';
                    EntityName = 'job';
                    EntitySetName = 'jobs';
                    SubPageLink = "No." = field("Job No.");
                }
            }
        }
    }

    [ServiceEnabled]
    procedure GetResourceAssignments(ResourceNo: Code[20]) ResourceAssignments: Text
    var
        JobPlanningLine: Record "Job Planning Line";
        Job: Record Job;
        JobTask: Record "Job Task";
        JobsArray: JsonArray;
        TasksArray: JsonArray;
        JobJson: JsonObject;
        TaskJson: JsonObject;
        Result: JsonObject;
        ResultText: Text;
    begin
        // Clear arrays
        Clear(JobsArray);
        Clear(TasksArray);

        // Get job planning lines for the specific resource
        JobPlanningLine.SetRange(Type, JobPlanningLine.Type::Resource);
        JobPlanningLine.SetRange("No.", ResourceNo);

        if JobPlanningLine.FindSet() then begin
            repeat
                // Get job information
                if Job.Get(JobPlanningLine."Job No.") then begin
                    Clear(JobJson);
                    JobJson.Add('id', Job.SystemId);
                    JobJson.Add('no', Job."No.");
                    JobJson.Add('description', Job.Description);
                    JobJson.Add('status', Format(Job.Status));
                    JobJson.Add('startDate', Job."Starting Date");
                    JobJson.Add('endDate', Job."Ending Date");

                    // Add to jobs array (we'll deduplicate later)
                    JobsArray.Add(JobJson);

                    // Get job tasks for this job
                    JobTask.SetRange("Job No.", Job."No.");
                    JobTask.SetRange("Job Task Type", JobTask."Job Task Type"::Posting);
                    if JobTask.FindSet() then begin
                        repeat
                            Clear(TaskJson);
                            TaskJson.Add('id', JobTask.SystemId);
                            TaskJson.Add('jobNo', JobTask."Job No.");
                            TaskJson.Add('jobTaskNo', JobTask."Job Task No.");
                            TaskJson.Add('description', JobTask.Description);
                            TaskJson.Add('jobTaskType', Format(JobTask."Job Task Type"));
                            TasksArray.Add(TaskJson);
                        until JobTask.Next() = 0;
                    end;
                end;
            until JobPlanningLine.Next() = 0;
        end;

        // Build result
        Result.Add('jobs', JobsArray);
        Result.Add('tasks', TasksArray);
        Result.WriteTo(ResultText);

        exit(ResultText);
    end;
}