*** Settings ***
Documentation     Verify student names on "My Subjects" page after performing actions specified in spec 11 JSON recording.
Library           SeleniumLibrary
Suite Setup       Open Browser To LoginPage
Suite Teardown    Close Browser
Test Setup        Login And Navigate To My Subjects
Test Teardown     Logout
Force Tags        spec11

*** Variables ***
${URL}                 http://localhost:4680/tbuis/index.jsp
${BROWSER}             Chrome
${LOGIN_PAGE}          http://localhost:4680/tbuis/login
${USERNAME}            pedant
${PASSWORD}            pass
${LOGIN_BUTTON}        xpath=//*[@id="header.link.login"]
${USERNAME_INPUT}      xpath=//*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT}      xpath=//*[@id="loginPage.passwordInput"]
${LOGIN_SUBMIT}        xpath=//*[@id="loginPage.loginFormSubmit"]
${MY_SUBJECTS}         xpath=//*[@id="tea.menu.mySubjects"]
${STUDENTS_BUTTON_0}   xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
${CLOSE_MODAL_CROSS}   id=closeModalButtonCross
${STUDENTS_BUTTON_2}   id=tea.mySubjects.table.listOfStudentsButton-2
${DELAY}               2s
${SPEED}               0.5

*** Keywords ***
Open Browser To LoginPage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${SPEED}

Login And Navigate To My Subjects
    Go To    ${LOGIN_PAGE}
    Input Text    ${USERNAME_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Element    ${LOGIN_SUBMIT}
    Wait Until Page Contains    Teacher's View    timeout=10s
    Click Element    ${MY_SUBJECTS}
    Wait Until Page Contains    My Subjects    timeout=10s

Logout
    [Teardown]    Close Browser

*** Test Cases ***
Verify Names On My Subjects Page
    Click Element    ${STUDENTS_BUTTON_0}
    Wait Until Page Contains    Benjamin Green    timeout=5s
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    ${CLOSE_MODAL_CROSS}
    Click Element    ${STUDENTS_BUTTON_2}
    Wait Until Page Contains    No students    timeout=5s