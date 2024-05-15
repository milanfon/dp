*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath:///*[@id="loginPage.userNameInput"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    green
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath:///*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath:///*[@id="stu.menu.otherExamDates"]
    Sleep    1s
    Click Button    xpath:///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s
    Page Should Contain Element    xpath:///*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath:///*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath://td[contains(text(), "Programming in Java")]
    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath:///*[@id="loginPage.userNameInput"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath:///*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath:///*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Button    xpath:///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    1s
    Page Should Contain Element    xpath://td[contains(text(), "Mia Orange")]
    Close Browser