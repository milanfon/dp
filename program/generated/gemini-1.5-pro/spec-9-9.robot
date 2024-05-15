*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${DELAY}      2s

*** Test Cases ***
Student View My Exam Dates Participants
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
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()="Benjamin Green"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()="Charlotte Purple"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()="Isabella Yellow"]
    Sleep    ${DELAY}
    Close Browser

*** Keywords ***
 
