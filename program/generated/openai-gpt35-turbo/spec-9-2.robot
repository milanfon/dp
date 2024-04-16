*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Example Test
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Wait Until Element Is Visible    main
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Element Is Visible    main
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath=//*[@id="stu.menu.myExamDates"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Wait Until Element Is Visible    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1]
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1]
    Wait Until Element Is Visible    id=stu.myExamDates.participantsModal.title
    Wait Until Element Is Visible    xpath=//td[text()="Benjamin Green"]
    Wait Until Element Is Visible    xpath=//td[text()="Mia Orange"]
    Wait Until Element Is Visible    xpath=//td[text()="Charlotte Purple"]
    Wait Until Element Is Visible    xpath=//td[text()="Isabella Yellow"]
    Close Browser