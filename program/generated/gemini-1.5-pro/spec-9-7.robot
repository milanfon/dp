*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome
${DELAY}          500ms

*** Test Cases ***
Student View My Exam Dates Participants
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Link    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    ${DELAY}
    Page Should Contain Element    id=stu.myExamDates.participantsModal.title
    Sleep    ${DELAY}
    Page Should Contain    xpath://td[text()="Benjamin Green"]
    Page Should Contain    xpath://td[text()="Mia Orange"]
    Page Should Contain    xpath://td[text()="Charlotte Purple"]
    Page Should Contain    xpath://td[text()="Isabella Yellow"]
    Sleep    ${DELAY}
    Close Browser
    
*** Keywords ***
Sleep
    [Arguments]    ${time}
    Execute Javascript    window.setTimeout(arguments[arguments.length - 1], ${time});
