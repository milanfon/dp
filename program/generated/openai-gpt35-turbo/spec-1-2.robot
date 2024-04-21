*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${DELAY}  1s

*** Test Cases ***
Test Scenario 1
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Wait Until Page Contains Element  id=header.link.login  timeout=10s
    Wait Until Page Contains Element  id=header.title.userHome  timeout=10s
    Wait Until Page Contains Element  id=header.link.logout  timeout=10s
    Wait Until Page Contains Element  css=#header.student-view-nav  timeout=10s
    Wait Until Page Contains Element  id=stu.view.title  timeout=10s
    Wait Until Page Contains Element  id=overview.personalInfoForm  timeout=10s
    Close Browser

Test Scenario 2
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Wait Until Page Contains Element  id=header.link.login  timeout=10s
    Wait Until Page Contains Element  id=header.title.userHome  timeout=10s
    Wait Until Page Contains Element  id=header.link.logout  timeout=10s
    Wait Until Page Contains Element  css=#header.teacher-view-nav  timeout=10s
    Wait Until Page Contains Element  id=tea.view.title  timeout=10s
    Wait Until Page Contains Element  id=overview.personalInfoForm  timeout=10s
    Close Browser

Test Scenario 3 - Invalid Login Attempt
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Input Username And Password And Check Error Alert Visibility  bla  pass
    Close Browser

Test Scenario 4 - Invalid Login Attempt
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Input Username And Password And Check Error Alert Visibility  lazy  bla
    Close Browser

*** Keywords ***
Input Username And Password And Check Error Alert Visibility
    [Arguments]  ${username}  ${password}
    Wait Until Page Contains Element  id=header.link.login  timeout=10s
    Click Element  id=header.link.login
    Wait Until Page Contains Element  id=loginPage.userNameInput  timeout=10s
    Input Text  id=loginPage.userNameInput  ${username}
    Input Text  id=loginPage.passwordInput  ${password}
    Click Element  id=loginPage.loginFormSubmit
    Sleep  ${DELAY}
    Run Keyword And Return Status  Element Should Be Visible  id=loginPage.errorAlert
    Close Browser