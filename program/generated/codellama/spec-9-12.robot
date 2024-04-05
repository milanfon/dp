*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check Exam Dates
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://*[@id="stu.menu.myExamDates"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Element Should Be Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Wait Until Page Contains Element    xpath://td[text()="Benjamin Green"]
    Wait Until Page Contains Element    xpath://td[text()="Mia Orange"]
    Wait Until Page Contains Element    xpath://td[text()="Charlotte Purple"]
    Wait Until Page Contains Element    xpath://td[text()="Isabella Yellow"]
    Close Browser