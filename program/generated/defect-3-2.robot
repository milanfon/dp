*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       http://localhost:4680/tbuis/
${LOGIN_URL}      http://localhost:4680/tbuis/login
${STUDENT_VIEW}   http://localhost:4680/tbuis/student-view/overview
${MY_SUBJECTS}    http://localhost:4680/tbuis/student-view/mySubjects
${USERNAME}       brown
${PASSWORD}       pass

*** Test Cases ***
Login and Verify Credits
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Sleep    1s
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    ${credits}=    Get Text    xpath=//*[@id="stu.mySubjects.completedTable.creditAmount"]
    Should Be Equal    ${credits}    0 Total Credits
