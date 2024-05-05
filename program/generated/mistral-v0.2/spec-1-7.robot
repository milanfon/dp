*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
URL             http://localhost:4680/tbuis/index.jsp
login_username   Noah Brown
login_password   pass
teacher_username  John Lazy
teacher_password  pass

*** Test Case ***
Spec 1
    [Documentation]   Run first scenario
    [Documentation]   Open URL and login with Noah Brown
    [Documentation]   Check elements on Noah Brown's Student's View

    Open Browser    ${URL}
    Set Element ID    header.link.login    header.link.login
    [Documentation]   Check if login link is not present
    [Documentation]   Wait 1s
    Wait Until Element Not Is Visible    ${header.link.login}

    Set Element ID    header.title.userHome    header.title.userHome
    [Documentation]   Check if header.title.userHome has inner value "Noah Brown"
    [Documentation]   Wait 1s
    Wait For Element Text    header.title.userHome    ${login_username}

    Set Element ID    header.link.logout    header.link.logout
    [Documentation]   Check if logout link is present
    [Documentation]   Wait 1s
    Wait For Element To Be Visible    header.link.logout

    Set Element ID    header.student-view-nav    header.student-view-nav
    [Documentation]   Check if header.student-view-nav exists
    [Documentation]   Wait 1s
    Wait For Element    header.student-view-nav

    Set Element ID    stu.view.title    stu.view.title
    [Documentation]   Check if stu.view.title matches "Student's View"
    [Documentation]   Wait 1s
    Wait For Element Text    stu.view.title    Student's View

    Set Element ID    overview.personalInfoForm    overview.personalInfoForm
    [Documentation]   Check if overview.personalInfoForm is present
    [Documentation]   Wait 1s
    Wait For Element    overview.personalInfoForm

    [Documentation]   Close browser
    Close Browser

    [Documentation]   Run second scenario
    [Documentation]   Open URL and login with John Lazy
    [Documentation]   Check elements on John Lazy's Teacher's View

    Open Browser    ${URL}
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False

    Set Element ID    header.link.login    header.link.login
    [Documentation]   Check if login link is not present
    [Documentation]   Wait 1s
    Wait Until Element Not Is Visible    header.link.login

    Set Element ID    header.title.userHome    header.title.userHome
    [Documentation]   Check if header.title.userHome has inner value "John Lazy"
    [Documentation]   Wait 1s
    Wait For Element Text    header.title.userHome    ${teacher_username}

    Set Element ID    header.link.logout    header.link.logout
    [Documentation]   Check if logout link is present
    [Documentation]   Wait 1s
    Wait For Element To Be Visible    header.link.logout

    Set Element ID    header.teacher-view-nav    header.teacher-view-nav
    [Documentation]   Check if header.teacher-view-nav exists
    [Documentation]   Wait 1s
    Wait For Element    header.teacher-view-nav

    Set Element ID    tea.view.title    tea.view.title
    [Documentation]   Check if tea.view.title matches "Teacher's View"
    [Documentation]   Wait 1s
    Wait For Element Text    tea.view.title    Teacher's View

    Set Element ID    overview.personalInfoForm    overview.personalInfoForm
    [Documentation]   Check if overview.personalInfoForm is present
    [Documentation]   Wait 1s
    Wait For Element    overview.personalInfoForm

    [Documentation]   Close browser
    Close Browser

    [Documentation]   Run third scenario
    [Documentation]   Open URL and login with bla and pass
    [Documentation]   Check if loginPage.errorAlert is visible

    Open Browser    ${URL}
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False

    Set Element ID    header.link.login    header.link.login
    [Documentation]   Check if login link is not present
    [Documentation]   Wait 1s
    Wait Until Element Not Is Visible    header.link.login

    Set Element ID    loginPage.userNameInput    loginPage.userNameInput
    [Documentation]   Set username
    [Documentation]   Wait 1s
    Input Text    loginPage.userNameInput    bla

    Set Element ID    loginPage.passwordInput    loginPage.passwordInput
    [Documentation]   Set password
    [Documentation]   Wait 1s
    Input Text    loginPage.passwordInput    pass

    Set Element ID    loginPage.loginFormSubmit    loginPage.loginFormSubmit
    [Documentation]   Click login button
    [Documentation]   Wait 1s
    Click Element    loginPage.loginFormSubmit

    [Documentation]   Wait 1s
    [Documentation]   Check if loginPage.errorAlert is visible
    [Documentation]   Wait 1s
    Wait For Element    loginPage.errorAlert
    [Documentation]   Check if loginPage.errorAlert is visible
    [Documentation]   Wait 1s
    Wait For Element To Be Visible    loginPage.errorAlert
    [Documentation]   Wait 1s
    Wait For Element To Be Visible    loginPage.errorAlert
    [Documentation]   Close browser

    [Documentation]   Run fourth scenario
    [Documentation]   Open URL and login with lazy and pass
    [Documentation]   Check if loginPage.errorAlert is present

    Open Browser    ${URL}
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False

    Set Element ID    header.link.login    header.link.login
    [Documentation]   Check if login link is not present
    [Documentation]   Wait 1s
    Wait Until Element Not Is Visible    header.link.login

    Set Element ID    loginPage.userNameInput    loginPage.userNameInput
    [Documentation]   Set username
    [Documentation]   Wait 1s
    Input Text    loginPage.userNameInput    lazy

    Set Element ID    loginPage.passwordInput    loginPage.passwordInput
    [Documentation]   Set password
    [Documentation]   Wait 1s
    Input Text    loginPage.passwordInput    pass

    Set Element ID    loginPage.loginFormSubmit    loginPage.loginFormSubmit
    [Documentation]   Click login button
    [Documentation]   Wait 1s
    Click Element    loginPage.loginFormSubmit

    [Documentation]   Wait 1s
    [Documentation]   Check if loginPage.errorAlert is present
    [Documentation]   Wait 1s
    Wait For Element    loginPage.errorAlert
    [Documentation]   Check if loginPage.errorAlert is present
    [Documentation]   Wait 1s
    Wait For Element    loginPage.errorAlert
    [Documentation]   Wait 1s
    Wait For Element    loginPage.errorAlert
    [Documentation]   Check if loginPage.errorAlert is present
    [Documentation]   Wait 1s
    Wait For Element    loginPage.errorAlert
    [Documentation]   Check if loginPage.errorAlert is present
    [Documentation]   Wait 1s
    Wait For Element    loginPage.errorAlert
    [Documentation]   [Expected]   False
    [Documentation]   Close browser

*** Test Cases ***
Spec 1
Spec 1 teacher
Spec 1 bla
Spec 1 lazy