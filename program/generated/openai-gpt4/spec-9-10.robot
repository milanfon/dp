*** Settings ***
Documentation     This test suite validates the student's ability to view participants in an exam date.
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}         http://localhost:4680/tbuis/login
${USERNAME}          orange
${PASSWORD}          pass

*** Test Cases ***
View Exam Date Participants
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Element Is Visible    id=stu.myExamDates.participantsModal.title    5s
    Page Should Contain Element    xpath=//td[text()="Benjamin Green"]
    Page Should Contain Element    xpath=//td[text()="Mia Orange"]
    Page Should Contain Element    xpath=//td[text()="Charlotte Purple"]
    Page Should Contain Element    xpath=//td[text()="Isabella Yellow"]
    Close Browser