*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
username_brown    =    "brown"
password_brown    =    "pass"
username_lazy     =    "lazy"
password_lazy     =    "bla"

*** Test Cases ***

Scenario_Student
    [Documentation]    Student scenario

    [Precondition]    Set Viewport    width    1501    height    1104    deviceScaleFactor    1    isMobile    False    hasTouch    False    isLandscape    False
    [Precondition]    Navigate    http://localhost:4680/tbuis/index.jsp
    [Precondition]    Click    #header.link.login
    [Precondition]    InputText    #loginPage.userNameInput    ${username_brown}
    [Precondition]    InputText    #loginPage.passwordInput    ${password_brown}
    [Precondition]    Click    #loginPage.loginFormSubmit
    [Precondition]    Wait    UntilElementIsVisible   10s    #header.title.userHome[contains[.]/text()="Noah Brown"]
    [Precondition]    Should Be True    Element Should Not Exist    #header.link.login
    [Precondition]    Should Be True    Element Should Exist    #header.student-view-nav
    [Precondition]    Should Be True    Element Should Exist    #stu.view.title[.="Student's View"]
    [Precondition]    Should Be True    Element Should Exist    #overview.personalInfoForm

Scenario_Student_Wrong_Credentials
    [Documentation]    Student scenario with wrong credentials

    [Precondition]    Set Viewport    width    1501    height    1104    deviceScaleFactor    1    isMobile    False    hasTouch    False    isLandscape    False
    [Precondition]    Navigate    http://localhost:4680/tbuis/index.jsp
    [Precondition]    Click    #header.link.login
    [Precondition]    InputText    #loginPage.userNameInput    bla
    [Precondition]    InputText    #loginPage.passwordInput    ${password_brown}
    [Precondition]    Click    #loginPage.loginFormSubmit
    [Precondition]    Should Be True    Element Should Be Visible    #loginPage.errorAlert

Scenario_Student_Wrong_Password
    [Documentation]    Student scenario with wrong password

    [Precondition]    Set Viewport    width    1501    height    1104    deviceScaleFactor    1    isMobile    False    hasTouch    False    isLandscape    False
    [Precondition]    Navigate    http://localhost:4680/tbuis/index.jsp
    [Precondition]    Click    #header.link.login
    [Precondition]    InputText    #loginPage.userNameInput    ${username_brown}
    [Precondition]    InputText    #loginPage.passwordInput    lazy
    [Precondition]    Click    #loginPage.loginFormSubmit
    [Precondition]    Should Be True    Element Should Be Visible    #loginPage.errorAlert

Scenario_Teacher
    [Documentation]    Teacher scenario

    [Precondition]    Set Viewport    width    1501    height    1104    deviceScaleFactor    1    isMobile    False    hasTouch    False    isLandscape    False
    [Precondition]    Navigate    http://localhost:4680/tbuis/index.jsp
    [Precondition]    Click    #header.link.login
    [Precondition]    InputText    #loginPage.userNameInput    ${username_lazy}
    [Precondition]    InputText    #loginPage.passwordInput    ${password_lazy}
    [Precondition]    Click    #loginPage.loginFormSubmit
    [Precondition]    Wait    UntilElementIsVisible   10s    #header.title.userHome[contains[.]/text()="John Lazy"]
    [Precondition]    Should Be True    Element Should Not Exist    #header.link.login
    [Precondition]    Should Be True    Element Should Exist    #header.teacher-view-nav
    [Precondition]    Should Be True    Element Should Exist    #tea.view.title[.="Teacher's View"]
    [Precondition]    Should Be True    Element Should Exist    #overview.personalInfoForm

*** Keywords ***

*** Comments ***