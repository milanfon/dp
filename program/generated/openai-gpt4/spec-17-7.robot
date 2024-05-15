*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    about:blank    Chrome
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${TEACHER_OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${OTHER_SUBJECTS_URL}    http://localhost:4680/tbuis/teacher-view/otherSubjects
${MY_EXAM_DATES_URL}    http://localhost:4680/tbuis/teacher-view/myExamDates
${NEW_EXAM_DATES_URL}    http://localhost:4680/tbuis/teacher-view/newExamDates
${LIST_OF_ALL_TEACHERS_URL}    http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${STUDENT_OTHER_SUBJECTS_URL}    http://localhost:4680/tbuis/student-view/otherSubjects
${USERNAME_TEACHER}    pedant
${PASSWORD_TEACHER}    pass
${USERNAME_STUDENT}    yellow
${PASSWORD_STUDENT}    pass

*** Test Cases ***
Teacher Scenario
    [Setup]    Open And Login As Teacher
    Participate In Others' Subjects
    Validate Success Alert In Others' Subjects Page
    Validate My Exam Dates Page Contains Linear Algebra
    Validate New Exam Dates Page Contains Linear Algebra Option
    Validate List Of All Teachers Page
    [Teardown]    Close Browser

Student Scenario
    [Setup]    Open And Login As Student
    Validate Student's Other Subjects Page
    [Teardown]    Close Browser

*** Keywords ***
Open And Login As Teacher
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME_TEACHER}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD_TEACHER}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

Open And Login As Student
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME_STUDENT}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD_STUDENT}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

Participate In Others' Subjects
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    1s

Validate Success Alert In Others' Subjects Page
    Location Should Be    ${OTHER_SUBJECTS_URL}
    Element Should Be Visible    id=tea.otherSubjects.successAlert

Validate My Exam Dates Page Contains Linear Algebra
    Go To    ${MY_EXAM_DATES_URL}
    Page Should Contain    Linear Algebra
    Element Should Contain    id=tea.myExamDates.table.noRecords-2    No exam dates.

Validate New Exam Dates Page Contains Linear Algebra Option
    Go To    ${NEW_EXAM_DATES_URL}
    Element Should Contain    tag=option    Linear Algebra

Validate List Of All Teachers Page
    Go To    ${LIST_OF_ALL_TEACHERS_URL}
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Text Should Match    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Validate Student's Other Subjects Page
    Go To    ${STUDENT_OTHER_SUBJECTS_URL}
    Element Text Should Match    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Match    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant