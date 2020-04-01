codeunit 50001 ExtendEventsCBR
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Sending Profile", 'OnAfterSendVendor', '', true, true)]
    local procedure UpdateSentToVendor(ReportUsage: Integer; RecordVariant: Variant; DocNo: Code[20]; ToVendor: Code[20]; DocName: Text[150]; VendorNoFieldNo: Integer; DocumentNoFieldNo: Integer)
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        If PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, DocNo) then begin
            PurchaseHeader."Sent to Vendor" := true;
            PurchaseHeader.Modify(false);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", 'OnBeforeSendEmail', '', true, true)]
    local procedure UpdateCCValue(VAR TempEmailItem: Record "Email Item"; VAR IsFromPostedDoc: Boolean; VAR PostedDocNo: Code[20]; VAR HideDialog: Boolean; VAR ReportUsage: Integer)
    var
        SalesHeader: Record "Sales Header";
        SalesInvHeader: Record "Sales Invoice Header";
        PurchaseHeader: Record "Purchase Header";
        PurchInvHeader: Record "Purch. Inv. Header";
        ServiceHeader: Record "Service Header";
        ServiceInvHeader: Record "Service Invoice Header";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";

    begin
        SalesReceivablesSetup.Get();
        PurchasesPayablesSetup.Get();

        if SalesHeader.get(SalesHeader."Document Type"::Order, PostedDocNo) then
            TempEmailItem."Send CC" := SalesReceivablesSetup."Ozone Defualt Address"
        else
            if SalesHeader.get(SalesHeader."Document Type"::Quote, PostedDocNo) then
                TempEmailItem."Send CC" := SalesReceivablesSetup."Ozone Defualt Address"
            else
                if SalesHeader.get(SalesHeader."Document Type"::Invoice, PostedDocNo) then
                    TempEmailItem."Send CC" := SalesReceivablesSetup."Ozone Defualt Address";

        If SalesInvHeader.Get(PostedDocNo) then
            TempEmailItem."Send CC" := SalesReceivablesSetup."Ozone Defualt Address";

        If PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, PostedDocNo) then
            TempEmailItem."Send CC" := PurchasesPayablesSetup."Ozone Defualt Address";

        If PurchInvHeader.Get(PostedDocNo) then
            TempEmailItem."Send CC" := PurchasesPayablesSetup."Ozone Defualt Address";

        if ServiceHeader.get(ServiceHeader."Document Type"::Order, PostedDocNo) then
            TempEmailItem."Send CC" := SalesReceivablesSetup."Ozone Defualt Address"
        else
            if ServiceHeader.get(ServiceHeader."Document Type"::Quote, PostedDocNo) then
                TempEmailItem."Send CC" := SalesReceivablesSetup."Ozone Defualt Address"
            else
                if ServiceHeader.get(ServiceHeader."Document Type"::Invoice, PostedDocNo) then
                    TempEmailItem."Send CC" := SalesReceivablesSetup."Ozone Defualt Address";

        If ServiceInvHeader.Get(PostedDocNo) then
            TempEmailItem."Send CC" := SalesReceivablesSetup."Ozone Defualt Address";

    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Service-Post", 'OnBeforePostWithLines', '', true, true)]
    local procedure UpdateShipToCode5980(VAR PassedServHeader: Record "Service Header"; VAR PassedServLine: Record "Service Line"; VAR PassedShip: Boolean; VAR PassedConsume: Boolean; VAR PassedInvoice: Boolean)
    begin
        PassedServHeader.TestField("Ship-to Code");
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::Customer, 'OnAfterValidateEvent', 'Bill for Service', true, true)]
    local procedure BillOfServiceOnAfterValidate(var Rec: Record Customer; var xRec: Record Customer; CurrFieldNo: Integer);
    var
        ServLine: Record "Service Line";
    begin
        //GA09 - Offer to update the lines
        if Rec."Bill for Service" <> xRec."Bill for Service" then begin
            ServLine.SETRANGE("Customer No.", Rec."No.");
            ServLine.SETFILTER("Outstanding Quantity", '<>0');
            if not ServLine.ISEMPTY then
                MESSAGE('There are open service orders for this customer.  Open orders must be changed manually.');
        end;
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::"Service Header", 'OnAfterValidateEvent', 'Bill for Service', true, true)]
    local procedure BillForServiceOnAfterValidateServiceHeader(var Rec: Record "Service Header"; var xRec: Record "Service Header"; CurrFieldNo: Integer);
    var
        UserSetup: Record User;
        AccessControl: Record "Access Control";
        ServLine: Record "Service Line";
    begin
        with Rec do begin
            // OZI0001 >>
            UserSetup.SETRANGE("User Name", USERID);
            if UserSetup.FINDFIRST then begin
                //message(format(usersetup));
                AccessControl.SETRANGE("User Security ID", UserSetup."User Security ID");
                //message(format(AccessControl));
                AccessControl.SETFILTER("Role ID", 'SUPER|_BILLFORSERVICE');
                //message(format(AccessControl));
                if AccessControl.FINDFIRST() then begin
                    //GA09 - Offer to update the lines
                    if "Bill for Service" <> xRec."Bill for Service" then begin
                        MODIFY;
                        ServLine.RESET;
                        ServLine.SETRANGE("Document Type", "Document Type");
                        ServLine.SETRANGE("Document No.", "No.");
                        ServLine.SETFILTER("Outstanding Quantity", '<>0');
                        if ServLine.FINDFIRST then
                            if CONFIRM('Open Service Lines exist.  Do you want to change the billing of the existing lines?') then
                                repeat
                                    ServLine.InitQtyToShip;
                                    ServLine.MODIFY;
                                until ServLine.NEXT = 0;
                    end;
                end else begin
                    if xRec."Bill for Service" <> false then begin
                        //"Bill for Service" := True;
                        ERROR('You do not have the proper permissions to make this update.');
                    end;
                end;
            end;
            //Org Code
            //GA09 - Offer to update the lines
            /*
             IF "Bill for Service" <> xRec."Bill for Service" THEN
             BEGIN
               MODIFY;
               ServLine.RESET;
               ServLine.SETRANGE("Document Type","Document Type");
               ServLine.SETRANGE("Document No.","No.");
               ServLine.SETFILTER("Outstanding Quantity", '<>0');
               IF ServLine.FINDFIRST THEN
                 IF CONFIRM('Open Service Lines exist.  Do you want to change the billing of the existing lines?') THEN
                   REPEAT
                     ServLine.InitQtyToShip;
                     ServLine.MODIFY;
                   UNTIL ServLine.NEXT = 0;
             END;
           */
        end;

    end;




    // [EventSubscriber(ObjectType::Page, page::"Service Order", 'OnBeforeActionEvent', 'Post and &Print', false, false)]
    // local procedure OnBeforePostandPrintAssignedIDErrorServOrder(var Rec: Record "Service Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    // [EventSubscriber(ObjectType::Page, page::"Service Order", 'OnBeforeActionEvent', 'PostBatch', false, false)]
    // local procedure OnBeforePostandBatchAssignedIDErrorServOrder(var Rec: Record "Service Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    [EventSubscriber(ObjectType::Page, page::"service order", 'OnAfterActionEvent', 'EMailDocument', false, false)]
    local procedure EmailEventServOrder(var Rec: Record "Service Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        //CLEAR(EmailCu);
        //EmailCu.CreateEmails(Rec."Document Type", Rec."No.", false, true);
    end;

    // [EventSubscriber(ObjectType::Page, page::"Service Order", 'OnBeforeActionEvent', 'Post', false, false)]
    // local procedure OnBeforePostAssignedIDErrorServOrder(var Rec: Record "Service Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    [EventSubscriber(ObjectType::Page, page::"Posted Service Invoices", 'OnAfterActionEvent', 'EMailDocument', false, false)]
    local procedure EmailEventPostedServInvoices(var Rec: Record "Service Invoice Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(7, Rec."No.", false, true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Req. Wksh.-Make Order", 'OnAfterInsertPurchOrderHeader', '', true, true)]
    local procedure OnAfterInsertPurchOrderHeader(VAR RequisitionLine: Record "Requisition Line"; VAR PurchaseOrderHeader: Record "Purchase Header"; CommitIsSuppressed: Boolean)
    begin
        PurchaseOrderHeader."Ordered for" := RequisitionLine."Ordered for";
    end;


}