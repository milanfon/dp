*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Open Browser To Login Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Browser Implicit Wait    10s
    Maximize Browser Window

Check Elements After Login
    Wait Until Page Contains    Student's View
    Input Text    id=loginPage.userNameInput    brown
    Input Password    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Wait Until Page Contains    Student's View

    Check If Element Is Not Present    xpath://*[@id="header.link.login"]
    Check If Element Contains    id=header.title.userHome    Noah Brown
    Check If Element Is Present    xpath://*[@id="header.link.logout"]
    Check If Element Is Present    xpath//*[@id="header.student-view-nav"]
