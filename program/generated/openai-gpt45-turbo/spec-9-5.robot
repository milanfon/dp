*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${MY_EXAM_DATES_URL}    http://localhost:4680/tbuis/student-view/myExamDates

*** Test Cases ***
Open University System and Verify Participants
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Location Should Be    ${URL}
    Title Should Be    University information system
    Sleep    2s
    
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]    10s
    Location Should Be    ${LOGIN_URL}
    Title Should Be    Login Page
    Sleep    2s
    
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.menu.myExamDates"]    10s
    Location Should Be    ${STUDENT_OVERVIEW_URL}
    Sleep    2s
    
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]    10s
    Location Should Be    ${MY_EXAM_DATES_URL}
    Sleep    2s
    
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    
    Page Should Contain Element    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Sleep    1s
    
    Table Should Contain    xpath=//table    Benjamin Green
    Table Should Contain    xpath=//table    Mia Orange
    Table Should Contain    xpath=//table    Charlotte Purple
    Table Should Contain    xpath=//table    Isabella Yellow
    Sleep    1s
    
    Close Browser