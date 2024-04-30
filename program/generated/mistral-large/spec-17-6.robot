*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${USERNAME_TEACHER}    pedant
${PASSWORD_TEACHER}    pass
${USERNAME_STUDENT}    yellow
${PASSWORD_STUDENT}    pass

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Login As Teacher
    Click Element    xpath://a[contains(text(),'Others\' Subjects')]
    Click Element    xpath://button[contains(text(),'Participate')]
    Page Should Contain    Others' Subjects
    Element Should Be Visible    xpath://*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath://a[contains(text(),'My Exam Dates')]
    Page Should Contain    Linear Algebra
    Element Should Be Visible    xpath://tr[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain    No exam dates.
    Click Element    xpath://a[contains(text(),'New Exam Dates')]
    Element Should Contain    xpath://option    Linear Algebra
    Click Element    xpath://a[contains(text(),'List of All Teachers')]
    Element Should Contain    xpath://td[@id="tea.listOfAllTeachers.table.teacherRow-3"]/..    Linear Algebra
    Element Should Contain    xpath://td[@id="tea.listOfAllTeachers.table.teacherRow-3"]/preceding-sibling::td    Alice Pedant
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Login As Student
    Click Element    xpath://a[contains(text(),'Other Subjects')]
    Element Should Contain    xpath://td[@id="stu.otherSubjects.table.subjectRow-2"]/following-sibling::td    Linear Algebra
    Element Should Contain    xpath://td[@id="stu.otherSubjects.table.subjectRow-2"]/following-sibling::td/following-sibling::td    Alice Pedant
    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    id=loginPage.userNameInput    ${USERNAME_TEACHER}
    Input Text    id=loginPage.passwordInput    ${PASSWORD_TEACHER}
    Click Element    id=loginPage.loginFormSubmit

Login As Student
    Input Text    id=loginPage.userNameInput    ${USERNAME_STUDENT}
    Input Text    id=loginPage.passwordInput    ${PASSWORD_STUDENT}
    Click Element    id=loginPage.loginFormSubmit