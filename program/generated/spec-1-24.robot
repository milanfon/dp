

*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Test spec 1
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Click Element   xpath://*[@id="header.link.login"]
    Input Text      xpath://*[@id="loginPage.userNameInput"]  brown
    Press Keys      xpath://*[@id="loginPage.userNameInput"]  TAB
    Input Password  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element   xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://*[@id="header.title.userHome"]
    Element Should Not Be Visible       xpath://*[@id="header.link.login"]
    Element Text Should Be              xpath://*[@id="header.title.userHome"]  Noah Brown
    Element Should Be Visible           xpath://*[@id="header.link.logout"]
    Page Should Contain Element         xpath://*[@id="header.student-view-nav"]
    Close Browser
