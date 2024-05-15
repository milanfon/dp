*** Settings ***
Library           SeleniumLibrary
Suite Setup       Run Keywords    Open Browser    about:blank    browser=Chrome
...               AND    Set Selenium Implicit Wait    5 seconds
Suite Teardown    Close All Browsers

*** Variables ***
${BASE_URL}    http://localhost:4680/tbuis
${TEACHER_USERNAME}    pedant
${TEACHER_PASSWORD}    pass
${STUDENT_USERNAME}    yellow
${STUDENT_PASSWORD}    pass

*** Test Cases ***
Teacher Workflow Validation
    [Setup]    Teacher Login And Navigate
    Participate And Validate Success
    Validate My Exam Dates Contains Linear Algebra
    Validate New Exam Dates Contains Linear Algebra Option
    Validate List Of All Teachers
    [Teardown]    Close Browser

Student Workflow Validation
    [Setup]    Student Login And Navigate
    Validate Student Other Subjects
    [Teardown]    Close Browser

*** Keywords ***
Open And Login
    [Arguments]    ${username}    ${password}
    Go To    ${BASE_URL}/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]

Teacher Login And Navigate
    Open And Login    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Wait Until Page Contains    Others' Subjects

Participate And Validate Success
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Element Should Be Visible    id=tea.otherSubjects.successAlert

Validate My Exam Dates Contains Linear Algebra
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Page Should Contain Element    xpath=//*[contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2" and contains(text(), 'No exam dates.')]

Validate New Exam Dates Contains Linear Algebra Option
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath=//option[contains(text(), 'Linear Algebra')]

Validate List Of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3] and contains(text(), 'Linear Algebra')
    Element Text Should Match    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Student Login And Navigate
    Open And Login    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Wait Until Page Contains    Other Subjects

Validate Student Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Element Text Should Match    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Match    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant