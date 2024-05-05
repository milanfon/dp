Open Browser To http://localhost:4680/tbuis/index.jsp

Set Window Size  1501  104

Click Element   aria/Login

Input Text    aria/Username    pedant
Input Text    aria/Password    pass
Click Element    aria/Login[role="button"]

Click Element    aria/My Subjects

Click Element    aria/Students (4)[role="button"]

Click Element    id=closeModalButtonCross

Click Element    id=tea.mySubjects.table.listOfStudentsButton-2

Wait Until Element Is Visible    xpath=//*[contains(text(), 'Benjamin Green')]
Wait Until Element Is Visible    xpath=//*[contains(text(), 'Mia Orange')]
Wait Until Element Is Visible    xpath=//*[contains(text(), 'Charlotte Purple')]
Wait Until Element Is Visible    xpath=//*[contains(text(), 'Isabella Yellow')]

Close Browser 