// codeunit 99001 "ATP Time Tracker Billing Mgt"
// {
//     procedure CreatePurchaseInvoiceForResource(ResourceNo: Code[20]; FromDate: Date; ToDate: Date)
//     var
//         Resource: Record Resource;
//         Vendor: Record Vendor;
//         PurchHeader: Record "Purchase Header";
//         PurchLine: Record "Purchase Line";
//         ResLedgEntry: Record "Res. Ledger Entry";
//         LineNo: Integer;
//         TotalHours: Decimal;
//         CurrentWorkType: Code[10];
//         LastWorkType: Code[10];
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         PurchPaySetup: Record "Purchases & Payables Setup";
//     begin
//         // Validar que el recurso exista y tenga proveedor asociado
//         if not Resource.Get(ResourceNo) then
//             Error('El recurso %1 no existe.', ResourceNo);

//         if Resource."Vendor No." = '' then
//             Error('El recurso %1 no tiene un proveedor asociado.', ResourceNo);

//         Vendor.Get(Resource."Vendor No.");

//         // Crear cabecera de factura de compra
//         PurchHeader.Init();
//         PurchHeader."Document Type" := PurchHeader."Document Type"::Invoice;
//         PurchHeader.Validate("Buy-from Vendor No.", Vendor."No.");
//         PurchHeader.Validate("Posting Date", WorkDate()); // O usa ToDate si prefieres
//         PurchHeader.Validate("Document Date", ToDate);

//         // Asignar serie de numeración desde configuración
//         PurchPaySetup.Get();
//         PurchHeader."No." := NoSeriesMgt.GetNextNo(PurchPaySetup."Invoice Nos.", WorkDate(), true);

//         PurchHeader.Insert(true);

//         // Preparar filtros para entradas de registro de recursos (horas publicadas desde hojas de tiempo)
//         ResLedgEntry.SetCurrentKey("Resource No.", "Work Type Code", "Posting Date");
//         ResLedgEntry.SetRange("Resource No.", ResourceNo);
//         ResLedgEntry.SetRange("Posting Date", FromDate, ToDate);
//         ResLedgEntry.SetRange("Entry Type", ResLedgEntry."Entry Type"::Usage); // Solo uso (horas trabajadas)

//         // Inicializar variables para agrupación
//         LineNo := 10000;
//         TotalHours := 0;
//         LastWorkType := '';

//         if ResLedgEntry.FindSet() then
//             repeat
//                 CurrentWorkType := ResLedgEntry."Work Type Code";

//                 // Si cambia el tipo de trabajo, crear línea para el anterior grupo
//                 if (CurrentWorkType <> LastWorkType) and (LastWorkType <> '') then begin
//                     CreatePurchLine(PurchHeader, ResourceNo, LastWorkType, TotalHours, LineNo);
//                     TotalHours := 0;
//                 end;

//                 TotalHours += ResLedgEntry.Quantity;
//                 LastWorkType := CurrentWorkType;
//             until ResLedgEntry.Next() = 0;

//         // Crear la última línea si hay datos
//         if LastWorkType <> '' then
//             CreatePurchLine(PurchHeader, ResourceNo, LastWorkType, TotalHours, LineNo);

//         // Si no hay horas, opcional: eliminar la cabecera o advertir
//         if LineNo = 10000 then begin
//             PurchHeader.Delete(true);
//             Message('No hay horas registradas para el recurso %1 en el período %2 a %3.', ResourceNo, FromDate, ToDate);
//         end else
//             Message('Factura de compra %1 creada para el recurso %2.', PurchHeader."No.", ResourceNo);
//     end;

//     local procedure CreatePurchLine(var PurchHeader: Record "Purchase Header"; ResourceNo: Code[20]; WorkTypeCode: Code[10]; Hours: Decimal; var LineNo: Integer)
//     var
//         PurchLine: Record "Purchase Line";
//         WorkType: Record "Work Type";
//         DescriptionTxt: Text[100];
//     begin
//         PurchLine.Init();
//         PurchLine."Document Type" := PurchHeader."Document Type";
//         PurchLine."Document No." := PurchHeader."No.";
//         PurchLine."Line No." := LineNo;

//         // Tipo de línea: Recurso (para horas de contratistas)
//         PurchLine.Type := PurchLine.Type::Resource;
//         PurchLine.Validate("No.", ResourceNo);

//         // Aplicar tipo de trabajo para tasa variable (precio se calcula automáticamente desde recurso/tipo de trabajo)
//         //if WorkTypeCode <> '' then
//         //    PurchLine.Validate("Work Type Code", WorkTypeCode);

//         // Cantidad = horas totales
//         PurchLine.Validate(Quantity, Hours);

//         // Descripción: "Horas trabajadas [tipo] - [mes/año]"
//         DescriptionTxt := StrSubstNo('Horas trabajadas %1 - %2/%3', WorkTypeCode, Date2DMY(PurchHeader."Document Date", 2), Date2DMY(PurchHeader."Document Date", 3));
//         PurchLine.Description := CopyStr(DescriptionTxt, 1, MaxStrLen(PurchLine.Description));

//         // Insertar línea
//         PurchLine.Insert(true);

//         LineNo += 10000;
//     end;
// }
