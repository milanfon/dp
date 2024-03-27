*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${BASE_URL}    http://localhost:4680/tbuis
${LOGIN_PAGE_URL}    ${BASE_URL}/login
${STUDENT_VIEW_URL}    ${BASE_URL}/student-view/overview
${MY_SUBJECTS_URL}    ${BASE_URL}/student-view/mySubjects
${USERNAME}    maroon
${PASSWORD}    pass

*** Test Cases ***
Open Page And Verify Background Color
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Set Browser Implicit Wait    5
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Press Keys    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Wait Until Page Contains    Student's View    10
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-0"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    1s
    ${backgroundColor}    Get Element Css Value    xpath=//*[@id="stu.menu.mySubjects"]    background-color
    Should Be Equal As Strings    ${backgroundColor}    rgb(0, 123, 255)
    [Teardown]    Close Browser
