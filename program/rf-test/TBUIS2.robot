*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Open Page And Verify Title
    Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
    Navigate  http://localhost:4680/tbuis/login
    Click Element  xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element  xpath=//*[@id="loginPage.userNameInput"]
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  brown
    Press Keys  Tab
    Input Password  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element  xpath=//*[@id="stu.view.title"]
    ${title} =  Get Text  xpath=//*[@id="stu.view.title"]
    Should Be Equal  ${title}  Student's View
