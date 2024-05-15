*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Validate Participant Details After Login
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Wait Until Page Contains    University information system    timeout=10s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Wait Until Page Contains    Login Page    timeout=10s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Wait Until Page Contains    element=My Exam Dates    timeout=10s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Wait Until Page Contains    element=ParticipantsButton-1    timeout=10s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[text()="Benjamin Green"]
    Page Should Contain Element    xpath=//*[text()="Mia Orange"]
    Page Should Contain Element    xpath=//*[text()="Charlotte Purple"]
    Page Should Contain Element    xpath=//*[text()="Isabella Yellow"]
    Close Browser