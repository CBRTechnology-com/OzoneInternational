page 50008 "Update Description"
{
    PageType = StandardDialog;
    UsageCategory = Administration;
    SourceTable = "Purch. Inv. Header";
    Permissions = tabledata 122 = rmid, tabledata 123 = rmid, tabledata 25 = rmid, tabledata 17 = rmid;

    layout
    {
        area(Content)
        {
            group("Update Purch. Invoice Header Description")
            {
                field(UpdatePostDescription; UpdatePostDescription)
                {
                    ApplicationArea = All;
                    Caption = 'Change Description';
                    Editable = true;

                }

            }
        }
    }

    actions
    {

    }

    procedure UpdateDescr(DocNo: Code[20]; PostingDate: Date)
    begin
        GlobalDocNumber := DocNo;
        GlobalPostingDate := PostingDate;
    end;

    procedure ChangeDescription(FromNewDescription: Text[50]; GlobalDocNumber: code[20])
    begin

        IF PurchInvHeader.Get(GlobalDocNumber) AND (FromNewDescription <> '') then begin
            PurchInvHeader."Posting Description" := FromNewDescription;
            PurchInvHeader.Modify();
            CurrPage.Update(false);

        end;
        // Update the General Ledger Entry description
        GLEntry.Reset();
        GLEntry.SetRange("Document No.", GlobalDocNumber);
        GLEntry.SetRange("Posting Date", GlobalPostingDate);
        GLEntry.SetRange("Document Type", GLEntry."Document Type"::Invoice);
        if GLEntry.FindSet() then
            GLEntry.ModifyAll(Description, FromNewDescription);
        // Update the Vendor Ledger Entry description
        VendorLedgerENtry.Reset();
        VendorLedgerENtry.SetRange("Document No.", GlobalDocNumber);
        VendorLedgerENtry.SetRange("Posting Date", GlobalPostingDate);
        if VendorLedgerENtry.FindSet() then
            VendorLedgerENtry.ModifyAll(Description, FromNewDescription);

    end;

    var
        myInt: Integer;
        GlobalDocNumber: Code[20];
        GlobalPostingDate: Date;
        UpdatePostDescription: Text[50];
        PurchInvHeader: Record "Purch. Inv. Header";
        VendorLedgerENtry: Record "Vendor Ledger Entry";
        GLEntry: Record "G/L Entry";



    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction IN [ACTION::OK, Action::LookupOK] then
            ChangeDescription(UpdatePostDescription, GlobalDocNumber);

    end;

    trigger OnOpenPage()
    begin
        Clear(UpdatePostDescription);
    end;

}