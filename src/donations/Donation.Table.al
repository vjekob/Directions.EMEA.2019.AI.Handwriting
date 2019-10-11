table 50100 "Handwriting Donation"
{
    Caption = 'Cash Donation';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';
        }

        field(3; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
        }

        field(4; Address; Text[100])
        {
            Caption = 'Address';
        }

        field(5; City; Text[100])
        {
            Caption = 'City';
        }

        field(6; "Home Phone"; Text[20])
        {
            Caption = 'Home Phone';
        }

        field(7; "Cell Phone"; Text[20])
        {
            Caption = 'Cell Phone';
        }

        field(8; "Email"; Text[250])
        {
            Caption = 'Email';
        }

        field(9; "Donation Amount"; Text[100])
        {
            Caption = 'Donation Amount';
        }

        field(10; "Donation Purpose"; Text[100])
        {
            Caption = 'Donation Purpose';
        }
    }
}