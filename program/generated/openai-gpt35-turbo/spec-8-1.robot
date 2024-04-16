*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/

*** Test Cases ***
Open page and check elements
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Delay           2s
    Click Element    xpath///*[@id="header.link.login"]
    Delay           2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    green
    Delay           2s
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Delay           2s
    Click Element    xpath///*[@id="stu.menu.otherExamDates"]
    Delay           2s
    Click Element    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Delay           2s
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Delay           2s
    
    Close Browser

Login as teacher and check elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Delay           2s
    Click Element    xpath///*[@id="header.link.login"]
    Delay           2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Delay           2s
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Delay           2s
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Delay           2s
    Click Element    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    
    Close Browser