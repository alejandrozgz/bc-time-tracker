codeunit 99000 "Web Authentication Management"
{
    procedure ValidateResourceCredentials(Username: Text; Password: Text): Record Resource
    var
        Resource: Record Resource;
        HashedPassword: Text;
    begin
        Resource.SetRange("Web Username", Username);
        Resource.SetRange("Web Access Enabled", true);

        if not Resource.FindFirst() then
            Error('Invalid credentials or access disabled');

        HashedPassword := HashPassword(Password);
        if Resource."Web Password Hash" <> HashedPassword then
            Error('Invalid credentials');

        // Update last login
        Resource."Last Web Login" := CurrentDateTime;
        Resource.Modify();

        exit(Resource);
    end;

    procedure HashPassword(Password: Text): Text
    var
        CryptographyManagement: Codeunit "Cryptography Management";
        HashAlgorithmType: Option MD5,SHA1,SHA256,SHA384,SHA512;
    begin
        exit(CryptographyManagement.GenerateHash(Password, HashAlgorithmType::SHA256));
    end;

    procedure GetResourceAssignments(ResourceNo: Code[20]): JsonObject
    var
        JobPlanningLine: Record "Job Planning Line";
        Job: Record Job;
        JobTask: Record "Job Task";
        JobsArray: JsonArray;
        TasksArray: JsonArray;
        JobJson: JsonObject;
        TaskJson: JsonObject;
        Result: JsonObject;
    begin
        // Get jobs assigned to resource
        JobPlanningLine.SetRange("No.", ResourceNo);
        JobPlanningLine.SetRange(Type, JobPlanningLine.Type::Resource);

        if JobPlanningLine.FindSet() then begin
            repeat
                if Job.Get(JobPlanningLine."Job No.") then begin
                    Clear(JobJson);
                    JobJson.Add('id', Job.SystemId);
                    JobJson.Add('no', Job."No.");
                    JobJson.Add('description', Job.Description);
                    JobJson.Add('status', Format(Job.Status));
                    JobsArray.Add(JobJson);

                    // Get tasks for this job
                    JobTask.SetRange("Job No.", Job."No.");
                    JobTask.SetRange("Job Task Type", JobTask."Job Task Type"::Posting);
                    if JobTask.FindSet() then begin
                        repeat
                            Clear(TaskJson);
                            TaskJson.Add('id', JobTask.SystemId);
                            TaskJson.Add('jobNo', JobTask."Job No.");
                            TaskJson.Add('jobTaskNo', JobTask."Job Task No.");
                            TaskJson.Add('description', JobTask.Description);
                            TasksArray.Add(TaskJson);
                        until JobTask.Next() = 0;
                    end;
                end;
            until JobPlanningLine.Next() = 0;
        end;

        Result.Add('jobs', JobsArray);
        Result.Add('tasks', TasksArray);
        exit(Result);
    end;
}