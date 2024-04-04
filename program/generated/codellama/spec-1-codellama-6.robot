*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Test Login
    Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
    Click Element  id=header.link.login
    Element Should Not Be Visible  id=header.link.login
    Element Should Contain  id=header.title.userHome  Noah Brown
    Element Should Be Visible  id=header.link.logout
    Element Should Be Visible  css:#header.student-view-nav
    Execute Login Steps  http://localhost:4680/tbuis/index.jsp  teacher
    Element Should Not Be Visible  id=header.link.login
    Element Should Contain  id=header.title.userHome  John Lazy
    Element Should Be Visible  id=header.link.logout
    Element Should Be Visible  css:#header.teacher-view-nav
    Execute Login Steps  http://localhost:4680/tbuis/index.jsp  teacher  bla  pass
    Element Should Be Visible  id=loginPage.errorAlert
    Execute Login Steps  http://localhost:4680/tbuis/index.jsp  teacher  lazy  bla
    Element Should Be Visible  id=loginPage.errorAlert

Execute Login Steps
    [Arguments]  ${url}  ${username}  ${password}
    Go To  ${url}
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  ${username}
    Input Text  id=loginPage.passwordInput  ${password}
    Click Element  id=loginPage.loginFormSubmit
