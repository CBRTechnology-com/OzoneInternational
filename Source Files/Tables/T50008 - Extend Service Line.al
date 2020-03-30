tableextension 50008 ExtendServiceLine extends "Service Line"
{
    fields
    {
        field(50000; "Manufacturer Item No."; Code[20])
        {
            Description = 'GA00';
        }
        field(50001; "Vendor Item No."; Text[30])
        {
            Description = 'GA00';
        }

    }

    var
        myInt: Integer;
        ServHeader: Record "Service Header";
}