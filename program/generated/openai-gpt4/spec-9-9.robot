*** Settings ***
Documentation     This script simulates the actions taken in the specified JSON recording for Spec 9, checking specific elements afterward.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}      http://localhost:4680/tbuis/login
${MY_EXAM_DATES_URL}  http://localhost:4680/tbuis/student-view/myExamDates
${LOGIN_BUTTON}   xpath=//*[@id="header.link.login"]
${USERNAME_INPUT} xpath=//*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT} xpath=//*[@id="loginPage.passwordInput"]
${LOGIN_SUBMIT_BUTTON} xpath=//*[@id="loginPage.loginFormSubmit"]
${MY_EXAM_DATES_BUTTON} xpath=//*[@id="stu.menu.myExamDates"]
${PARTICIPANTS_BUTTON} xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
${MODAL_TITLE_ID} id=stu.myExamDates.participantsModal.title
${EXPECTED_NAMES} Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
${DELAY}          2s

*** Test Cases ***
Verify Participants List In My Exam Dates
    Open Browser    ${URL}    ${BROWSER}
    Maximize Window
    Login As Student
    Open My Exam Dates And Verify Participants

*** Keywords ***
Maximize Window
    Maximize Browser Window
    Sleep    ${DELAY}

Login As Student
    Click Element    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${USERNAME_INPUT}    timeout=10s
    Input Text    ${USERNAME_INPUT}    orange
    Input Text    ${PASSWORD_INPUT}    pass
    Click Element    ${LOGIN_SUBMIT_BUTTON}
    Location Should Be    ${MY_EXAM_DATES_URL}
    Sleep    ${DELAY}

Open My Exam Dates And Verify Participants
    Click Element    ${MY_EXAM_DATES_BUTTON}
    Wait Until Page Contains    My Exam Dates    timeout=10s
    Click Element    ${PARTICIPANTS_BUTTON}
    Sleep    ${DELAY}
    Wait Until Element Is Visible    ${MODAL_TITLE_ID}    timeout=10s
    ${xpath_base}=    Set Variable    xpath=//div[@id="stu.myExamDates.participantsModal"]//td[text()=
    :FOR    ${Name}    IN    @{EXPECTED_NAMES}
    \    ${xpath}=    Catenate    SEPARATOR=    ${xpath_base}'${Name}']
    \    Element Should Be Visible    ${xpath}

Close Browser
    Close All Browsers