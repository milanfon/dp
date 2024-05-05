*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
@{login_credentials_noah}         "username"="brown"         "password"="pass"
@{login_credentials_lazy}        "username"="lazy"         "password"="pass"
@{login_credentials_bla}         "username"="bla"         "password"="pass"

*** Test Cases ***

Test Case    Test_Noah_Login
    [Documentation]    Testing login with valid credentials (Noah Brown)
    [Tags]    login

    Set     ${NOAH_CREDENTIALS}    ${login_credentials_noah}

    SetViewport    1501    1104
    Navigate    http://localhost:4680/tbuis/index.jsp

    ${element} =    Get Element    //*[@id="header.link.login"]
    Should Not Exist    ${element}

    ${element} =    Get Element    //*[@id="header.title.userHome"]
    Should Contain    ${element.text}    Noah Brown

    ${element} =    Get Element    //*[@id="header.link.logout"]
    Should Exist    ${element}

    ${element} =    Get Element    #header.student-view-nav
    Should Exist    ${element}

    ${element} =    Get Element    #stu.view.title
    Should Contain    ${element.text}    Student's View

    ${element} =    Get Element    #overview.personalInfoForm
    Should Exist    ${element}

    Test Case    Test_Lazy_Login
        [Documentation]        Testing login with valid credentials (John Lazy)
        [Tags]        login

        Set     ${LAZY_CREDENTIALS}    ${login_credentials_lazy}

        SetViewport    1501    1104
        Navigate    http://localhost:4680/tbuis/index.jsp

        ${element} =    Get Element    //*[@id="header.link.login"]
        Should Not Exist    ${element}

        ${element} =    Get Element    //*[@id="header.title.userHome"]
        Should Contain    ${element.text}    John Lazy

        ${element} =    Get Element    //*[@id="header.link.logout"]
        Should Exist    ${element}

        ${element} =    Get Element    #header.teacher-view-nav
        Should Exist    ${element}

        ${element} =    Get Element    #tea.view.title
        Should Contain    ${element.text}    Teacher's View

        ${element} =    Get Element    #overview.personalInfoForm
        Should Exist    ${element}

    Test Case    Test_Invalid_Credentials_1
        [Documentation]        Testing login with invalid credentials (bla and pass)
        [Tags]        login

        Set     ${BLA_CREDENTIALS}    ${login_credentials_bla}

        SetViewport    1501    1104
        Navigate    http://localhost:4680/tbuis/index.jsp

        ${element} =    Get Element    //*[@id="header.link.login"]
        Should Not Exist    ${element}

        Navigate    ${SeleniumLibrary.GoToURL}"http://localhost:4680/tbuis/login"

        ${element} =    Get Element    #loginPage.errorAlert
        Should Exist    ${element}

        Log    [ERROR]    Incorrect username or password

        Go To    ${SeleniumLibrary.GoBack}

        Set     ${BLA_CREDENTIALS_USERNAME}    ${BLA_CREDENTIALS.username}
        Set     ${BLA_CREDENTIALS_PASSWORD}    ${BLA_CREDENTIALS.password}

        Set Text    ${BLA_USERNAME}    ${BLA_CREDENTIALS_USERNAME}
        Set Text    ${BLA_PASSWORD}    ${BLA_CREDENTIALS_PASSWORD}

        Set Element From List    ${BLA_USERNAME_ELEMENT}    ${Elements}    text=${BLA_USERNAME}
        Set Element From List    ${BLA_PASSWORD_ELEMENT}    ${Elements}    text=${BLA_PASSWORD}

        Click Element    ${BLA_USERNAME_ELEMENT}

        Set Value    ${BLA_USERNAME_ELEMENT}    ${BLA_USERNAME}

        Click Element    ${BLA_PASSWORD_ELEMENT}

        Click Element    #loginPage.loginFormSubmit

        ${element} =    Get Element    #loginPage.errorAlert
        Should Exist    ${element}

        Log    [ERROR]    Incorrect username or password

    Test Case    Test_Invalid_Credentials_2
        [Documentation]        Testing login with invalid credentials (lazy and bla)
        [Tags]        login

        Set     ${LAZY_CREDENTIALS}    ${login_credentials_lazy}

        SetViewport    1501    1104
        Navigate    http://localhost:4680/tbuis/index.jsp

        ${element} =    Get Element    //*[@id="header.link.login"]
        Should Not Exist    ${element}

        Navigate    ${SeleniumLibrary.GoToURL}"http://localhost:4680/tbuis/login"

        ${element} =    Get Element    #loginPage.errorAlert
        Should Exist    ${element}

        Log    [ERROR]    Incorrect username or password

        Go To    ${SeleniumLibrary.GoBack}

        Set     ${LAZY_CREDENTIALS_USERNAME}    ${LAZY_CREDENTIALS.username}
        Set     ${LAZY_CREDENTIALS_PASSWORD}    ${LAZY_CREDENTIALS.password}

        Set Text    ${LAZY_USERNAME}    ${LAZY_CREDENTIALS_USERNAME}
        Set Text    ${LAZY_PASSWORD}    ${LAZY_CREDENTIALS_PASSWORD}

        Set Element From List    ${LAZY_USERNAME_ELEMENT}    ${Elements}    text=${LAZY_USERNAME}
        Set Element From List    ${LAZY_PASSWORD_ELEMENT}    ${Elements}    text=${LAZY_PASSWORD}

        Click Element    ${LAZY_USERNAME_ELEMENT}

        Set Value    ${LAZY_USERNAME_ELEMENT}    ${LAZY_USERNAME}

        Click Element    ${LAZY_PASSWORD_ELEMENT}

        Click Element    #loginPage.loginFormSubmit

        ${element} =    Get Element    #loginPage.errorAlert
        Should Exist    ${element}

        Log    [ERROR]    Incorrect username or password

*** Teardown ***
    Close Browser