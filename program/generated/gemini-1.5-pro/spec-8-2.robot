*** Settings ***
Library           SeleniumLibrary
Documentation     Suite description
...               This suite uses Chrome browser

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${STUDENT}        green
${TEACHER}        strict
${PASSWORD}       pass

*** Keywords ***
Open Browser And Login
    Open Browser    ${LOGIN URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    ${USERNAME}
    Sleep    1s
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

*** Test Cases ***
Student Registers For Exam
    ${USERNAME}    Set Variable    ${STUDENT}
    Open Browser And Login
    Click Element    xpath///*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Page Should Contain Element    xpath///*[@id="stu.otherExamDates.successAlert"]
    Sleep    1s
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    //td[text()="Programming in Java"]
    Sleep    1s
    Close Browser

Teacher Checks Participants
    ${USERNAME}    Set Variable    ${TEACHER}
    Open Browser And Login
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    //td[text()="Mia Orange"]
    Sleep    1s
    Close Browser
