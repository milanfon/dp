 ```scss
*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Case ***
My Subjects Checks
    [Document]        ${json}

    ${json}=    json    ${recording_json}

    ${recording_json}=    ${json}    title=recording_json
    ${steps_json}=    ${json}    .steps

    ${scenario_json}=    ${json}    .title=Scenario_My_Subjects_Checks

    ${scenario_steps}=    ${scenario_json}    .steps

    ${login_steps}=    []
    ${login_steps}=    ${scenario_steps}    && index=0

    ${login}=    ${login_steps}    .steps

    ${login_url}=    ${login}    .assertedEvents[0].url

    ${login_title}=    ${login}    .assertedEvents[0].title

    ${login_steps}=    ${login_steps}    && index=1

    ${username_step}=    ${login_steps}

    ${username}=    ${username_step}    .selectors[0]

    ${username_xpath}=    ${username}    .xpath

    ${username_offset_x}=    ${username_step}    .offsetX
    ${username_offset_y}=    ${username_step}    .offsetY

    ${password_step}=    ${login_steps}    && index=2

    ${password}=    ${password_step}    .selectors[0]

    ${password_xpath}=    ${password}    .xpath

    ${password_offset_x}=    ${password_step}    .offsetX
    ${password_offset_y}=    ${password_step}    .offsetY

    ${login_step}=    ${login_steps}    && index=3

    ${login_button}=    ${login_step}    .selectors[0]

    ${login_button_xpath}=    ${login_button}    .xpath

    ${login_button_offset_x}=    ${login_button_step}    .offsetX
    ${login_button_offset_y}=    ${login_button_step}    .offsetY

    ${login}=    ${Login}    ${username_xpath}    ${username_offset_x}    ${username_offset_y}
    ${login}=    ${login}    ${password_xpath}    ${password_offset_x}    ${password_offset_y}
    ${login}=    ${login}    ${login_button_xpath}    ${login_button_offset_x}    ${login_button_offset_y}

    ${wait}=    ${Wait}    5s

    ${check_for_element_my_subjects}=    ${Check Element}    id=stu.mySubjects.successAlert

    ${check_for_element_my_subjects_enrolled_table}=    ${Check Element}    id=stu.mySubjects.enrolledTable.Title

    ${check_for_element_td_database_systems_not_present}=    ${Check Element}    xpath=//td[.='Database Systems']

    ${check_for_element_td_database_systems_not_present}=    ${check_for_element_td_database_systems_not_present}    not present

    ${teacher_login_steps}=    ${scenario_steps}    && index=1

    ${teacher_login}=    ${teacher_login_steps}    .steps

    ${teacher_login_url}=    ${teacher_login}    .assertedEvents[0].url

    ${teacher_login_title}=    ${teacher_login}    .assertedEvents[0].title

    ${teacher_login_steps}=    ${teacher_login_steps}    && index=1

    ${teacher_username_step}=    ${teacher_login_steps}

    ${teacher_username}=    ${teacher_username_step}    .selectors[0]

    ${teacher_username_xpath}=    ${teacher_username}    .xpath

    ${teacher_username_offset_x}=    ${teacher_username_step}    .offsetX
    ${teacher_username_offset_y}=    ${teacher_username_step}    .offsetY

    ${teacher_password_step}=    ${teacher_login_steps}    && index=2

    ${teacher_password}=    ${teacher_password_step}    .selectors[0]

    ${teacher_password_xpath}=    ${teacher_password}    .xpath

    ${teacher_password_offset_x}=    ${teacher_password_step}    .offsetX
    ${teacher_password_offset_y}=    ${teacher_password_step}    .offsetY

    ${teacher_login_button_step}=    ${teacher_login_steps}    && index=3

    ${teacher_login_button}=    ${teacher_login_button_step}    .selectors[0]

    ${teacher_login_button_xpath}=    ${teacher_login_button}    .xpath

    ${teacher_login_button_offset_x}=    ${teacher_login_button_step}    .offsetX
    ${teacher_login_button_offset_y}=    ${teacher_login_button_step}    .offsetY

    ${teacher_login}=    ${Login}    ${teacher_username_xpath}    ${teacher_username_offset_x}    ${teacher_username_offset_y}
    ${teacher_login}=    ${teacher_login}    ${teacher_password_xpath}    ${teacher_password_offset_x}    ${teacher_password_offset_y}
    ${teacher_login}=    ${teacher_login}    ${teacher_login_button_xpath}    ${teacher_login_button_offset_x}    ${teacher_login_button_offset_y}

    ${wait}

    ${check_for_element_teacher_my_subjects_list_of_students_button}=    ${Check Element}    id=tea.mySubjects.table.listOfStudentsButton-1

    ${check_for_element_teacher_my_exam_dates_participants_button}=    ${Check Element}    id=tea.myExamDates.table.participantsButton-1-0

    ${check_for_element_teacher_set_evaluation_no_one_student}=    ${Check Element}    id=tea.setEvaluation.form.noOneStudent

    ${check_for_element_teacher_evaluation_table_no_students_on_exam_date}=    ${Check Element}    xpath=//td[.='No students on this exam date']

    ${teacher_login}

    ${check_for_element_teacher_my_subjects_list_of_students_button_text}=    ${Get Text}    ${check_for_element_teacher_my_subjects_list_of_students_button}

    ${check_for_element_teacher_my_exam_dates_participants_button_text}=    ${Get Text}    ${check_for_element_teacher_my_exam_dates_participants_button}

    ${check_for_element_teacher_set_evaluation_no_one_student_displayed}=    ${Check Element}    id=tea.setEvaluation.form.noOneStudent    not present

    ${check_for_element_teacher_evaluation_table_no_students_on_exam_date}=    ${check_for_element_teacher_evaluation_table_no_students_on_exam_date}    present

    ${teacher_login}

    ${check_for_element_teacher_my_exam_dates_participants_button_text}    should equal    'Participants (0/10) '
    ${check_for_element_teacher_my_subjects_list_of_students_button_text}    should equal    'Students (0) '

    ${teacher_login}

    ${check_for_element_teacher_set_evaluation_no_one_student_displayed}

    ${teacher_login}

    ${check_for_element_teacher_evaluation_table_no_students_on_exam_date}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

    ${teacher_login}

*** Settings***

*** Settings***

    ${json}=    json    ${json}

    ${recording_json}=    json    ${json}

    ${