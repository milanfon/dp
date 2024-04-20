*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}  http://localhost:4680/tbuis

*** Test Cases ***
Scenario 1 - Student Login
    Open Browser  ${BASE_URL}/index.jsp  chrome
    Maximize Browser Window
    Set Window Size  1501  1104
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  brown
    Input Password  id=loginPage.passwordInput  pass
    Click Button  id=loginPage.loginFormSubmit
    Wait Until Page Contains  Student's View
    Element Should Not Be Visible  id=header.link.login
    Element Should Contain  id=header.title.userHome  Noah Brown
    Element Should Be Visible  id=header.link.logout
    Element Should Exist  css=#header.student-view-nav
    Element Should Contain  id=stu.view.title  Student's View
    Element Should Be Visible  id=overview.personalInfoForm

Scenario 2 - Teacher Login
    Open Browser  ${BASE_URL}/index.jsp  chrome
    Maximize Browser Window
    Set Window Size  1501  1104
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  lazy
    Input Password  id=loginPage.passwordInput  pass
    Click Button  id=loginPage.loginFormSubmit
    Wait Until Page Contains  Teacher's View
    Element Should Not Be Visible  id=header.link.login
    Element Should Contain  id=header.title.userHome  John Lazy
    Element Should Be Visible  id=header.link.logout
    Element Should Exist  css=#header.teacher-view-nav
    Element Should Contain  id=tea.view.title  Teacher's View
    Element Should Be Visible  id=overview.personalInfoForm

Scenario 3 - Invalid Login Attempts
    Open Browser  ${BASE_URL}/index.jsp  chrome
    Maximize Browser Window
    Set Window Size  1501  1104
    
    # Attempt 1: invalid username and password
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  bla
    Input Password  id=loginPage.passwordInput  pass
    Click Button  id=loginPage.loginFormSubmit
    Element Should Be Visible  id=loginPage.errorAlert
    
    # Attempt 2: invalid password
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  lazy
    Input Password  id=loginPage.passwordInput  bla
    Click Button  id=loginPage.loginFormSubmit
    Element Should Be Visible  id=loginPage.errorAlert

*** Keywords ***