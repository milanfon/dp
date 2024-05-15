*** Settings ***
Library           SeleniumLibrary
Browser           Chrome

*** Variables ***
login_url         =    http://localhost:4680/tbuis/login
student_url       =    http://localhost:4680/tbuis/student-view/overview
teacher_url       =    http://localhost:4680/tbuis/teacher-view/overview

*** Test Cases ***

Scenario_1_Student
    [Documentation]    This scenario checks the elements on the student page

    Set Viewport       1501    1104
    Navigate            ${student_url}

    [Actions]
    Should Not Exist    id=header.link.login
    Should Contain     id=header.title.userHome    Noah Brown
    Should Exist        id=header.link.logout
    Should Exist        #header.student-view-nav
    Should Contain     id=stu.view.title             Student's View
    Should Exist        id=overview.personalInfoForm

    Sleep            5

Scenario_1_Teacher
    [Documentation]    This scenario checks the elements on the teacher page

    Set Viewport       1501    1104
    Navigate            ${teacher_url}

    [Actions]
    Should Not Exist    id=header.link.login
    Should Contain     id=header.title.userHome    John Lazy
    Should Exist        id=header.link.logout
    Should Exist        #header.teacher-view-nav
    Should Contain     id=tea.view.title             Teacher's View
    Should Exist        id=overview.personalInfoForm

    Sleep            5

Scenario_2_Invalid_Login_Student
    [Documentation]    This scenario checks the error message when invalid login credentials are used for the student page

    Set Viewport       1501    1104
    Navigate            ${login_url}

    [Actions]
    Click Element    id=header.link.login
    Set Text        id=loginPage.userNameInput        bla
    Set Text        id=loginPage.passwordInput        pass
    Click Element    id=loginPage.loginFormSubmit

    [Checks]
    Should Exist        id=loginPage.errorAlert

    Sleep            5

    Set Text        id=loginPage.userNameInput        brown
    Set Text        id=loginPage.passwordInput        pass
    Click Element    id=loginPage.loginFormSubmit

    [Checks]
    Should Exist        id=loginPage.errorAlert

    Sleep            5

Scenario_2_Invalid_Login_Teacher
    [Documentation]    This scenario checks the error message when invalid login credentials are used for the teacher page

    Set Viewport       1501    1104
    Navigate            ${login_url}

    [Actions]
    Click Element    id=header.link.login
    Set Text        id=loginPage.userNameInput        lazy
    Set Text        id=loginPage.passwordInput        bla
    Click Element    id=loginPage.loginFormSubmit

    [Checks]
    Should Exist        id=loginPage.errorAlert

    Sleep            5

*** Teardown ***
    Close Browser