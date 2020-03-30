query 50001 "Inventory Site Status Query"
{
    Caption = 'Inventory Site Status Query';
    OrderBy = Ascending(Item_No), Ascending(Location_Code);
    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            column(Item_No; "Item No.")
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(Sum_Qty_Base; "Quantity")
            {
                ColumnFilter = Sum_Qty_Base = FILTER(<> 0);
                Method = Sum;
            }
        }
    }
}
