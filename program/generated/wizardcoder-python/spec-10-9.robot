## Robot Framework Scenario

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}     0
${LOGIN_URL}    http://localhost:4680/tbuis/login
${URL}    http://localhost:4680/tbuis/
${USER_NAME}    strict
${PASSWORD}    pass
${TEACHER_URL}    http://localhost:4680/tbuis/teacher-view/overview
${TEACHER_SUBJECT_URL}    http://localhost:4680/tbuis/teacher-view/mySubjects
${TEACHER_EXAM_URL}    http://localhost:4680/tbuis/teacher-view/myExamDates
${TEACHER_EXAM_DATE_URL}    http://localhost:4680/tbuis/teacher-view/newExamDates
${TEACHER_EVAL_URL}    http://localhost:4680/tbuis/teacher-view/setEvaluation
${TEACHER_EVAL_TABLE_URL}    http://localhost:4680/tbuis/teacher-view/evaluationTable
${TEACHER_OTHER_SUBJECT_URL}    http://localhost:4680/tbuis/teacher-view/otherSubjects
${TEACHER_TEACHER_URL}    http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
${STUDENT_URL}    http://localhost:4680/tbuis/student-view/overview
${STUDENT_OTHER_SUBJECT_URL}    http://localhost:4680/tbuis/student-view/otherSubjects

*** Keywords ***
Open Browser
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Set Window Size    ${BROWSER_WIDTH}    ${BROWSER_HEIGHT}

Login as Teacher
    Open Browser    ${LOGIN_URL}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USER_NAME}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

Login as Student
    Open Browser    ${LOGIN_URL}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

Verify Teacher Steps
    Click Link    xpath://*[@id="tea.mySubjects"]
    Click Button    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Click Link    xpath://*[@id="tea.menu.otherSubjects"]
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    ${is_present}=    Run Keyword And Return Status    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//*[contains(text(), 'Operating Systems')]
    Should Be True    ${is_present} is False

Verify Student Steps
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    ${is_present}=    Run Keyword And Return Status    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table"]//*[contains(text(), 'Operating Systems')]
    Should Be True    ${is_present} is False

*** Test Cases ***
Teacher Scenario
    Open Browser    ${TEACHER_URL}
    Login as Teacher
    Verify Teacher Steps
    [Teardown]    Close Browser

Student Scenario
    Open Browser    ${STUDENT_URL}
    Login as Student
    Verify Student Steps
    [Teardown]    Close Browser

*** Tasks ***
Teacher Scenario
    [Tags]    Teacher
    Open Browser    ${TEACHER_URL}
    Login as Teacher
    Verify Teacher Steps
    [Teardown]    Close Browser

Student Scenario
    [Tags]    Student
    Open Browser    ${STUDENT_URL}
    Login as Student
    Verify Student Steps
    [Teardown]    Close Browser 