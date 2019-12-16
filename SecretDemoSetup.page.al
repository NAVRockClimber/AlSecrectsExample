page 70000 "Secret Demo Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Secret Demo Setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Function URL"; "Function URL")
                {
                    ApplicationArea = All;
                }

                field("Access Key Code"; "Access Key Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(UpdateKey)
            {
                Image = UpdateXML;
                Caption = 'Update Access Key';
                ApplicationArea = All;

                trigger OnAction()
                var
                    SecretHelper: Codeunit "Secret Helper";
                begin
                    SecretHelper.UpdateSecret();
                end;
            }

            action(DeleteKey)
            {
                Image = Delete;
                Caption = 'Delete Access Key';
                ApplicationArea = All;

                trigger OnAction()
                var
                    SecretHelper: Codeunit "Secret Helper";
                begin
                    TestField("Access Key Code");
                    SecretHelper.DeleteSecret("Access Key Code");
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not get() then begin
            Insert();
        end;
    end;
}