pageextension 50021 ExtendServiceItemCompList extends "Service Item Component List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Copy from BOM")
        {
            action("Copy from Output")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Copy from &Output';
                Image = OutputJournal;
            }
        }
    }

    var
        myInt: Integer;
}