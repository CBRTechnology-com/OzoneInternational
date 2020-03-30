table 50010 "Inventory Site Status"
{
    DataClassification = ToBeClassified;
    Caption = 'Inventory Site Status';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
        }
        field(2; Description; Text[250])
        {
            Caption = 'Item Description';
        }
        field(3; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base UofM';
        }
        field(4; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(5; "Quantity On Hand"; Decimal)
        {
            Caption = 'Quantity On Hand';
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(Key1; "Item No.", "Location Code")
        {

        }
    }

    var
        myInt: Integer;
        ItemFilter: Text;
        ShowDialog: Dialog;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure FillTempTable()
    var
        LocByInventory: Query "Inventory Site Status Query";
        Itemrec: Record Item;
        LocByInventoryStatus: Record "Inventory Site Status";
    begin
        DeleteAll;
        if ItemFilter <> '' then
            LocByInventory.SetFilter(LocByInventory.Item_No, ItemFilter);
        ShowDialog.Open('Processing data ..');
        LocByInventory.Open;
        while LocByInventory.Read do begin
            LocByInventoryStatus.Init;
            LocByInventoryStatus."Item No." := LocByInventory.Item_No;
            LocByInventoryStatus."Location Code" := LocByInventory.Location_Code;

            LocByInventoryStatus."Quantity On Hand" := LocByInventory.Sum_Qty_Base;

            if Itemrec.Get(LocByInventory.Item_No) then begin
                LocByInventoryStatus.Description := Itemrec.Description;
                LocByInventoryStatus."Base Unit of Measure" := Itemrec."Base Unit of Measure";
            end;
            if LocByInventoryStatus.Insert then;
        end;
        ShowDialog.Close;
    end;

}