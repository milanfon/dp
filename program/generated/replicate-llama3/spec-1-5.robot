*** Test Cases ***
Login and Verify Student View
    Open Page    http://localhost:4680/tbuis/index.jsp
    Click Element    id:header.link.login
    Input Text    id:loginPage.userNameInput    brown
    Input Password    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Page Should Not Contain Element    id:header.link.login
    Element Text Should Be    id:header.title.userHome    Noah Brown
    Page Should Contain Element    id:header.link.logout
    Element Should Exist    css:#header.student-view-nav
    Element Text Should Be    id:stu.view.title    Student's View
    Page Should Contain Element    id:overview.personalInfoForm

Login and Verify Teacher View
    Open Page    http://localhost:4680/tbuis/index.jsp
    Click Element    id:header.link.login
    Input Text    id:loginPage.userNameInput    lazy
    Input Password    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Page Should Not Contain Element    id:header.link.login
    Element Text Should Be    id:header.title.userHome    John Lazy
    Page Should Contain Element    id:header.link.logout
    Element Should Exist    css:#header.teacher-view-nav
    Element Text Should Be    id:tea.view.title    Teacher's View
    Page Should Contain Element    id:overview.personalInfoForm

Invalid Login Attempts
    Open Page    http://localhost:4680/tbuis/index.jsp
    Click Element    id:header.link.login
    Input Text    id:loginPage.userNameInput    bla
    Input Password    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Element Should Be Visible    id:loginPage.errorAlert
    
    Open Page    http://localhost:4680/tbuis/index.jsp
    Click Element    id:header.link.login
    Input Text    id:loginPage.userNameInput    lazy
    Input Password    id:loginPage.passwordInput    bla
    Click Element    id:loginPage.loginFormSubmit
    Element Should Be Visible     id:loginPage.errorAlert

*** Keywords ***
Open Page
   [Arguments]  ${url}
   Go To  ${url}