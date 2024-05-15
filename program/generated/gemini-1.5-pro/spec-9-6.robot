*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome
${DELAY}          2s

*** Test Cases ***
Student View My Exam Dates
    Open Browser    ${LOGIN URL}    ${BROWSER}
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
    Page Should Contain Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Sleep    ${DELAY}
    Page Should Contain    Benjamin Green
    Sleep    ${DELAY}
    Page Should Contain    Mia Orange
    Sleep    ${DELAY}
    Page Should Contain    Charlotte Purple
    Sleep    ${DELAY}
    Page Should Contain    Isabella Yellow
    Sleep    ${DELAY}
    Capture Page Screenshot
    Sleep    ${DELAY}
    Close Browser
