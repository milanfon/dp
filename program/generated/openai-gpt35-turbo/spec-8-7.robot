*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/

*** Test Cases ***
Open Page and Verify Elements
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    1 second
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    green
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="stu.menu.otherExamDates"]
    Click Element    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath//td[contains(text(),'Programming in Java')]
    Close Browser

Login as Teacher and Verify Element
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Set Selenium Speed    1 second
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Click Element    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath//td[contains(text(),'Mia Orange')]
    Close Browser