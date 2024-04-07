*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    ${0}    # Change this value to the desired delay time between steps
${USERNAME}    green
${PASSWORD}    pass
${USERNAME_STUDENT}    green
${PASSWORD_STUDENT}    pass
${USERNAME_TEACHER}    strict
${PASSWORD_TEACHER}    pass

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}   
    Maximize Browser Window
    Go To    ${URL}
    Delay    ${DELAY}

Login
    [Arguments]    ${username}    ${password}
    Input Text    id=loginPage.userNameInput    ${username}
    Delay    ${DELAY}
    Input Text    id=loginPage.passwordInput    ${password}
    Delay    ${DELAY}
    Click Button    id=loginPage.loginFormSubmit
    Delay    ${DELAY}


*** Test Cases ***
Test Student
    [Setup]    Open Browser To Login Page
    Login    ${USERNAME_STUDENT}    ${PASSWORD_STUDENT}
    Click Link    id=stu.menu.otherExamDates
    Delay    ${DELAY}
    Click Button    id=stu.otherExamDates.table.registerButton-2-0
    Delay    ${DELAY}
    Click Link    id=stu.menu.myExamDates
    Delay    ${DELAY}
    ${text}    Get Text    id=stu.otherExamDates.successAlert
    Should Be Equal    ${text}    Other exam dates registered successfully.
    ${text}    Get Text    xpath=//td[.='Programming in Java']
    Should Be Equal    ${text}    Programming in Java
    Close Browser

Test Teacher
    [Setup]    Open Browser To Login Page
    Login    ${USERNAME_TEACHER}    ${PASSWORD_TEACHER}
    Click Link    id=tea.menu.myExamDates
    Delay    ${DELAY}
    Click Button    id=tea.myExamDates.table.participantsButton-1-0
    Delay    ${DELAY}
    ${text}    Get Text    xpath=//td[.='Mia Orange']
    Should Contain    ${text}    Mia Orange
    Close Browser