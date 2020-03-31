tableextension 50013 ExtendPurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50003; "Sent to Vendor"; Boolean)
        {
            Caption = 'Sent to Vendor';
            Editable = false;
        }
        field(50004; "Ordered for"; Text[50])
        {
            Caption = 'Ordered for';
        }
        field(50005; "Package Tracking No."; Text[30])
        {

            Caption = 'Package Tracking No.';
        }
    }
    procedure GetTrackingInternetAddr(): Text
    var
        ShipmentMethod: Record "Shipment Method";
        TrackingInternetAddr: Text;
        HttpStr: Text;
    begin
        HttpStr := 'http://';
        TESTFIELD("Shipment Method Code");
        if ShipmentMethod.GET("Shipment Method Code") then begin
            TrackingInternetAddr := STRSUBSTNO(ShipmentMethod."Internet Address", "Package Tracking No.");

            IF STRPOS(TrackingInternetAddr, HttpStr) = 0 THEN
                TrackingInternetAddr := HttpStr + TrackingInternetAddr;
            EXIT(TrackingInternetAddr);
        end;

    end;

    procedure StartTrackingSite(PackageTrackingNo: Text[30])
    var
    begin
        IF PackageTrackingNo = '' THEN
            PackageTrackingNo := "Package Tracking No.";

        HYPERLINK(GetTrackingInternetAddr);
    end;

    var
        myInt: Integer;
}