*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${url}    http://localhost:4680/tbuis/
${browser}    Chrome
${username}    gray
${password}    pass

*** Test Cases ***
Student Test
    Open Browser    ${url}    ${browser}
    Input Text    id:loginPage.userNameInput    ${username}
    Input Text    id:loginPage.passwordInput    ${password}
    Click Element    aria:Login
    Wait Until Element Is Visible    id:stu.mySubjects
    Click Element    id:stu.mySubjects
    Wait Until Element Is Visible    id:stu.mySubjects.enrolledTable.Title
    Wait Until Element Is Not Visible    id:stu.mySubjects.enrolledTable.Title
    Click Element    id:stu.mySubjects.enrolledTable.unenrollSubjectButton-1
    Wait Until Element Is Visible    id:stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    Click Element    id:stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    Wait Until Element Is Visible    id:stu.mySubjects.successAlert
    Element Should Be Visible    id:stu.mySubjects.successAlert
    Element Should Be Visible    id:stu.mySubjects.enrolledTable.Title
    Element Should Not Be Visible    xpath://td[.='Database Systems']
    Close Browser

    [Teardown]    Close Browser