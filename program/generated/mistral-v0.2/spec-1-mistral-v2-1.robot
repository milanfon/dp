*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL} = http://localhost:4680/tbuis/index.jsp
${LOGIN_USER} = "Noah Brown"
${LOGIN_USER_TEACHER} = "John Lazy"
${LOGIN_INVALID_USER} = "bla"
${LOGIN_INVALID_PASS} = "pass"
${LOGIN_VALID_USER} = "brown"
${LOGIN_VALID_PASS} = "pass"

*** Test Cases ***
Scenario: Check user home page elements
    [Documentation]     This scenario checks the elements on the user home page.

    [Tags]  user_home

    Navigate To ${URL}

    [Steps]
    ${header_link_login_present} = Get Element Id "header.link.login"
    Should Not Be ${header_link_login_present}

    ${header_title_user_home} = Get Text Id "header.title.userHome"
    Should Be ${LOGIN_USER} In ${header_title_user_home}

    ${header_link_logout_present} = Get Element Id "header.link.logout"
    Should Be ${header_link_logout_present}

    ${header_student_view_nav_present} = Get Element "#header.student-view-nav"
    Should Be True ${header_student_view_nav_present.IsVisible}

Scenario: Check teacher home page elements
    [Documentation]     This scenario checks the elements on the teacher home page.

    [Tags]  teacher_home


    Navigate To ${URL}

    [Steps]
    ${header_link_login_present} = Get Element Id "header.link.login"
    Should Not Be ${header_link_login_present}

    ${header_title_user_home} = Get Text Id "header.title.userHome"
    Should Be ${LOGIN_USER_TEACHER} In ${header_title_user_home}

    ${header_link_logout_present} = Get Element Id "header.link.logout"
    Should Be ${header_link_logout_present}

    ${header_teacher_view_nav_present} = Get Element "#header.teacher-view-nav"
    Should Be True ${header_teacher_view_nav_present.IsVisible}

Scenario: Invalid login attempts
    [Documentation]
    This scenario tests invalid login attempts.

    [Tags]
    invalid_login

    Navigate To ${URL}

    [Steps]
    ${header_link_login_present} = Get Element Id "header.link.login"
    Should Not Be ${header_link_login_present}

    Click Element Id "header.link.login"

    Input Text Id "loginPage.userNameInput" ${LOGIN_INVALID_USER}
    Input Text Id "loginPage.passwordInput" ${LOGIN_INVALID_PASS}

    Click Element Id "loginPage.loginFormSubmit"

    ${error_alert_present} = Get Element Id "loginPage.errorAlert"
    Should Be True ${error_alert_present.IsVisible}
