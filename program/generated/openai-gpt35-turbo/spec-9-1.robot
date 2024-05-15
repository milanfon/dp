*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}        Chrome

*** Test Cases ***
Open Page and Check Participants
    Open Browser    ${URL}    ${BROWSER}
    Set Viewport    1501    1104
    Wait Until Element Is Visible    main
    Click Element    xpath///*[@id="header.link.login"]
    Wait Until Element Is Visible    main
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    main
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Wait Until Element Is Visible    main
    Click Element    xpath///*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Element Is Visible    xpath//td[@id="stu.myExamDates.participantsModal.title"]
    Wait Until Element Is Visible    xpath//td[contains(text(), "Benjamin Green")]
    Wait Until Element Is Visible    xpath//td[contains(text(), "Mia Orange")]
    Wait Until Element Is Visible    xpath//td[contains(text(), "Charlotte Purple")]
    Wait Until Element Is Visible    xpath//td[contains(text(), "Isabella Yellow"]
    Close Browser