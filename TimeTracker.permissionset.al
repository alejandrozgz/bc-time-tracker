permissionset 99000 TimeTracker
{
    Assignable = true;
    Permissions = tabledata "ATP TT Time Detail"=RIMD,
        tabledata "ATP TT Time Summary"=RIMD,
        table "ATP TT Time Detail"=X,
        table "ATP TT Time Summary"=X,
        codeunit "ATP TT Time Mgt."=X,
        codeunit "Web Authentication Management"=X,
        page "ATP Job Journal Line API"=X,
        page "ATP Job Planning Lines API"=X,
        page "ATP Job Tasks API"=X,
        page "ATP Jobs API"=X,
        page "ATP Resource Auth API"=X,
        page "ATP Time Entries API"=X,
        page "ATP Time Tracker User Setup"=X,
        page "ATP TT Time Day Detail"=X,
        page "ATP TT Time Matrix"=X,
        page "ATP TT Work Type API"=X,
        page "Resource API"=X,
        page "Web Password Dialog"=X;
}