page 50024 "Inventory Site Status"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Inventory Site Status";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                    Caption = 'Item Description';
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                    ApplicationArea = All;
                    Caption = 'Base UofM';
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                }
                field("Quantity On Hand"; "Quantity On Hand")
                {
                    ApplicationArea = All;
                    Caption = 'Qty On Hand';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin

        FillTempTable;
    end;

}