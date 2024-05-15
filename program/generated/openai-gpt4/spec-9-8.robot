*** Settings ***
Documentation     Scenario to replicate steps from JSON recording and check for specific elements.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${URL}          http://localhost:4680/tbuis/index.jsp
${LOGIN_BUTTON}  xpath=//*[@id="header.link.login"]
${USERNAME_FIELD}  xpath=//*[@id="loginPage.userNameInput"]
${PASSWORD_FIELD}  xpath=//*[@id="loginPage.passwordInput"]
${SUBMIT_BUTTON}  xpath=//*[@id="loginPage.loginFormSubmit"]
${MY_EXAM_DATES}  xpath=//*[@id="stu.menu.myExamDates"]
${PARTICIPANTS_BUTTON}  xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
${MODAL_TITLE}   id=stu.myExamDates.participantsModal.title
${DELAY}         2s

*** Test Cases ***
Open And Verify Page Elements
    Open Browser And Navigate To Login
    Login To The System
    Navigate To My Exam Dates
    Verify Participants Modal
    Close Browser

*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

Login To The System
    Click Element    ${LOGIN_BUTTON}
    Sleep    ${DELAY}
    Input Text    ${USERNAME_FIELD}    orange
    Input Text    ${PASSWORD_FIELD}    pass
    Click Element    ${SUBMIT_BUTTON}
    Sleep    ${DELAY}

Navigate To My Exam Dates
    Click Element    ${MY_EXAM_DATES}
    Sleep    ${DELAY}
    Click Element    ${PARTICIPANTS_BUTTON}
    Sleep    ${DELAY}

Verify Participants Modal
    Wait Until Element Is Visible    ${MODAL_TITLE}    10s
    @{EXPECTED_NAMES}=    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    :FOR    ${NAME}    IN    @{EXPECTED_NAMES}
    \    ${XPATH}=    Catenate    SEPARATOR=    xpath=//td[text()='    ${NAME}    ']
    \    Wait Until Element Is Visible    ${XPATH}    10s