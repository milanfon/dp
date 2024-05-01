 ```python
*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
@{url_student_view}        http://localhost:4680/tbuis/student-view/mySubjects
@{"url_teacher_view"}      http://localhost:4680/tbuis/teacher-view/mySubjects
@{"url_teacher_view_my_exam_dates"} http://localhost:4680/tbuis/teacher-view/myExamDates
@{"url_teacher_view_set_evaluation"} http://localhost:4680/tbuis/teacher-view/setEvaluation
@{"url_teacher_view_evaluation_table"} http://localhost:4680/tbuis/teacher-view/evaluationTable
@{"url_login"}             http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Student_View_and_Teacher_Checks
    [Documentation]        Test case to check elements for student and teacher

    Open Browser to student view
    ${status_student_view} = Open Browser ${url_student_view}

    [Teardown]
    Close Browser

    Open Browser to teacher view
    ${status_teacher_view} = Open Browser ${url_teacher_view}

    [Teardown]
    Close Browser

    Login as teacher
    ${status_teacher_login} = Login    username=pedant    password=pass

    [Teardown]
    Close Browser

    Student_View_Checks
    ${status_student_subjects} = Go To Page ${url_student_view}

    [Check]
    ${status_subjects_alert} = ExpectedElementIsVisible    id=stu.mySubjects.successAlert
    ${status_subjects_alert} = Should Be True

    ${status_subjects_title} = ExpectedElementIsVisible    id=stu.mySubjects.enrolledTable.Title
    ${status_subjects_title} = Should Be True

    ${status_subjects_absent} = ExpectedElementShouldNotBeVisible    xpath=//td[.="Database Systems"]
    ${status_subjects_absent} = Should Be True

    Logout
    Logout    Logout

    Login as student
    ${status_student_login} = Login    username=gray    password=pass

    [Teardown]
    Close Browser

    Teacher_View_Checks
    ${status_teacher_subjects} = Go To Page ${url_teacher_view}

    [Check]
    ${status_teacher_subjects_button} = ExpectedElementIsVisible    id=tea.mySubjects.table.listOfStudentsButton-1
    ${status_teacher_subjects_button} = Should Contain    Text=Students (0)

    ${status_teacher_exam_dates} = Go To Page ${url_teacher_view_my_exam_dates}

    [Check]
    ${status_teacher_exam_dates_button} = ExpectedElementIsVisible    id=tea.myExamDates.table.participantsButton-1-0
    ${status_teacher_exam_dates_button} = Should Contain    Text=Participants (0/10)

    ${status_teacher_set_evaluation} = Go To Page ${url_teacher_view_set_evaluation}

    [Check]
    ${status_teacher_set_evaluation_no_one_student} = ExpectedElementIsVisible    id=tea.setEvaluation.form.noOneStudent
    ${status_teacher_set_evaluation_no_one_student} = Should Be True

    ${status_teacher_evaluation_table} = Go To Page ${url_teacher_view_evaluation_table}
    ${status_teacher_evaluation_table_no_students} = ExpectedElementIsVisible    xpath=//td[.="No students on this exam date"]
    ${status_teacher_evaluation_table_no_students} = Should Be True

    Logout
    Logout

    *** Keywords ***
    Login
    [Arguments]    ${username}    ${password}
    [Documentation]    Login functionality
    [Teardown]
    Clear Browser Cookies
    [Variables]    ${username}    ${password}
    ${status_login} = Open Browser ${url_login}
    [Wait]    ${status_login} = Until Page Contains    Login
    [Variables]    ${cookie} = Get Cookie    JSESSIONID
    [Variables]    ${status_login} = Get Element Text    id=status
    [Variables]    ${status_login} = Set To    ${status_login_text}
    [If]    ${status_login} = Regexp    Error
    [Documentation]    Error message
    [Return]    ${status_login_text}
    [Else]
    [Documentation]    Success message
    [Return]    ${status_login_text} = Regexp    Successfully logged in
    [Documentation]    Username and Password input
    [Variables]    ${username_input} = Get Element    id=username
    [Variables]    ${password_input} = Get Element    id=password
    [Variables]    ${username_input_value} = Get Text    ${username_input}
    [Variables]    ${password_input_value} = Get Text    ${password_input}
    [Variables]    ${username_input_value} = Set To    ${username}
    [Variables]    ${password_input_value} = Set To    ${password}
    [Variables]    ${username_input} = Set Text    ${username}
    [Variables]    ${password_input} = Set Text    ${password}
    [Variables]    ${status_input} = Get Element Text    id=status
    [Variables]    ${status_input} = Set To    ${status_input_text}
    [Return]    ${status_input_text}

    Logout
    [Documentation]    Logout functionality
    [Teardown]
    [Variables]    ${status_logout} = Get Element Text    id=status
    [Variables]    ${status_logout} = Set To    ${status_logout_text}
    [Variables]    ${status_logout_text} = Should Be Equal To    Logout
    [Documentation]    Logout success message
    [Variables]    ${status_logout} = Set To    ${status_logout_text}
    [Variables]    ${status_logout} = Set To    ${status}
    [Return]    ${status_logout}

    Set Viewport
    [Arguments]    ${width}    ${height}    ${device_scale_factor}    ${is_mobile}    ${has_touch}    ${is_landscape}
    [Documentation]    Set viewport
    [Variables]    ${device_scale_factor} = Set Variable    ${device_scale_factor}
    ${status_viewport} = Set Viewport    ${width}x${height}    ${device_scale_factor}    ${is_mobile}    ${has_touch}    ${is_landscape}
    [Return]    ${status_viewport}

    Open Browser
    [Arguments]    ${url}
    [Documentation]    Open Browser
    [Variables]    ${status_open} = Open Browser    ${url}
    [Return]    ${status_open}

    ExpectedElementIsVisible
    [Arguments]    ${locator}
    [Documentation]    ExpectedElementIsVisible keyword checks that the given element is visible
    [Variables]    ${status_element} = Expected Element Should Be Visible ${locator}
    [Return]    ${status_element}

    ExpectedElementShouldNotBeVisible
    [Arguments]    ${locator}
    [Documentation]    ExpectedElementShouldNotBeVisible keyword checks that the given element is not visible
    [Variables]    ${status_element} = Expected Element Should Not Be Visible ${locator}
    [Return]    ${status_element}

    ExpectedElementIsVisible_with_timeout
    [Arguments]    ${locator}    ${timeout}
    [Documentation]    ExpectedElementIsVisible_with_timeout keyword checks that the given element is visible within the given timeout
    [Variables]    ${status_element} = Expected Element Should Be Visible ${locator}    Within ${timeout} seconds
    [Return]    ${status_element}

    ExpectedElementShouldNotBeVisible_with_timeout
    [Arguments]    ${locator}    ${timeout}
    [Documentation]    ExpectedElementShouldNotBeVisible_with_timeout keyword checks that the given element is not visible within the given timeout
    [Variables]    ${status_element} = Expected Element Should Not Be Visible ${locator}    Within ${timeout} seconds
    [Return]    ${status_element}

    ExpectedTextShouldBe
    [Arguments]    ${locator}    ${expected_text}
    [Documentation]    ExpectedTextShouldBe keyword checks that the given text is displayed
    [Variables]    ${status_text} = Expected Text Should Be ${expected_text}    ${locator}
    [Return]    ${status_text}

    ExpectedTextShouldNotBe
    [Arguments]    ${locator}    ${expected_text}
    [Documentation]    ExpectedTextShouldNotBe keyword checks that the given text is not displayed
    [Variables]    ${status_text} = Expected Text Should Not Be ${expected_text}    ${locator}
    [Return]    ${status_text}

    ExpectedTextShouldBe_with_timeout
    [Arguments]    ${locator}    ${expected_text}    ${timeout}
    [Documentation]    ExpectedTextShouldBe_with_timeout keyword checks that the given text is displayed within the given timeout
    [Variables]    ${status_text} = Expected Text Should Be ${expected_text}    ${locator}    Within ${timeout} seconds
    [Return]    ${status_text}

    ExpectedTextShouldNotBe_with_timeout
    [Arguments]    ${locator}    ${expected_text}    ${timeout}
    [Documentation]    ExpectedTextShouldNotBe_with_timeout keyword checks that the given text is not displayed within the given timeout
    [Variables]    ${status_text} = Expected Text Should Not Be ${expected_text}    ${locator}    Within ${timeout} seconds
    [Return]    ${status_text}

    ExpectedTitleShouldBe
    [Arguments]    ${expected_title}
    [Documentation]    ExpectedTitleShouldBe keyword checks that the given title is displayed
    [Variables]    ${status_title} = Expected Title Should Be ${expected_title}
    [Return]    ${status_title}

    ExpectedTitleShouldNotBe
    [Arguments]    ${expected_title}
    [Documentation]    ExpectedTitleShouldNotBe keyword checks that the given title is not displayed
    [Variables]    ${status_title} = Expected Title Should Not Be ${expected_title}
    [Return]    ${status_title}

    ExpectedTitleShouldBe_with_timeout
    [Arguments]    ${expected_title}    ${timeout}
    [Documentation]    ExpectedTitleShouldBe_with_timeout keyword checks that the given title is displayed within the given timeout
    [Variables]    ${status_title} = Expected Title Should Be ${expected_title}    Within ${timeout} seconds
    [Return]    ${status_title}

    ExpectedTitleShouldNotBe_with_timeout
    [Arguments]    ${expected_title}    ${timeout}
    [Documentation]    ExpectedTitleShouldNotBe_with_timeout keyword checks that the given title is not displayed within the given timeout
    [Variables]    ${status_title} = Expected Title Should Not Be ${expected_title}    Within ${timeout} seconds
    [Return]    ${status_title}

    ExpectedElementShouldContain
    [Arguments]    ${locator}    ${expected_text}
    [Documentation]    ExpectedElementShouldContain keyword checks that the given element contains the given text
    [Variables]    ${status_text} = Expected Element Should Contain ${expected_text}    ${locator}
    [Return]]    ${status_text}

    ExpectedElementShouldContain
    [Arguments]]    ${expected_text}    ${expected_locator