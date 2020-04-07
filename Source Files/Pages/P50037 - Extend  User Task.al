pageextension 50037 ExtendUserTask extends "User Task Card" //MyTargetPageId
{
    layout
    {
        addbefore("Start DateTime")
        {
            field("Link Document No"; "Link Document No")
            {
                ApplicationArea = all;
            }
        }
    }

    actions

    {
        addbefore("Go To Task Item")
        {
            action("Open Document")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Open Related Document';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Open the Document that is associated with this task.';

                trigger OnAction()
                begin
                    OpenRelatedDocumentLinkl()
                end;
            }
        }


    }
    local procedure OpenRelatedDocumentLinkl()
    var
        ServiceHeader: Record "Service Header";
        Salesheader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
    begin
        case "Object ID" of
            5900:
                begin
                    if ServiceHeader.Get(ServiceHeader."Document Type"::Order, "Link Document No") then
                        Page.Run(Page::"Service Order", ServiceHeader);
                end;
            42:
                begin
                    if Salesheader.Get(Salesheader."Document Type"::Order, "Link Document No") then
                        Page.Run(Page::"Sales Order", Salesheader);
                end;
            56:
                begin

                    if PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, "Link Document No") then
                        Page.Run(Page::"Purchase Order", PurchaseHeader);
                end;
        end;
    end;
}
