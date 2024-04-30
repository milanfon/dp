*** Settings ***
Documentation     This scenario verifies the functionality related to exam date participation for a student.
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${USERNAME}     orange
${PASSWORD}     pass

*** Test Cases ***
Verify Exam Date Participation
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Login And Navigate To My Exam Dates
    Verify Participants Modal And Contents

*** Keywords ***
Login And Navigate To My Exam Dates
    Wait Until Element Is Visible    xpath=//*[@id="header.link.login"]    timeout=10
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    My Exam Dates    timeout=10
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]

Verify Participants Modal And Contents
    Wait Until Element Is Visible    id=stu.myExamDates.participantsModal.title    timeout=10
    Page Should Contain Element    xpath=//td[text()="Benjamin Green"]
    Page Should Contain Element    xpath=//td[text()="Mia Orange"]
    Page Should Contain Element    xpath=//td[text()="Charlotte Purple"]
    Page Should Contain Element    xpath=//td[text()="Isabella Yellow"]
    Close Browser