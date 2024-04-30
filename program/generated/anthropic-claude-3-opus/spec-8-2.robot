*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 8 Student
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    green
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Button    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Page Should Contain Element    xpath///*[@id="stu.otherExamDates.successAlert"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath//td[contains(text(),'Programming in Java')]
    Close Browser

Spec 8 Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Button    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath//td[contains(text(),'Mia Orange')]
    Close Browser