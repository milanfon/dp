*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DELAY}    1s
${BROWSER}    Chrome
${URL}    http://localhost:4680
${BROWSER}    Chrome
${LOGIN_URL}    http://localhost:4680/tbuis/login
${USERNAME}    pedant
${PASSWORD}    pass

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    ${USERNAME}
    Input Text    id:loginPage.passwordInput    ${PASSWORD}
    Click Element    id:loginPage.loginFormSubmit
    Sleep    ${DELAY}
    Click Element    id:tea.menu.otherSubjects
    Sleep    ${DELAY}
    Click Element    id:tea.otherSubjects.table.participateButton-3
    Sleep    ${DELAY}
    ${is_on_other_subjects}    Get Text    id:tea.otherSubjects.successAlert
    ${is_on_other_subjects}    Get Text    id:tea.otherSubjects.successAlert
    Sleep    ${DELAY}
    ${is_on_my_exam_dates}    Get Text    id:tea.myExamDates.table.noRecords-2
    ${is_on_my_exam_dates}    Get Text    id:tea.myExamDates.table.noRecords-2
    Sleep    ${DELAY}
    ${is_on_new_exam_dates}    Get Text    id:tea.newExamDates.table.noRecords-2
    ${is_on_new_exam_dates}    Get Text    id:tea.newExamDates.table.noRecords-2
    Sleep    ${DELAY}
    ${is_on_list_of_teachers}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    ${is_on_list_of_teachers}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    ${teacher_name}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]
    Should Contain    ${teacher_name}    Alice
    Close Browser

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    yellow
    Input Text    id:loginPage.passwordInput    ${PASSWORD}
    Click Element    id:loginPage.loginFormSubmit
    Sleep    ${DELAY}
    Click Element    id:stu.menu.otherSubjects
    Sleep    ${DELAY}
    ${is_on_other_subjects}    Get Text    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    ${is_on_other_subjects}    Get Text    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    browser=${browser}
    Maximize Browser Window