*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Test Teacher
    Teacher scenario

Test Student
    Student scenario

*** Keywords ***

Teacher scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    104
    Set Selenium Speed   0.5
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    ${is_tea_success_alert_visible}=    Get Element Attribute    xpath://*[@id="tea.otherSubjects.successAlert"]@visible
    Run Keyword If    not ${is_tea_success_alert_visible}    Exit For Loop
    ${is_tea_my_exam_dates_visible}=    Get Text    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Should Be Equal    ${is_tea_my_exam_dates_visible}    No exam dates.
    ${is_tea_new_exam_dates_visible}=    Get Element Attribute    xpath://*[@id="tea.newExamDates.form.examDate.teacherSubject"]/option[text()="Linear Algebra"]@value
    Should Be True    ${is_tea_new_exam_dates_visible}
    ${is_tea_teacher_list_visible}=    Get Element Attribute    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]@innerText
    Should Contain    ${is_tea_teacher_list_visible}    Linear Algebra
    ${is_tea_teacher_list_visible}=    Get Element Attribute    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]@innerText
    Should Contain    ${is_tea_teacher_list_visible}    Alice Pedant
    Close Browser

Student scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    104
    Set Selenium Speed   0.5
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    ${is_stu_other_subjects_visible}=    Get Element Attribute    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]@innerText
    Should Contain    ${is_stu_other_subjects_visible}    Linear Algebra
    ${is_stu_other_subjects_visible}=    Get Element Attribute    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]@innerText
    Should Contain    ${is_stu_other_subjects_visible}    Alice Pedant
    Close Browser