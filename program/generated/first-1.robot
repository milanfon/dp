```robotframework
*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Check title of page
    Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
    Click Element  xpath=//*[@id="header.link.login"]
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  brown
    Press Keys  Tab
    Input Password  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains  Student's View
    ${title} =  Get Text  xpath=//h1[@id="stu.view.title"]
    Should Be Equal As Strings  ${title}  Student's View
```