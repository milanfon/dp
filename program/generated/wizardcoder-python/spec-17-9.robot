*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close Browser


*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${USER_NAME}    pedant
${PASSWORD}    pass
${BROWSER}    Chrome
${DELAY}    0.5s
${URL}    http://localhost:4680/tbuis/login



*** Test Cases ***
Scenario Teacher
    Teacher Test

Scenario Student
    Student Test


*** Keywords ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Sleep    ${DELAY}
    Input Text    id:loginPage.userNameInput    ${USER_NAME}
    Sleep    ${DELAY}
    Input Text    id:loginPage.passwordInput    ${PASSWORD}
    Sleep    ${DELAY}
    Click Element    id:loginPage.loginFormSubmit
    Sleep    ${DELAY}
    Click Element    id:tea.menu.otherSubjects
    Sleep    ${DELAY}
    Click Element    id:tea.otherSubjects.table.participateButton-3
    Sleep    ${DELAY}
    Click Element    id:tea.menu.myExamDates
    Sleep    ${DELAY}
    Click Element    id:tea.menu.newExamDates
    Sleep    ${DELAY}
    Click Element    id:tea.menu.listOfAllTeachers
    Sleep    ${DELAY}
    Element Should Be Visible    id:tea.otherSubjects.successAlert
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.table.noRecords-2"]    id:tea.myExamDates.table.noRecords-2
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.table.noRecords-2"]    id:tea.myExamDates.table.noRecords-2
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]    id:tea.myExamDates.table.noRecords-2
    Page Should Contain    Linear Algebra    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain    No exam dates.    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]
    Page Should Contain    Linear Algebra    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Page Should Contain    Alice Pedant    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]


Student Test
    Open Browser    ${URL}    ${BROWSER}
    Sleep    ${DELAY}
    Input Text    id:loginPage.userNameInput    yellow
    Sleep    ${DELAY}
    Input Text    id:loginPage.passwordInput    ${PASSWORD}
    Sleep    ${DELAY}
    Click Element    id:loginPage.loginFormSubmit
    Sleep    ${DELAY}
    Click Element    id:stu.menu.otherSubjects
    Sleep    ${DELAY}
    Element Text Should Be    id:stu.otherSubjects.table.subjectRow-2    Linear Algebra    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    Element Text Should Be    id:stu.otherSubjects.table.subjectRow-2    Alice Pedant    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]