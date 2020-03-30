pageextension 50025 ExtendItemList extends "Item List"
{
    layout
    {

    }

    actions
    {
        addafter("Item Reclassification Journal")
        {
            action("Inventory Site Status")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = Journals;
                RunObject = page "Inventory Site Status";

            }


        }

    }

    var
        myInt: Integer;
}