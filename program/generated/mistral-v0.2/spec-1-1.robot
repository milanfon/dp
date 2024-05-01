*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
username1 = "brown"
password1 = "pass"
username2 = "bla"
password2 = "pass"
username3 = "lazy"
password3 = "bla"

*** Test Case ***
Test Case student
    [Documentation] Test student login

    Set Viewport   1501    1104
    Navigate To     http://localhost:4680/tbuis/index.jsp
    Should Not Exist    id=header.link.login
    Should Text    id=header.title.userHome    equal    Noah Brown
    Should Exist    id=header.link.logout
    Should Exist    #header.student-view-nav
    Should Text    id=stu.view.title    equal    Student's View
    Should Exist    id=overview.personalInfoForm

    # Student login
    Click Element    #header.link.login
    Input Text    #loginPage.userNameInput    ${username1}
    Input Text    #loginPage.passwordInput    ${password1}
    Click Element    #loginPage.loginFormSubmit
    Sleep        1s

    # Teacher login
    Set Up Variables
        **{
            "username":    "teacher",
            "password":    "teacher_password"
        }
    **
    Click Element    #header.link.login
    Input Text    #loginPage.userNameInput    ${username3}
    Input Text    #loginPage.passwordInput    ${password3}
    Click Element    #loginPage.loginFormSubmit
    Sleep        1s

    # Verify error alert for invalid login
    Should Exist    #loginPage.errorAlert

    # Invalid login with username "bla" and password "pass"
    Click Element    #header.link.login
    Input Text    #loginPage.userNameInput    bla
    Input Text    #loginPage.passwordInput    ${password2}
    Click Element    #loginPage.loginFormSubmit
    Sleep        1s

    # Verify error alert for invalid login
    Should Exist    #loginPage.errorAlert

    # Invalid login with username "lazy" and password "bla"
    Click Element    #header.link.login
    Input Text    #loginPage.userNameInput    ${username2}
    Input Text    #loginPage.passwordInput    bla
    Click Element    #loginPage.loginFormSubmit
    Sleep        1s

    # Verify error alert for invalid login
    Should Exist    #loginPage.errorAlert

*** Test Case ***
Test Case teacher
    [Documentation] Test teacher login

    Set Viewport   1501    1104
    Navigate To     http://localhost:4680/tbuis/index.jsp
    Should Not Exist    id=header.link.login
    Should Text    id=header.title.userHome    equal    John Lazy
    Should Exist    id=header.link.logout
    Should Exist    #header.teacher-view-nav
    Should Text    id=tea.view.title    equal    Teacher's View
    Should Exist    id=overview.personalInfoForm

    # Teacher login
    Click Element    #header.link.login
    Input Text    #loginPage.userNameInput    ${username3}
    Input Text    #loginPage.passwordInput    ${password3}
    Click Element    #loginPage.loginFormSubmit
    Sleep        1s

    # Verify error alert for valid login
    Should Not Exist    #loginPage.errorAlert

    # Invalid login with username "bla" and password "pass"
    Click Element    #header.link.login
    Input Text    #loginPage.userNameInput    bla
    Input Text    #loginPage.passwordInput    ${password2}
    Click Element    #loginPage.loginFormSubmit
    Sleep        1s

    # Verify error alert for invalid login
    Should Exist    #loginPage.errorAlert

    # Invalid login with username "lazy" and password "bla"
    Click Element    #header.link.login
    Input Text    #loginPage.userNameInput    ${username2}
    Input Text    #loginPage.passwordInput    bla
    Click Element    #loginPage.loginFormSubmit
    Sleep        1s

    # Verify error alert for invalid login
    Should Exist    #loginPage.errorAlert

*** Teardown ***
Close Browser