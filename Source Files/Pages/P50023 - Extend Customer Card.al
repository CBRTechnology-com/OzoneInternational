pageextension 50023 ExtendCustomerCard extends "Customer Card"
{
    layout
    {
        addfirst(Invoicing)
        {
            field("Bill for Service"; "Bill for Service")
            {
                ApplicationArea = All;
            }
        }
        addafter(Blocked)
        {
            field("FinPac Contract No."; "FinPac Contract No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}