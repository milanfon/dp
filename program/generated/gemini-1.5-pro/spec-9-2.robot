*** Settings ***
Library           SeleniumLibrary
Test Timeout        1min
Default Tags       smoke

*** Variables ***
${BROWSER}         chrome
${DELAY}           500ms

*** Keywords ***
Open Browser To Base Url
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window

Login As Student
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Wait Until Page Contains Element    xpath://*[@id="stu.menu.myExamDates"]

Open My Exam Dates Page
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Wait Until Page Contains Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]

Open Exam Participants Modal
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    ${DELAY}

*** Test Cases ***
Student Views Exam Participants
    Open Browser To Base Url
    Login As Student
    Open My Exam Dates Page
    Open Exam Participants Modal
    
    Wait Until Page Contains Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Page Should Contain Element    xpath://td[text()="Benjamin Green"]
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
    Page Should Contain Element    xpath://td[text()="Charlotte Purple"]
    Page Should Contain Element    xpath://td[text()="Isabella Yellow"]
    
    [Teardown]    Close Browser
