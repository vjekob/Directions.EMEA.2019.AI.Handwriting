page 50101 "Handwriting Donation Card"
{
    Caption = 'Cash Donation Card';
    PageType = Card;
    SourceTable = "Handwriting Donation";

    layout
    {
        area(Content)
        {
            group(Donor)
            {
                Caption = 'Donor Contact Information';

                field("First Name"; "First Name") { }
                field("Last Name"; "Last Name") { }
                field(Address; Address) { }
                field(City; City) { }
                field("Home Phone"; "Home Phone") { }
                field("Cell Phone"; "Cell Phone") { }
                field(Email; Email) { }
            }

            group(Donation)
            {
                Caption = 'Donation Information';

                field("Donation Amount"; "Donation Amount") { }
                field("Donation Purpose"; "Donation Purpose") { }
            }
        }
    }
}