*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close Browser

*** Variables ***
${BROWSER}    Chrome
${DELAY}     2s
${URL}      http://localhost:4680
${USERNAME}    maroon
${PASSWORD}    pass
${USERNAME_T}    strict
${PASSWORD_T}    pass

*** Test Cases ***
Student Test
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    ${USERNAME}
    Input Text    id:loginPage.passwordInput    ${PASSWORD}
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherSubjects
    Click Element    id:stu.otherSubjects.table.enrollButton-10
    ${alert}    Get Element Attribute    id:stu.otherSubjects.successAlert    visible
    Should Be True    ${alert}
    Click Element    id:stu.menu.mySubjects
    ${table}    Get Element Attribute    xpath://tr[@id='stu.mySubjects.enrolledTable.subjectRow-2']    outerHTML
    Should Contain    ${table}    Software Quality Assurance
    Should Contain    ${table}    Peter Strict

Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    ${USERNAME_T}
    Input Text    id:loginPage.passwordInput    ${PASSWORD_T}
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.mySubjects.table.listOfStudentsButton-3
    ${button}    Get Element Attribute    id:tea.mySubjects.table.listOfStudentsButton-3    text
    Should Be Equal    ${button}    Students (2)
    ${list}    Get Element Attribute    xpath://td[text()='William Maroon']    outerHTML
    Should Be True    ${list}