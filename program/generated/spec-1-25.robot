

*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER} =  chrome
${URL} =  http://localhost:4680/tbuis/index.jsp
${DELAY} =  0 seconds

*** Test Cases ***
Test
    Open Browser  browser=${BROWSER}
    Go To  ${URL}
    Set Selenium Speed  ${DELAY}
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  id:loginPage.userNameInput  brown
    Press Keys  id:loginPage.userNameInput  TAB
    Input Password  id:loginPage.passwordInput  pass
    Click Button  id:loginPage.loginFormSubmit
    Wait Until Page Contains Element  xpath://*[@id="header.title.userHome"]
    ${text} =  Get Text  xpath://*[@id="header.title.userHome"]
    Should Be Equal As Strings  ${text}  Noah Brown
    Element Should Not Be Visible  id:header.link.login
    Element Should Be Visible  id:header.link.logout
    Page Should Contain Element  xpath://*[@id="header.student-view-nav"]
    Close Browser
