pageextension 50007 ExtendsPostedPurchaseInvoice extends "Posted Purchase Invoice"
{

    layout
    {
        addafter("Purchaser Code")
        {

            field("Posting Description"; "Posting Description")
            {
                ApplicationArea = all;
                Caption = 'Posting Description';
                Editable = false;
            }
        }


    }


    actions
    {
        addafter(IncomingDocument)
        {
            action("Change Posting Description")
            {
                ApplicationArea = all;
                Caption = 'Change Posting Description';
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Clear(UpdateDescription);
                    UpdateDescription.UpdateDescr("No.", "Posting Date");
                    UpdateDescription.SetTableView(Rec);
                    UpdateDescription.SetRecord(Rec);
                    if UpdateDescription.RunModal = Action::ok then;


                end;



            }

        }

    }

    procedure ChangeLineDescription(LineNewDescription: Text[50]; LineDocumentNo: code[20]; LineNo: Integer)
    begin
        IF PurchInvLine.Get(LineDocumentNo, LineNo) AND (LineNewDescription <> '') then begin
            PurchInvLine.Description := LineNewDescription;
            PurchInvLine.Modify();
            CurrPage.Update(false);

        end;
    end;


    var
        myInt: Integer;
        PostedPurchInv: Record "Purch. Inv. Header";
        UpdateDescription: Page "Update Description";

        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";

        DocNo: Code[20];

}