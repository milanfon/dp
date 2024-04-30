*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/

*** Test Cases ***
Open Page and Check Elements
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Click Element    xpath//*[@id="header.link.login"]
    Sleep    2
    Input Text    xpath//*[@id="loginPage.userNameInput"]    green
    Sleep    2
    Input Text    xpath//*[@id="loginPage.passwordInput"]    pass
    Sleep    2
    Click Element    xpath//*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Click Element    xpath//*[@id="stu.menu.otherExamDates"]
    Sleep    2
    Click Element    xpath//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2
    Click Element    xpath//*[@id="stu.menu.myExamDates"]
    Sleep    2
    Page Should Contain Element    xpath//td[contains(text(),'Programming in Java')]
    Close Browser

Login as Teacher and Check Element
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Click Element    xpath//*[@id="header.link.login"]
    Sleep    2
    Input Text    xpath//*[@id="loginPage.userNameInput"]    strict
    Sleep    2
    Input Text    xpath//*[@id="loginPage.passwordInput"]    pass
    Sleep    2
    Click Element    xpath//*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Click Element    xpath//*[@id="tea.menu.myExamDates"]
    Sleep    2
    Page Should Contain Element    xpath//td[contains(text(),'Mia Orange')]
    Close Browser