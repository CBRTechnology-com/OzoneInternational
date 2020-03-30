pageextension 50011 ExtendServiceOrderSub extends "Service Order Subform"
{
    layout
    {
        addafter("No. of Previous Services")
        {
            field("Item Cat. Code"; "Item Cat. Code")
            {
                ApplicationArea = all;
            }
            field("Product Group Code"; "Product Group Code")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addafter(Dimensions)
        {
            action("Service Item PM Codes")
            {
                Caption = 'Service Item PM Codes';
                ApplicationArea = All;
            }
        }
    }

    var
        myInt: Integer;
}