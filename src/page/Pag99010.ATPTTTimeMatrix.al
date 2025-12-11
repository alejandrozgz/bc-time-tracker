page 99010 "ATP TT Time Matrix"
{
    Caption = 'ATP Time Matrix';
    PageType = Worksheet;
    SourceTable = Resource;
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(Options)
            {
                field(PeriodStart; PeriodStart)
                {
                    Caption = 'Period Start';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CalcPeriodEnd();
                        RefreshSummary();
                    end;
                }
                field(PeriodEnd; PeriodEnd)
                {
                    Caption = 'Period End';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ViewBy; ViewBy)
                {
                    Caption = 'View by';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CalcPeriodEnd();
                        RefreshSummary();
                    end;
                }
            }

            repeater(Matrix)
            {
                field(ResourceNo; Rec."No.")
                {
                    Caption = 'Resource No.';
                    ApplicationArea = All;
                }

                field(Day1; GetDayHours(1))
                {
                    Caption = '1';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(1);
                    end;
                }
                field(Day2; GetDayHours(2))
                {
                    Caption = '2';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(2);
                    end;
                }
                field(Day3; GetDayHours(3))
                {
                    Caption = '3';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(3);
                    end;
                }
                field(Day4; GetDayHours(4))
                {
                    Caption = '4';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(4);
                    end;
                }
                field(Day5; GetDayHours(5))
                {
                    Caption = '5';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(5);
                    end;
                }
                field(Day6; GetDayHours(6))
                {
                    Caption = '6';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(6);
                    end;
                }
                field(Day7; GetDayHours(7))
                {
                    Caption = '7';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(7);
                    end;
                }
                field(Day8; GetDayHours(8))
                {
                    Caption = '8';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(8);
                    end;
                }
                field(Day9; GetDayHours(9))
                {
                    Caption = '9';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(9);
                    end;
                }
                field(Day10; GetDayHours(10))
                {
                    Caption = '10';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(10);
                    end;
                }
                field(Day11; GetDayHours(11))
                {
                    Caption = '11';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(11);
                    end;
                }
                field(Day12; GetDayHours(12))
                {
                    Caption = '12';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(12);
                    end;
                }
                field(Day13; GetDayHours(13))
                {
                    Caption = '13';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(13);
                    end;
                }
                field(Day14; GetDayHours(14))
                {
                    Caption = '14';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(14);
                    end;
                }
                field(Day15; GetDayHours(15))
                {
                    Caption = '15';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(15);
                    end;
                }
                field(Day16; GetDayHours(16))
                {
                    Caption = '16';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(16);
                    end;
                }
                field(Day17; GetDayHours(17))
                {
                    Caption = '17';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(17);
                    end;
                }
                field(Day18; GetDayHours(18))
                {
                    Caption = '18';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(18);
                    end;
                }
                field(Day19; GetDayHours(19))
                {
                    Caption = '19';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(19);
                    end;
                }
                field(Day20; GetDayHours(20))
                {
                    Caption = '20';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(20);
                    end;
                }
                field(Day21; GetDayHours(21))
                {
                    Caption = '21';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(21);
                    end;
                }
                field(Day22; GetDayHours(22))
                {
                    Caption = '22';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(22);
                    end;
                }
                field(Day23; GetDayHours(23))
                {
                    Caption = '23';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(23);
                    end;
                }
                field(Day24; GetDayHours(24))
                {
                    Caption = '24';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(24);
                    end;
                }
                field(Day25; GetDayHours(25))
                {
                    Caption = '25';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(25);
                    end;
                }
                field(Day26; GetDayHours(26))
                {
                    Caption = '26';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(26);
                    end;
                }
                field(Day27; GetDayHours(27))
                {
                    Caption = '27';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(27);
                    end;
                }
                field(Day28; GetDayHours(28))
                {
                    Caption = '28';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(28);
                    end;
                }
                field(Day29; GetDayHours(29))
                {
                    Caption = '29';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(29);
                    end;
                }
                field(Day30; GetDayHours(30))
                {
                    Caption = '30';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(30);
                    end;
                }
                field(Day31; GetDayHours(31))
                {
                    Caption = '31';
                    ApplicationArea = All;
                    DrillDown = true;
                    StyleExpr = DayStyle;
                    trigger OnDrillDown()
                    begin
                        DrillDownDay(31);
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Refresh)
            {
                Caption = 'Refresh';
                ApplicationArea = All;
                Image = Refresh;
                trigger OnAction()
                begin
                    RefreshSummary();
                end;
            }
        }
    }

    var
        PeriodStart: Date;
        PeriodEnd: Date;
        TimeSummary: Record "ATP TT Time Summary" temporary;
        TimeMgt: Codeunit "ATP TT Time Mgt.";
        DayStyle: Text;
        ViewBy: Enum "ATP TT View By";

    trigger OnOpenPage()
    begin
        ViewBy := ViewBy::Day;
        // Primer día del mes actual
        PeriodStart := DMY2DATE(1, DATE2DMY(Today(), 2), DATE2DMY(Today(), 3));
        CalcPeriodEnd();
        RefreshSummary();
    end;

    local procedure CalcPeriodEnd()
    begin
        case ViewBy of
            ViewBy::Day,
            ViewBy::Week:
                // Fin de mes a partir de PeriodStart
                PeriodEnd := CALCDATE('<CM>', PeriodStart);

            ViewBy::Month,
            ViewBy::Year:
                begin
                    // Para meses/año, trabajamos con el año natural
                    PeriodStart := DMY2DATE(1, 1, DATE2DMY(PeriodStart, 3));
                    PeriodEnd := CALCDATE('<CY>', PeriodStart);
                end;
        end;
    end;

    local procedure RefreshSummary()
    begin
        TimeSummary.Reset();
        TimeSummary.DeleteAll();
        TimeMgt.BuildSummary(TimeSummary, PeriodStart, PeriodEnd, ''); // sin filtro de recurso aquí
    end;

    local procedure GetBucketDateRange(DayNo: Integer; var FromDate: Date; var ToDate: Date)
    var
        Year: Integer;
        Month: Integer;
    begin
        FromDate := 0D;
        ToDate := 0D;

        case ViewBy of
            ViewBy::Day:
                begin
                    FromDate := PeriodStart + (DayNo - 1);
                    ToDate := FromDate;
                    if (FromDate > PeriodEnd) then begin
                        FromDate := 0D;
                        ToDate := 0D;
                    end;
                end;

            ViewBy::Week:
                begin
                    FromDate := PeriodStart + (7 * (DayNo - 1));
                    if FromDate > PeriodEnd then begin
                        FromDate := 0D;
                        ToDate := 0D;
                        exit;
                    end;
                    ToDate := FromDate + 6;
                    if ToDate > PeriodEnd then
                        ToDate := PeriodEnd;
                end;

            ViewBy::Month,
            ViewBy::Year:
                begin
                    Year := DATE2DMY(PeriodStart, 3);
                    if (DayNo < 1) or (DayNo > 12) then
                        exit;
                    Month := DayNo;
                    FromDate := DMY2DATE(1, Month, Year);
                    ToDate := CALCDATE('<CM>', FromDate);
                    if (FromDate > PeriodEnd) then begin
                        FromDate := 0D;
                        ToDate := 0D;
                    end;
                end;
        end;
    end;

    local procedure SetDayStyle(DayNo: Integer)
    var
        FromDate: Date;
        ToDate: Date;
        Total: Decimal;
    begin
        DayStyle := '';

        GetBucketDateRange(DayNo, FromDate, ToDate);
        if (FromDate = 0D) or (ToDate = 0D) then
            exit;

        // 1º: si alguna línea del rango tiene Has Unapproved -> Attention (ámbar)
        TimeSummary.Reset();
        TimeSummary.SetRange("Resource No.", Rec."No.");
        TimeSummary.SetRange("Date", FromDate, ToDate);
        if not TimeSummary.FindSet() then
            exit;

        repeat
            if TimeSummary."Has Unapproved" then begin
                DayStyle := 'Attention';
                exit;
            end;
        until TimeSummary.Next() = 0;

        // 2º: si no hay pendientes, sumamos horas del rango
        Total := 0;
        TimeSummary.Reset();
        TimeSummary.SetRange("Resource No.", Rec."No.");
        TimeSummary.SetRange("Date", FromDate, ToDate);
        if TimeSummary.FindSet() then
            repeat
                Total += TimeSummary."Total Hours";
            until TimeSummary.Next() = 0;

        if Total > 8 then
            DayStyle := 'Unfavorable' // rojo
        else
            DayStyle := 'Standard';   // normal
    end;

    local procedure GetDayHours(DayNo: Integer): Decimal
    var
        FromDate: Date;
        ToDate: Date;
        Total: Decimal;
    begin
        SetDayStyle(DayNo);

        GetBucketDateRange(DayNo, FromDate, ToDate);
        if (FromDate = 0D) or (ToDate = 0D) then
            exit(0);

        Total := 0;
        TimeSummary.Reset();
        TimeSummary.SetRange("Resource No.", Rec."No.");
        TimeSummary.SetRange("Date", FromDate, ToDate);
        if TimeSummary.FindSet() then
            repeat
                Total += TimeSummary."Total Hours";
            until TimeSummary.Next() = 0;

        exit(Total);
    end;

    local procedure DrillDownDay(DayNo: Integer)
    var
        DayDate: Date;
    begin
        // Por ahora, solo permitimos drill-down en vista "Day"
        if ViewBy <> ViewBy::Day then begin
            Message('Drill-down is only available in Day view.');
            exit;
        end;

        DayDate := PeriodStart + (DayNo - 1);
        if (DayDate < PeriodStart) or (DayDate > PeriodEnd) then
            exit;

        TimeMgt.OpenDayDetail(Rec."No.", DayDate);
    end;
}
