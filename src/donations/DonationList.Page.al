page 50100 "Handwriting Donation List"
{
    Caption = 'Cash Donation List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Handwriting Donation";
    CardPageId = "Handwriting Donation Card";

    layout
    {
        area(Content)
        {
            repeater(Donations)
            {
                field("Entry No."; "Entry No.") { }
                field("First Name"; "First Name") { }
                field("Last Name"; "Last Name") { }
                field("Donation Amount"; "Donation Amount") { }
                field("Donation Purpose"; "Donation Purpose") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Scan)
            {
                Caption = 'Scan Donation Form';
                Image = Form;
                Promoted = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction();
                var
                    TempBlob: Codeunit "Temp Blob";
                    FileMng: Codeunit "File Management";
                    ComputerVisionMgt: Codeunit "Computer Vision Management";
                    Content: Text;
                    Regex: Codeunit DotNet_Regex;
                    Match: Codeunit DotNet_Match;
                    Groups: Codeunit DotNet_GroupCollection;
                    Group: Codeunit DotNet_Group;
                    IncorrectForm: Label 'Could not scan the incoming form: %1.';
                    Donation: Record "Handwriting Donation";
                begin
                    FileMng.BLOBImportWithFilter(TempBlob, 'Choose file', '', 'Images only|*.jpg', '*.jpg');
                    Content := ComputerVisionMgt.RecognizeHandwriting(TempBlob);

                    Regex.Regex('Cash Donation Form\\First Name\\(?''first''.*?)\\?Last Name\\(?''last''.*?)\\?Address\\(?''address''.*?)\\?Home Phone\\(?''homephone''.*?)\\?Cell Phone\s?(?''cellphone''.*?)\\?Email\\(?''email''.*?)\\?Enclosed is my tax-deductible gift of E(?''donation''.*?)\\?I would like my donation applied toward\:\\(?''purpose''.*?)\\?Please make checks\, corporate matches\, and other donations payable to');
                    Regex.Match(Content, Match);
                    if not Match.Success() then
                        Error(IncorrectForm, GetLastErrorText);

                    Match.Groups(Groups);
                    Groups.ItemGroupName('first', Group);
                    Donation."First Name" := Group.Value();
                    Groups.ItemGroupName('last', Group);
                    Donation."Last Name" := Group.Value();
                    Groups.ItemGroupName('address', Group);
                    Donation.Address := Group.Value();
                    Groups.ItemGroupName('homephone', Group);
                    Donation."Home Phone" := Group.Value();
                    Groups.ItemGroupName('cellphone', Group);
                    Donation."Cell Phone" := Group.Value();
                    Groups.ItemGroupName('email', Group);
                    Donation.Email := Group.Value();
                    Groups.ItemGroupName('donation', Group);
                    Donation."Donation Amount" := Group.Value();
                    Groups.ItemGroupName('purpose', Group);
                    Donation."Donation Purpose" := Group.Value();

                    Donation.Insert();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}