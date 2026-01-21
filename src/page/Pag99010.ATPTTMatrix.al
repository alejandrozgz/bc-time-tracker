page 99010 "ATP TT Matrix"
{
    Caption = 'Time Tracker Matrix';
    PageType = Worksheet;
    SourceTable = Resource;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

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
                        InitMatrix();
                        CurrPage.Update(false);
                    end;
                }
                field(ViewBy; ViewBy)
                {
                    Caption = 'View by';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        InitMatrix();
                        CurrPage.Update(false);
                    end;
                }
            }

            repeater(Matrix)
            {
                ShowCaption = false;
                Editable = false;
                FreezeColumn = "Resource Name"; // No. y Name fijos al hacer scroll

                field("Resource No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Resource';
                }
                field("Resource Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                // --- Columnas dinámicas 1..31 ---

                field(Field1; MATRIX_CellData[1])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[1];
                    StyleExpr = Style1;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(1);
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[2];
                    StyleExpr = Style2;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(2);
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[3];
                    StyleExpr = Style3;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(3);
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[4];
                    StyleExpr = Style4;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(4);
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[5];
                    StyleExpr = Style5;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(5);
                    end;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[6];
                    StyleExpr = Style6;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(6);
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[7];
                    StyleExpr = Style7;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(7);
                    end;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[8];
                    StyleExpr = Style8;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(8);
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[9];
                    StyleExpr = Style9;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(9);
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[10];
                    StyleExpr = Style10;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(10);
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[11];
                    StyleExpr = Style11;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(11);
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[12];
                    StyleExpr = Style12;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(12);
                    end;
                }
                field(Field13; MATRIX_CellData[13])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[13];
                    StyleExpr = Style13;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(13);
                    end;
                }
                field(Field14; MATRIX_CellData[14])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[14];
                    StyleExpr = Style14;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(14);
                    end;
                }
                field(Field15; MATRIX_CellData[15])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[15];
                    StyleExpr = Style15;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(15);
                    end;
                }
                field(Field16; MATRIX_CellData[16])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[16];
                    StyleExpr = Style16;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(16);
                    end;
                }
                field(Field17; MATRIX_CellData[17])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[17];
                    StyleExpr = Style17;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(17);
                    end;
                }
                field(Field18; MATRIX_CellData[18])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[18];
                    StyleExpr = Style18;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(18);
                    end;
                }
                field(Field19; MATRIX_CellData[19])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[19];
                    StyleExpr = Style19;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(19);
                    end;
                }
                field(Field20; MATRIX_CellData[20])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[20];
                    StyleExpr = Style20;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(20);
                    end;
                }
                field(Field21; MATRIX_CellData[21])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[21];
                    StyleExpr = Style21;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(21);
                    end;
                }
                field(Field22; MATRIX_CellData[22])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[22];
                    StyleExpr = Style22;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(22);
                    end;
                }
                field(Field23; MATRIX_CellData[23])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[23];
                    StyleExpr = Style23;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(23);
                    end;
                }
                field(Field24; MATRIX_CellData[24])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[24];
                    StyleExpr = Style24;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(24);
                    end;
                }
                field(Field25; MATRIX_CellData[25])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[25];
                    StyleExpr = Style25;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(25);
                    end;
                }
                field(Field26; MATRIX_CellData[26])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[26];
                    StyleExpr = Style26;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(26);
                    end;
                }
                field(Field27; MATRIX_CellData[27])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[27];
                    StyleExpr = Style27;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(27);
                    end;
                }
                field(Field28; MATRIX_CellData[28])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[28];
                    StyleExpr = Style28;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(28);
                    end;
                }
                field(Field29; MATRIX_CellData[29])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[29];
                    StyleExpr = Style29;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(29);
                    end;
                }
                field(Field30; MATRIX_CellData[30])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[30];
                    StyleExpr = Style30;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(30);
                    end;
                }
                field(Field31; MATRIX_CellData[31])
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[31];
                    StyleExpr = Style31;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MATRIX_OnDrillDown(31);
                    end;
                }
            }
        }
    }

    var
        TimeMgt: Codeunit "ATP TT Time Mgt.";
        PeriodStart: Date;
        PeriodEnd: Date;
        ViewBy: Enum "ATP TT View By"; // Day / Week / Month / Year

        MATRIX_CellData: array[31] of Decimal;
        MATRIX_CaptionSet: array[31] of Text[80];
        MATRIX_ColFromDate: array[31] of Date;
        MATRIX_ColToDate: array[31] of Date;
        MATRIX_CurrentNoOfColumns: Integer;

        Style1: Text[30];
        Style2: Text[30];
        Style3: Text[30];
        Style4: Text[30];
        Style5: Text[30];
        Style6: Text[30];
        Style7: Text[30];
        Style8: Text[30];
        Style9: Text[30];
        Style10: Text[30];
        Style11: Text[30];
        Style12: Text[30];
        Style13: Text[30];
        Style14: Text[30];
        Style15: Text[30];
        Style16: Text[30];
        Style17: Text[30];
        Style18: Text[30];
        Style19: Text[30];
        Style20: Text[30];
        Style21: Text[30];
        Style22: Text[30];
        Style23: Text[30];
        Style24: Text[30];
        Style25: Text[30];
        Style26: Text[30];
        Style27: Text[30];
        Style28: Text[30];
        Style29: Text[30];
        Style30: Text[30];
        Style31: Text[30];

    trigger OnOpenPage()
    begin
        ViewBy := ViewBy::Day;
        PeriodStart := DMY2DATE(1, DATE2DMY(Today(), 2), DATE2DMY(Today(), 3)); // primer día mes actual
        InitMatrix();
    end;

    trigger OnAfterGetRecord()
    var
        Col: Integer;
    begin
        for Col := 1 to MATRIX_CurrentNoOfColumns do
            MATRIX_OnAfterGetRecord(Col);
    end;

    local procedure InitMatrix()
    var
        i: Integer;
    begin
        // Limpiar toda la matriz y estilos antes de inicializar la vista
        for i := 1 to 31 do begin
            MATRIX_CellData[i] := 0;
            MATRIX_CaptionSet[i] := '';
            MATRIX_ColFromDate[i] := 0D;
            MATRIX_ColToDate[i] := 0D;
        end;

        Style1 := '';
        Style2 := '';
        Style3 := '';
        Style4 := '';
        Style5 := '';
        Style6 := '';
        Style7 := '';
        Style8 := '';
        Style9 := '';
        Style10 := '';
        Style11 := '';
        Style12 := '';
        Style13 := '';
        Style14 := '';
        Style15 := '';
        Style16 := '';
        Style17 := '';
        Style18 := '';
        Style19 := '';
        Style20 := '';
        Style21 := '';
        Style22 := '';
        Style23 := '';
        Style24 := '';
        Style25 := '';
        Style26 := '';
        Style27 := '';
        Style28 := '';
        Style29 := '';
        Style30 := '';
        Style31 := '';

        MATRIX_CurrentNoOfColumns := 0;

        case ViewBy of
            ViewBy::Day:
                InitDayMatrix();
            ViewBy::Week:
                InitWeekMatrix();
            ViewBy::Month:
                InitMonthMatrix();
            ViewBy::Year:
                InitYearMatrix();
        end;
    end;

    // Día: mes de PeriodStart, usando tabla Date para nombre de día + fecha completa
    local procedure InitDayMatrix()
    var
        i: Integer;
        DayDate: Date;
        DateRec: Record Date;
        DayName: Text[30];
        DateText: Text[30];
    begin
        PeriodEnd := CALCDATE('<CM>', PeriodStart); // fin de mes
        MATRIX_CurrentNoOfColumns := 0;

        for i := 1 to 31 do begin
            DayDate := PeriodStart + (i - 1);
            if DayDate > PeriodEnd then
                exit;

            MATRIX_CurrentNoOfColumns += 1;
            MATRIX_ColFromDate[i] := DayDate;
            MATRIX_ColToDate[i] := DayDate;

            // Obtener nombre de día desde tabla Date (Period Name)
            Clear(DayName);
            DateRec.Reset();
            DateRec.SetRange("Period Type", DateRec."Period Type"::Date);
            DateRec.SetRange("Period Start", DayDate);
            if DateRec.FindFirst() then
                DayName := DateRec."Period Name"
            else
                // Fallback si la tabla Date no está poblada
                DayName := Format(DayDate, 0, '<Weekday Text>');

            // Fecha completa tipo 01/12/2025
            DateText := Format(DayDate, 0, '<Day,2>/<Month,2>/<Year4>');

            // Ejemplo: "Monday 01/12/2025" o "Lunes 01/12/2025"
            MATRIX_CaptionSet[i] := StrSubstNo('%1 %2', DayName, DateText);
        end;
    end;

    // Semanas: próximos 31 bloques de 7 días desde PeriodStart, usando nº real de semana del año
    local procedure InitWeekMatrix()
    var
        i: Integer;
        FromDate: Date;
        ToDate: Date;
        WeekNo: Integer;
        Year: Integer;
        WeekNoText: Text[10];
    begin
        MATRIX_CurrentNoOfColumns := 31;

        for i := 1 to 31 do begin
            FromDate := PeriodStart + (7 * (i - 1));
            ToDate := FromDate + 6;

            MATRIX_ColFromDate[i] := FromDate;
            MATRIX_ColToDate[i] := ToDate;

            // Nº de semana real del año
            WeekNo := DATE2DWY(FromDate, 2); // 2 = Week No.
            Year := DATE2DWY(FromDate, 3);   // 3 = Year

            // Semana con 2 dígitos: 01, 02, ...
            WeekNoText := Format(WeekNo, 0, '<Integer,2>');

            // Ejemplo: "W01 2025", "W23 2025"
            MATRIX_CaptionSet[i] := StrSubstNo('W%1 %2', WeekNoText, Year);
        end;
    end;

    // Meses: próximos 31 meses completos desde el mes de PeriodStart
    local procedure InitMonthMatrix()
    var
        i: Integer;
        BaseMonth: Integer;
        BaseYear: Integer;
        CurrMonth: Integer;
        CurrYear: Integer;
        FromDate: Date;
        ToDate: Date;
        MonthCaption: array[12] of Text[3];
    begin
        MonthCaption[1] := 'Jan';
        MonthCaption[2] := 'Feb';
        MonthCaption[3] := 'Mar';
        MonthCaption[4] := 'Apr';
        MonthCaption[5] := 'May';
        MonthCaption[6] := 'Jun';
        MonthCaption[7] := 'Jul';
        MonthCaption[8] := 'Aug';
        MonthCaption[9] := 'Sep';
        MonthCaption[10] := 'Oct';
        MonthCaption[11] := 'Nov';
        MonthCaption[12] := 'Dec';

        BaseMonth := DATE2DMY(PeriodStart, 2);
        BaseYear := DATE2DMY(PeriodStart, 3);

        MATRIX_CurrentNoOfColumns := 31;

        for i := 1 to 31 do begin
            CurrMonth := BaseMonth + (i - 1);
            CurrYear := BaseYear;

            while CurrMonth > 12 do begin
                CurrMonth -= 12;
                CurrYear += 1;
            end;

            FromDate := DMY2DATE(1, CurrMonth, CurrYear);
            ToDate := CALCDATE('<CM>', FromDate);

            MATRIX_ColFromDate[i] := FromDate;
            MATRIX_ColToDate[i] := ToDate;
            MATRIX_CaptionSet[i] := StrSubstNo('%1 %2', MonthCaption[CurrMonth], CurrYear); // Jan 2025, Feb 2025, ...
        end;
    end;

    // Años: próximos 31 años desde el año de PeriodStart
    local procedure InitYearMatrix()
    var
        i: Integer;
        BaseYear: Integer;
        CurrYear: Integer;
        FromDate: Date;
        ToDate: Date;
    begin
        BaseYear := DATE2DMY(PeriodStart, 3);

        MATRIX_CurrentNoOfColumns := 31;

        for i := 1 to 31 do begin
            CurrYear := BaseYear + (i - 1);

            FromDate := DMY2DATE(1, 1, CurrYear);
            ToDate := DMY2DATE(31, 12, CurrYear);

            MATRIX_ColFromDate[i] := FromDate;
            MATRIX_ColToDate[i] := ToDate;
            MATRIX_CaptionSet[i] := Format(CurrYear); // "2025", "2026", ...
        end;
    end;

    local procedure MATRIX_OnAfterGetRecord(Col: Integer)
    var
        Total: Decimal;
        FromDate: Date;
        ToDate: Date;
        TmpSummary: Record "ATP TT Time Summary" temporary;
        ColStyle: Text[30];
        Threshold: Decimal;
    begin
        MATRIX_CellData[Col] := 0;
        ColStyle := '';

        FromDate := MATRIX_ColFromDate[Col];
        ToDate := MATRIX_ColToDate[Col];
        if (FromDate = 0D) or (ToDate = 0D) then
            exit;

        // Recalcula siempre según ViewBy/PeriodStart para este recurso y rango
        TimeMgt.BuildSummary(TmpSummary, FromDate, ToDate, Rec."No.");

        if TmpSummary.FindSet() then
            repeat
                Total += TmpSummary."Total Hours";
            until TmpSummary.Next() = 0;

        MATRIX_CellData[Col] := Total;

        // Prioridad: si hay pendientes -> Attention
        TmpSummary.Reset();
        TmpSummary.SetRange("Resource No.", Rec."No.");
        TmpSummary.SetRange("Date", FromDate, ToDate);
        TmpSummary.SetRange("Has Unapproved", true);
        if TmpSummary.FindFirst() then
            ColStyle := 'Ambiguous'
        else begin
            // Umbral rojo según vista
            case ViewBy of
                ViewBy::Day:
                    Threshold := 8;       // 8h día
                ViewBy::Week:
                    Threshold := 40;      // 40h semana
                ViewBy::Month:
                    Threshold := 160;     // 160h mes
                ViewBy::Year:
                    Threshold := 1920;    // 160*12 año
                else
                    Threshold := 0;
            end;

            if (Threshold > 0) and (Total > Threshold) then
                ColStyle := 'Unfavorable'
            else
                ColStyle := 'Favorable';
        end;

        // Asignar estilo a la variable correcta
        case Col of
            1:
                Style1 := ColStyle;
            2:
                Style2 := ColStyle;
            3:
                Style3 := ColStyle;
            4:
                Style4 := ColStyle;
            5:
                Style5 := ColStyle;
            6:
                Style6 := ColStyle;
            7:
                Style7 := ColStyle;
            8:
                Style8 := ColStyle;
            9:
                Style9 := ColStyle;
            10:
                Style10 := ColStyle;
            11:
                Style11 := ColStyle;
            12:
                Style12 := ColStyle;
            13:
                Style13 := ColStyle;
            14:
                Style14 := ColStyle;
            15:
                Style15 := ColStyle;
            16:
                Style16 := ColStyle;
            17:
                Style17 := ColStyle;
            18:
                Style18 := ColStyle;
            19:
                Style19 := ColStyle;
            20:
                Style20 := ColStyle;
            21:
                Style21 := ColStyle;
            22:
                Style22 := ColStyle;
            23:
                Style23 := ColStyle;
            24:
                Style24 := ColStyle;
            25:
                Style25 := ColStyle;
            26:
                Style26 := ColStyle;
            27:
                Style27 := ColStyle;
            28:
                Style28 := ColStyle;
            29:
                Style29 := ColStyle;
            30:
                Style30 := ColStyle;
            31:
                Style31 := ColStyle;
        end;
    end;

    local procedure MATRIX_OnDrillDown(Col: Integer)
    var
        FromDate: Date;
        ToDate: Date;
    begin
        FromDate := MATRIX_ColFromDate[Col];
        ToDate := MATRIX_ColToDate[Col];

        if (FromDate = 0D) or (ToDate = 0D) then
            exit;

        case ViewBy of
            ViewBy::Day:
                begin
                    TimeMgt.OpenDayDetail(Rec."No.", FromDate);
                end;
            ViewBy::Week,
            ViewBy::Month,
            ViewBy::Year:
                begin
                    TimeMgt.OpenPeriodDetail(Rec."No.", FromDate, ToDate);
                end;
        end;
    end;
}
