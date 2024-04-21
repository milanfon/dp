*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${LOGIN URL}    http://localhost:4680/tbuis/login
${USER NAME}    orange
${PASSWORD}    pass

*** Test Cases ***
Exam Dates Participants
    Open Browser    ${LOGIN URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USER NAME}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Sleep    2s
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow