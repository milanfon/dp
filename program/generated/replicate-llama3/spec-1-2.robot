*** Settings ***
Library  Selenium2Library

*** Variables ***
${BASE_URL}  http://localhost:4680/tbuis
${USERNAME_STUDENT}  brown
${PASSWORD_STUDENT}  pass
${USERNAME_TEACHER}  lazy
${PASSWORD_TEACHER}  pass
${INVALID_USERNAME}  bla
${INVALID_PASSWORD}  bla

*** Test Cases ***
Scenario 1 - Student Login
    Open Browser  ${BASE_URL}/index.jsp  chrome
    Set Window Size  1501  1104
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  ${USERNAME_STUDENT}
    Input Password  id=loginPage.passwordInput  ${PASSWORD_STUDENT}
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
    Set Window Size  1501  1104
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  ${USERNAME_TEACHER}
    Input Password  id=loginPage.passwordInput  ${PASSWORD_TEACHER}
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
    Set Window Size  1501  1104
    Click Element  id=header.link.login
    
    # Attempt with invalid username and password
    Input Text  id=loginPage.userNameInput  ${INVALID_USERNAME}
    Input Password  id=loginPage.passwordInput  ${INVALID_PASSWORD}
    Click Button  id=loginPage.loginFormSubmit
    Element Should Be Visible  id=loginPage.errorAlert
    
    # Attempt with valid username and invalid password
    Input Text  id=loginPage.userNameInput  ${USERNAME_TEACHER}
    Input Password  id=loginPage.passwordInput  ${INVALID_PASSWORD}
    Click Button  id=loginPage.loginFormSubmit
    Element Should Be Visible  id=loginPage.errorAlert
    
    # Attempt with invalid username and valid password
    Input Text  id=loginPage.userNameInput  ${INVALID_USERNAME}
    Input Password  id=loginPage.passwordInput  ${PASSWORD_TEACHER}
    Click Button  id=loginPage.loginFormSubmit
    Element Should Be Visible  id=loginPage.errorAlert