*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
spec 8 student
    [Setup]    Open Browser    about:blank    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Element Should Be Visible    xpath://*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Element Should Be Visible    xpath://*[text()="Programming in Java"]
    [Teardown]    Close Browser

spec 8 teacher
    [Setup]    Open Browser    about:blank    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Element Should Be Visible    xpath://*[text()="Mia Orange"]
    [Teardown]    Close Browser