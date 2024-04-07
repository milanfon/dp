*** Test Cases ***
Scenario 8 Student
    Open Browser    http://localhost:4680/tbuis/
    Input Text    id:loginPage.userNameInput    green
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:stu.menu.otherExamDates
    Click Button    id:stu.otherExamDates.table.registerButton-2-0
    Click Link    id:stu.menu.myExamDates
    Wait Until Element Is Visible    id:stu.otherExamDates.successAlert
    Click Link    id:stu.menu.myExamDates
    Wait Until Element Is Visible    xpath://td[contains(.,'Programming in Java')]
    Close Browser

Scenario 8 Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:tea.menu.myExamDates
    Click Button    id:tea.myExamDates.table.participantsButton-1-0
    Click Link    id:tea.menu.myExamDates
    Wait Until Element Is Visible    id:tea.myExamDates.table.participants-1-0
    Click Link    id:tea.menu.myExamDates
    Wait Until Element Is Visible    xpath://td[contains(.,'Mia Orange')]
    Close Browser