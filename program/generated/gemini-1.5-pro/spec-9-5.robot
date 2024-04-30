*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${DELAY}          500ms

*** Test Cases ***
Spec 9
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    ${DELAY}
    Page Should Contain Element    id=stu.myExamDates.participantsModal.title
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Sleep    ${DELAY}
    Close Browser
