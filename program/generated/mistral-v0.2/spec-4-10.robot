 ```python
*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Case ***
My Subjects Checks
    [Document]    ${json}=    json    ${recording_1}

    [Document]    ${recording_1}=    ${json}

    [Document]    ${recording_2}=    ${json}

    [Document]    ${teacher_recording_1}=    ${json}

    [Document]    ${teacher_recording_2}=    ${json}

    [Document]    ${base_url}={url "http://localhost:4680/tbuis/"}

    [Document]    ${student_url}={url ${base_url}student-view/mySubjects}

    [Document]    ${teacher_url}={url ${base_url}teacher-view/mySubjects}

    [Document]    ${student_login}={text "Student's View"}

    [Document]    ${teacher_login}={text "Teacher's View"}

    [Document]    ${login_url}={url ${base_url}login}

    [Document]    ${student_login_button}={xpath "//*[@id='stu.menu.login']"}

    [Document]    ${teacher_login_button}={xpath "//*[@id='tea.menu.login']"}

    [Document]    ${username_input}={xpath "//*[@id='loginPage.userNameInput']"}

    [Document]    ${password_input}={xpath "//*[@id='loginPage.passwordInput']"}

    [Document]    ${login_button}={xpath "//*[@id='loginPage.loginButton']"}

    [Document]    ${stu_my_subjects_success_alert}={xpath "//*[@id='stu.mySubjects.successAlert']"}

    [Document]    ${stu_my_subjects_enrolled_table_title}={xpath "//*[@id='stu.mySubjects.enrolledTable.Title']"}

    [Document]    ${stu_my_subjects_enrolled_table_no_db_subject}={xpath "//*[@id='stu.mySubjects.enrolledTable']//td[.='Database Systems']"}

    [Document]    ${tea_my_subjects_table_list_of_students_button_0}={xpath "//*[@id='tea.mySubjects.table.listOfStudentsButton-1']"}

    [Document]    ${tea_my_exam_dates_table_participants_button_0_0}={xpath "//*[@id='tea.myExamDates.table.participantsButton-1-0']"}

    [Document]    ${tea_set_evaluation_form_no_one_student}={xpath "//*[@id='tea.setEvaluation.form.noOneStudent']"}

    [Document]    ${tea_evaluation_table_no_students_on_exam_date}={xpath "//*[@id='tea.evaluationTable.noStudents']"}

    [Document]    ${student_username}={Variable "student_username"}

    [Document]    ${student_password}={Variable "student_password"}

    [Document]    ${teacher_username}={Variable "teacher_username"}

    [Document]    ${teacher_password}={Variable "teacher_password"}

    [Document]    Set Up
        Set Username ${student_username}
        Set Password ${student_password}

    [Document]    Student Logins
        ${status}=    Open Browser    ${student_url}
        ${status}=    Maximize Window
        ${status}=    Input Text    ${username_input}    ${student_username}
        ${status}=    Input Text    ${password_input}    ${student_password}
        ${status}=    Click Element    ${login_button}
        ${status}=    Sleep    5s

    [Document]    Student Checks
        ${status}=    Wait Until Element Is Visible    ${stu_my_subjects_success_alert}
        ${status}=    Wait Until Element Is Visible    ${stu_my_subjects_enrolled_table_title}
        ${status}=    Wait Until Element Is Not Visible    ${stu_my_subjects_enrolled_table_no_db_subject}

    [Document]    Student Logs Out
        ${status}=    Click Element    ${student_login_button}
        ${status}=    Click Element    ${login_url}
        ${status}=    Input Text    ${username_input}    ${student_username}
        ${status}=    Input Text    ${password_input}    ${student_password}
        ${status}=    Click Element    ${login_button}
        ${status}=    Sleep    3s

    [Document]    Teacher Logs In
        ${status}=    Open Browser    ${login_url}
        ${status}=    Maximize Window
        ${status}=    Input Text    ${username_input}    ${teacher_username}
        ${status}=    Input Text    ${password_input}    ${teacher_password}
        ${status}=    Click Element    ${teacher_login_button}
        ${status}=    Sleep    3s

    [Document]    Teacher Checks
        ${status}=    Wait Until Element Is Visible    ${tea_my_subjects_table_list_of_students_button_0}
        ${status}=    Wait Until Element Is Visible    ${tea_my_exam_dates_table_participants_button_0_0}
        ${status}=    Wait Until Element Is Visible    ${tea_set_evaluation_form_no_one_student}
        ${status}=    Wait Until Element Is Visible    ${tea_evaluation_table_no_students_on_exam_date}

    [Document]    Teacher Logs Out
        ${status}=    Click Element    ${teacher_login_button}
        ${status}=    Click Element    ${login_url}
        ${status}=    Input Text    ${username_input}    ${teacher_username}
        ${status}=    Input Text    ${password_input}    ${teacher_password}
        ${status}=    Click Element    ${login_button}
        ${status}=    Sleep    3s

    [Document]    Tear Down
        ${status}=    Close Browser

*** Test Cases ***
Student Checks My Subjects
    [Document]    ${status}=    My Subjects Checks
        ${status}=    Run Test Cases In Recording    ${student_recording_1}

Student Checks My Subjects (No DB Subject)
    [Document]    ${status}=    My Subjects Checks
        ${status}=    Run Test Cases In Recording    ${student_recording_2}

Teacher Checks My Subjects, My Exam Dates, and Evaluation Table
    [Document]    ${status}=    My Subjects Checks
        ${status}=    Run Test Cases In Recording    ${teacher_recording_1}

Teacher Checks My Exam Dates, Set Evaluation, and Evaluation Table
    [Document]    ${status}=    My Subjects Checks
        ${status}=    Run Test Cases In Recording    ${teacher_recording_2}

[Document]    ${status}=    Student Checks My Subjects
    ${status}=    Student Checks My Subjects (No DB Subject)
    ${status}=    Teacher Checks My Subjects, My Exam Dates, and Evaluation Table
    ${status}=    Teacher Checks My Exam Dates, Set Evaluation, and Evaluation Table

*** Keywords ***
Run Test Cases In Recording
    [Arguments]    ${recording}
    [Document]    ${status}=    Set Variable    ${recording}    ${recording}
    ${status}=    Set Variable    ${recording_steps}    ${recording}["steps"]
    ${status}=    Set Variable    ${recording_title}    ${recording}["title"]
    ${status}=    Set Variable    ${current_title}    ${title Get Title}
    ${status}=    Set Variable    ${current_url}    ${url Get Current URL}

    ${status}=    Set Variable    ${current_step_index}    0

    ${status}=    Set Variable    ${current_step}    ${recording_steps}[${current_step_index}]

    ${status}=    Log    Current Step: ${current_step}

    ${status}=    Set Variable    ${step_type}    ${current_step}["type"]

    ${status}=    Set Variable    ${step_target}    ${current_step}["target"]

    ${status}=    Set Variable    ${step_selectors}    ${current_step}["selectors"]

    ${status}=    Set Variable    ${step_offset_x}    ${current_step}["offsetX"]

    ${status}=    Set Variable    ${step_offset_y}    ${current_step}["offsetY"]

    ${status}=    Set Variable    ${step_asserted_events}    ${current_step}["assertedEvents"]

    ${status}=    Set Variable    ${step_assert_message}    ${current_step}["assert"]

    ${status}=    If    ${step_asserted_events}    ${status}=    Assert Events    ${step_asserted_events}

    ${status}=    If    ${step_assert_message}    ${status}=    Assert Text    ${current_title}    ${step_assert_message}

    ${status}=    If    ${step_type}=="click"    ${status}=    Click Element    ${step_target}
    ${status}=    If    ${step_type}=="setViewport"    ${status}=    Set Viewport    ${step_width}    ${step_height}    ${step_device_scale_factor}    ${step_is_mobile}    ${step_has_touch}    ${step_is_landscape}
    ${status}=    If    ${step_type}=="navigate"    ${status}=    Go To    ${step_target}
    ${status}=    If    ${step_type}=="input"    ${status}=    Input Text    ${step_target}    ${step_value}
    ${status}=    If    ${step_type}=="change"    ${status}=    Input Text    ${step_target}    ${step_value}
    ${status}=    If    ${step_type}=="keyDown"    ${status}=    Key Down    ${step_key}
    ${status}=    If    ${step_type}=="keyUp"    ${status}=    Key Up    ${step_key}
    ${status}=    If    ${step_type}=="wait"    ${status}=    Sleep    ${step_wait}s

    ${status}=    Set Variable    ${current_step_index}    ${current_step_index} + 1

    ${status}=    Sleep    1s

    ${status}=    Run Keywords    Run Test Cases In Recording

[Document]    Set Variable
    [Arguments]    ${name}
    [Arguments]    ${value}
    [Document]    ${status}=    Set Variable    ${name}    ${value}

[Document]    Log
    [Arguments]    ${message}
    [Document]    ${status}=    Log    ${message}

[Document]    Set Viewport
    [Arguments]    ${width}
    [Arguments]    ${height}
    [Arguments]    ${device_scale_factor}
    [Arguments]    ${is_mobile}
    [Arguments]    ${has_touch}
    [Arguments]    ${is_landscape}
    [Document]    ${status}=    Set Browser Implicit Wait    10s
    ${status}=    Set Browser Window Size    ${width}    ${height}
    ${status}=    Set Browser Viewport Size    ${width}    ${height}
    ${status}=    Set Browser Device Scale Factor    ${device_scale_factor}
    ${status}=    Set Browser Viewport Size    ${width}    ${height}
    ${status}=    Set Browser Viewport Device Scale Factor    ${device_scale_factor}
    ${status}=}    Set Variable    ${width}    ${width}

    ${status}=}    Set Variable    ${width}   