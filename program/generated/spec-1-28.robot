
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL} =  http://localhost:4680/tbuis/index.jsp
${BROWSER} =  Chrome
${DELAY} =  0 seconds

*** Test Cases ***
Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Click Element  xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element  xpath://*[@id="loginPage.userNameInput"]  10s
    Input Text  xpath://*[@id="loginPage.userNameInput"]  brown
    Press Keys  xpath://*[@id="loginPage.userNameInput"]  TAB
    Wait Until Page Contains Element  xpath://*[@id="loginPage.passwordInput"]  10s
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element  xpath://*[@id="header.title.userHome"]  10s
    Should Not Be Visible  xpath://*[@id="header.link.login"]
    Should Be Visible  xpath://*[@id="header.title.userHome"]
    Should Be Visible  xpath://*[@id="header.link.logout"]
    Element Should Exist  xpath://*[@id="header.student-view-nav"]
    Close Browser