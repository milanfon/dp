*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
username1        Noah Brown
password1        pass
username2        John Lazy
password2        pass
invalid_username bla
invalid_password bla

*** Test Case ***
Test Case         Check Student View
    [Documentation]        Check if all elements in Student View are present

    Set Viewport        width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate            http://localhost:4680/tbuis/index.jsp
    [Documentation]        Login as a student

    Click Element        id=header.link.login
    Sleep               2s

    Element Should Not Exist    id=header.link.login

    Sleep               2s

    Element Should Contain    id=header.title.userHome    text=Noah Brown

    Element Should Exist    id=header.link.logout

    Element Should Exist    #header.student-view-nav

    Element Should Contain    id=stu.view.title    text=Student's View

    Element Should Exist    id=overview.personalInfoForm

*** Test Case ***
Test Case         Check Teacher View
    [Documentation]        Check if all elements in Teacher View are present

    Set Viewport        width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate            http://localhost:4680/tbuis/index.jsp

    Click Element        id=header.link.login
    Sleep               2s

    Element Should Not Exist    id=header.link.login

    Sleep               2s

    Element Should Contain    id=header.title.userHome    text=John Lazy

    Element Should Exist    id=header.link.logout

    Element Should Exist    #header.teacher-view-nav

    Element Should Contain    id=tea.view.title    text=Teacher's View

    Element Should Exist    id=overview.personalInfoForm

*** Test Case ***
Test Case         Invalid Login 1
    [Documentation]        Test invalid login with username 'bla' and password 'pass'

    Set Viewport        width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate            http://localhost:4680/tbuis/index.jsp

    Click Element        id=header.link.login
    Sleep               2s

    Element Should Exist    id=header.link.login

    Input Text            id=loginPage.userNameInput    ${invalid_username}
    Input Text            id=loginPage.passwordInput    ${invalid_password}

    Click Element        id=loginPage.loginFormSubmit
    Sleep               2s

    Element Should Be Visible    id=loginPage.errorAlert

*** Test Case ***
Test Case         Invalid Login 2
    [Documentation]        Test invalid login with username 'lazy' and password 'bla'

    Set Viewport        width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate            http://localhost:4680/tbuis/index.jsp

    Click Element        id=header.link.login
    Sleep               2s

    Element Should Exist    id=header.link.login

    Input Text            id=loginPage.userNameInput    ${username2}
    Input Text            id=loginPage.passwordInput    ${invalid_password}

    Click Element        id=loginPage.loginFormSubmit
    Sleep               2s

    Element Should Be Visible    id=loginPage.errorAlert

*** Teardown ***
    Close Browser