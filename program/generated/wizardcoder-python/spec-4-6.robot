*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    0.5s

*** Test Cases ***
Scenario: Student's View
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    gray
    Input Text    id:loginPage.passwordInput    pass
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    ${DELAY}
    ${stu.mySubjects.successAlert}    Get Element Attribute    xpath://*[@id="stu.mySubjects.successAlert"]    visible
    ${stu.mySubjects.enrolledTable.Title}    Get Element Attribute    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]    visible
    ${Database Systems}    Get Elements    xpath://td[contains(., 'Database Systems')]
    Should Not Be True    ${Database Systems}
    Close Browser