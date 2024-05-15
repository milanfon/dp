*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}         chrome

*** Test Cases ***
Exam participants list
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text()="Benjamin Green"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text()="Charlotte Purple"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text()="Isabella Yellow"]
    Sleep    2s
    Close Browser
