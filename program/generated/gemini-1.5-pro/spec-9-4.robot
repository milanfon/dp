*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}          http://localhost:4680/tbuis/index.jsp
${BROWSER}      chrome

*** Test Cases ***
Exam Dates Participants List
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    Page Should Contain Element    id:stu.myExamDates.participantsModal.title
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Sleep    2s
    Close Browser    
