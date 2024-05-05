*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Test Cases ***

Scenario 1
    [Documentation]         Test scenario for user Noah Brown

    [Preparation]         Set Up
        Set Viewport 1501 1104
        Navigate To http://localhost:4680/tbuis/index.jsp

    [Actions]         Login with Noah Brown
    Click    #header.link.login
    Input    #loginPage.userNameInput    brown
    Input    #loginPage.passwordInput    pass
    Click    #loginPage.loginFormSubmit

    [Verification]         Check elements for user Noah Brown
    Should Not Exist    #header.link.login
    Should Contain    #header.title.userHome    Noah Brown
    Should Exist    #header.link.logout
    Should Exist    #header.student-view-nav
    Should Contain    #stu.view.title    Student's View
    Should Exist    #overview.personalInfoForm

Scenario 2
    [Documentation]         Test scenario for user John Lazy

    [Preparation]         Set Up
        Set Viewport 1501 1104
        Navigate To http://localhost:4680/tbuis/index.jsp

    [Actions]         Login with John Lazy
    Click    #header.link.login
    Input    #loginPage.userNameInput    lazy
    Input    #loginPage.passwordInput    pass
    Click    #loginPage.loginFormSubmit

    [Verification]         Check elements for user John Lazy
    Should Not Exist    #header.link.login
    Should Contain    #header.title.userHome    John Lazy
    Should Exist    #header.link.logout
    Should Exist    #header.teacher-view-nav
    Should Contain    #tea.view.title    Teacher's View
    Should Exist    #overview.personalInfoForm

    [Actions]         Failed Login attempts
    Input    #loginPage.userNameInput    bla
    Input    #loginPage.passwordInput    pass
    Should Exist    #loginPage.errorAlert
    Input    #loginPage.userNameInput    lazy
    Input    #loginPage.passwordInput    bla
    Should Exist    #loginPage.errorAlert

    [Teardown]         Tear Down
    Close Browser

Scenario 3
    [Documentation]         Test scenario for user Noah Brown with incorrect credentials

    [Preparation]         Set Up
        Set Viewport 1501 1104
        Navigate To http://localhost:4680/tbuis/index.jsp

    [Actions]         Login with incorrect credentials for Noah Brown
    Click    #header.link.login
    Input    #loginPage.userNameInput    Noah Brown
    Input    #loginPage.passwordInput    incorrect_password
    Click    #loginPage.loginFormSubmit

    [Verification]         Check for error message
    Should Exist    #loginPage.errorAlert

    [Teardown]         Tear Down
    Close Browser

Scenario 4
    [Documentation]         Test scenario for user John Lazy with incorrect credentials

    [Preparation]         Set Up
        Set Viewport 1501 1104
        Navigate To http://localhost:4680/tbuis/index.jsp

    [Actions]         Login with incorrect credentials for John Lazy
    Click    #header.link.login
    Input    #loginPage.userNameInput    John Lazy
    Input    #loginPage.passwordInput    incorrect_password
    Click    #loginPage.loginFormSubmit

    [Verification]         Check for error message
    Should Exist    #loginPage.errorAlert

    [Teardown]         Tear Down
    Close Browser