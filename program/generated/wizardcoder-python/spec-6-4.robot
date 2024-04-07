*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    0.5s

*** Test Cases ***

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    maroon
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherSubjects
    Click Element    id:stu.otherSubjects.table.enrollButton-10
    Element Should Be Visible    id:stu.otherSubjects.successAlert
    Click Element    id:stu.menu.mySubjects
    Element Should Be Visible    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
    Element Text Should Be    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]    Software Quality Assurance
    Element Text Should Be    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]    Peter Strict
    Close Browser

Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.mySubjects.table.listOfStudentsButton-3
    Element Should Be Visible    id:tea.mySubjects.table.listOfStudentsButton-3
    Element Should Be Visible    xpath://td[text()='William Maroon']
    Close Browser