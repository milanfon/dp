*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Verify Participant Modal and Names
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Wait Until Page Contains    University information system
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains    My Exam Dates
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Element Is Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Page Should Contain Element    xpath=//td[contains(., 'Benjamin Green')]
    Page Should Contain Element    xpath=//td[contains(., 'Mia Orange')]
    Page Should Contain Element    xpath=//td[contains(., 'Charlotte Purple')]
    Page Should Contain Element    xpath=//td[contains(., 'Isabella Yellow')]
    Close Browser