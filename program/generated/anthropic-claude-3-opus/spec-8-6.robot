*** Settings ***
Library    Selenium2Library
Library    BuiltIn

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    
    Click Element    xpath://a[@id="header.link.login"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    green
    Input Text    xpath://input[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://button[@id="loginPage.loginFormSubmit"]
    
    Click Element    xpath://a[@id="stu.menu.otherExamDates"]
    Click Button    xpath://button[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Page Contains Element    xpath://div[@id="stu.otherExamDates.successAlert"]
    
    Click Element    xpath://a[@id="stu.menu.myExamDates"]
    Page Should Contain Element    xpath://td[text()="Programming in Java"]
    
    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    
    Click Element    xpath://a[@id="header.link.login"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://input[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://button[@id="loginPage.loginFormSubmit"]
    
    Click Element    xpath://a[@id="tea.menu.myExamDates"]
    Click Button    xpath://button[@id="tea.myExamDates.table.participantsButton-1-0"]
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
    
    Close Browser