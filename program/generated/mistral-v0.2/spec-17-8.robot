*** Settings ***
Library            SeleniumLibrary
Library            OperatingSystem
Library            DateTime

*** Variables ***
${BROWSER}            Chrome
${URL}                http://localhost:4680/tbuis/index.jsp
${TEACHER_USERNAME}    pierce
${TEACHER_PASSWORD}    pass
${STUDENT_USERNAME}    yellow
${STUDENT_PASSWORD}    pass

*** Test Cases ***

Test Teacher Scenario
    [Documentation]        Test teacher scenario
    [Tags]                 teacher

    [Preparation]
    Set Viewport            ${WIDTH}                 1501
                            ${HEIGHT}                1104
                            ${DEVICE_SCALE_FACTOR}    1
                            ${IS_MOBILE}             False
                            ${HAS_TOUCH}            False
                            ${IS_LANDSCAPE}          False

    ${TEACHER_LOGIN} =    Run Keywords And Ignore Failure    Login As Teacher
    Run Keywords            Click Element            id=tea.menu.otherSubjects
    Run Keywords            Click Element            id=tea.otherSubjects.table.participateButton-3
    Sleep                   3s

    [Teardown]
    Close Browser

    [Step]
    Click Element            id=tea.otherSubjects.table.participateButton-3
    Sleep                   2s

    [Step]
    Should Be Element Present            id=tea.otherSubjects.successAlert
    Should Be Text Present            id=tea.otherSubjects.table.subjectRow-2        Linear Algebra
    Should Be Text Present            id=tea.otherSubjects.table.subjectRow-2        Alice Pedant

    [Step]
    Click Element            id=tea.menu.myExamDates
    Should Be Text Present            id=tea.myExamDates.table.noRecords-2        No exam dates.
    Should Be Text Present            xpath=//tr[2]/td[2]                        Linear Algebra

    [Step]
    Click Element            id=tea.menu.newExamDates
    Should Be Text Present            id=tea.newExamDates.selectOption.linearAlgebra    Linear Algebra

    [Step]
    Click Element            id=tea.menu.listOfAllTeachers
    Should Be Text Present            xpath=//tr[3]/td[3]                        Linear Algebra
    Should Be Text Present            xpath=//tr[3]/td[2]                        Alice Pedant

Test Student Scenario
    [Documentation]        Test student scenario
    [Tags]                 student

    [Preparation]
    Set Viewport            ${WIDTH}                 1501
                            ${HEIGHT}                1104
                            ${DEVICE_SCALE_FACTOR}    1
                            ${IS_MOBILE}             False
                            ${HAS_TOUCH}            False
                            ${IS_LANDSCAPE}          False

    ${STUDENT_LOGIN} =    Run Keywords And Ignore Failure    Login As Student
    Run Keywords            Click Element            id=stu.menu.otherSubjects

    [Step]
    Should Be Text Present            xpath=//tr[2]/td[2]                        Linear Algebra
    Should Be Text Present            xpath=//tr[2]/td[3]                        Alice Pedant

Test Teacher And Student Scenarios
    [Documentation]        Test teacher and student scenarios

    [Preparation]
    Set Viewport            ${WIDTH}                 1501
                            ${HEIGHT}                1104
                            ${DEVICE_SCALE_FACTOR}    1
                            ${IS_MOBILE}             False
                            ${HAS_TOUCH}            False
                            ${IS_LANDSCAPE}          False

    ${TEACHER_LOGIN} =    Run Keywords And Ignore Failure    Login As Teacher

    [Teardown]
    Close Browser

    ${STUDENT_LOGIN} =    Run Keywords And Ignore Failure    Login As Student

    [Step]
    Run Test Case            Test Teacher Scenario

    [Step]
    Run Test Case            Test Student Scenario

Login As Teacher
    [Documentation]        Login as a teacher

    [Step]
    Navigate To URL            ${URL}
    Click Element            id=header.link.login
    Input Text            id=loginPage.userNameInput        ${TEACHER_USERNAME}
    Input Text            id=loginPage.passwordInput        ${TEACHER_PASSWORD}
    Click Element            id=loginPage.loginFormSubmit

Login As Student
    [Documentation]        Login as a student

    [Step]
    Navigate To URL            ${URL}
    Click Element            id=header.link.login
    Input Text            id=loginPage.userNameInput        ${STUDENT_USERNAME}
    Input Text            id=loginPage.passwordInput        ${STUDENT_PASSWORD}
    Click Element            id=loginPage.loginFormSubmit

*** Keywords ***

Login As Teacher
    [Documentation]        Login as a teacher

    [Arguments]

    ${VIEWPORT_WIDTH}
    ${VIEWPORT_HEIGHT}
    ${DEVICE_SCALE_FACTOR}
    ${IS_MOBILE}
    ${HAS_TOUCH}
    ${IS_LANDSCAPE}

    [Steps]
    Set Viewport            ${VIEWPORT_WIDTH}            ${VIEWPORT_HEIGHT}
                            ${DEVICE_SCALE_FACTOR}
                            ${IS_MOBILE}
                            ${HAS_TOUCH}
                            ${IS_LANDSCAPE}

    Click Element            id=header.link.login
    Input Text            id=loginPage.userNameInput        ${TEACHER_USERNAME}
    Input Text            id=loginPage.passwordInput        ${TEACHER_PASSWORD}
    Click Element            id=loginPage.loginFormSubmit

Login As Student
    [Documentation]        Login as a student

    [Arguments]

    ${VIEWPORT_WIDTH}
    ${VIEWPORT_HEIGHT}
    ${DEVICE_SCALE_FACTOR}
    ${IS_MOBILE}
    ${HAS_TOUCH}
    ${IS_LANDSCAPE}

    [Steps]
    Set Viewport            ${VIEWPORT_WIDTH}            ${VIEWPORT_HEIGHT}
                            ${DEVICE_SCALE_FACTOR}
                            ${IS_MOBILE}
                            ${HAS_TOUCH}
                            ${IS_LANDSCAPE}

    Click Element            id=header.link.login
    Input Text            id=loginPage.userNameInput        ${STUDENT_USERNAME}
    Input Text            id=loginPage.passwordInput        ${STUDENT_PASSWORD}
    Click Element            id=loginPage.loginFormSubmit

Logout
    [Documentation]        Logout

    [Arguments]

    ${VIEWPORT_WIDTH}
    ${VIEWPORT_HEIGHT}
    ${DEVICE_SCALE_FACTOR}
    ${IS_MOBILE}
    ${HAS_TOUCH}
    ${IS_LANDSCAPE}

    [Steps]
    Click Element            id=header.link.logout
    Click Element            id=logoutConfirmation
    Sleep                   2s
    Close Browser