

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Viewport Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Press Keys    xpath://*[@id="loginPage.userNameInput"]    TAB
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Not Contain Element    id:header.link.login
    Element Text Should Be    id:header.title.userHome    Noah Brown
    Page Should Contain Element    id:header.link.logout
    Page Should Contain Element    css:#header.student-view-nav
