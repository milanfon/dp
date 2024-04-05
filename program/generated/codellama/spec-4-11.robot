*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 4 Student
    [Setup]    Set Selenium Timeout    5 seconds
    [Setup]    Set Selenium Speed    0 seconds
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Viewport Size    1501    1104
    Click Element    id:header.link.login
    Click Element    id:loginPage.userNameInput
    Input Text    id:loginPage.userNameInput    gray
    Press Keys    id:loginPage.userNameInput    TAB
    Input Text    id:loginPage.passwordInput    pass
    Press Keys    id:loginPage.passwordInput    ENTER
    Click Element    id:stu.menu.mySubjects
    Click Element    id:stu.mySubjects.enrolledTable.unenrollSubjectButton-1
    Click Element    id:stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    Element Should Be Visible    id:stu.mySubjects.successAlert
    Element Should Be Visible    id:stu.mySubjects.enrolledTable.Title
    Page Should Not Contain Element    xpath://td[text()='Database Systems']
    Close Browser

Spec 4 Teacher
    [Setup]    Set Selenium Timeout    5 seconds
    [Setup]    Set Selenium Speed    0 seconds
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Viewport Size    1501    1104
    Click Element    id:header.link.login
    Click Element    id:loginPage.userNameInput
    Input Text    id:loginPage.userNameInput    pedant
    Press Keys    id:loginPage.userNameInput    TAB
    Input Text    id:loginPage.passwordInput    pass
    Press Keys    id:loginPage.passwordInput    ENTER
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.setEvaluation.form.examTermDateSelect
    Select From List By Index    id:tea.setEvaluation.form.examTermDateSelect    2
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Select From List By Index    id:tea.evalTable.filter.subjectSelect    2
    Click Element    id:tea.evalTable.filter.submitButton
    Element Should Be Visible    id:tea.mySubjects.table.listOfStudentsButton-1
    Element Should Be Visible    id:tea.myExamDates.table.participantsButton-1-0
    Element Should Be Visible    id:tea.setEvaluation.form.noOneStudent
    Element Should Be Visible    xpath://td[text()='No students on this exam date']
    Close Browser