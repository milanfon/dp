*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://a[@id="header.link.login"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    green
    Input Text    xpath://input[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://input[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://a[@id="stu.menu.otherExamDates"]
    Click Element    xpath://input[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Page Should Contain Element    xpath://div[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath://a[@id="stu.menu.myExamDates"]
    Page Should Contain Element    xpath://td[contains(text(), "Programming in Java")]
    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://a[@id="header.link.login"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://input[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://input[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://a[@id="tea.menu.myExamDates"]
    Click Element    xpath://input[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath://td[contains(text(), "Mia Orange")]
    Close Browser
