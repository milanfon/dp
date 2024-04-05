*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Test Scenario
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains    University information system
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    My Exam Dates
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains    My Exam Dates
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Page Contains Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Element Text Should Be    xpath://*[@id="stu.myExamDates.participantsModal.title"]    Exam Participants
    Page Should Contain Element    xpath://td[text()="Benjamin Green"]
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
    Page Should Contain Element    xpath://td[text()="Charlotte Purple"]
    Page Should Contain Element    xpath://td[text()="Isabella Yellow"]
    [Teardown]    Close Browser