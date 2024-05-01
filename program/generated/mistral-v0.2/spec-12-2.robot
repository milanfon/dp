*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Variables ***
${URL}             http://localhost:4680/tbuis/index.jsp

*** Test Case: Teacher Scenario ***

*** Setup ***
Open Browser            ${URL}

*** Teacher Scenario ***
Click Element            id=tea.menu.myExamDates
Click Element            id=tea.myExamDates.table.cancelButton-0-0
Sleep                   2s
Accept Alert
Click Element            id=tea.menu.setEvaluation
Click Element            id=tea.menu.evaluationTable
Select From List         id=tea.evalTable.filter.subjectSelect        index=0
Click Element            id=tea.evalTable.filter.submitButton
Sleep                   2s

*** Test Case: Teacher Assertions ***
[Document] Should Contain    text=My Exam Dates
[Document] Should Contain    id=tea.myExamDates.successAlert
[Document] Should Be Visible id=tea.myExamDates.successAlert
[Document] Should Contain    text=tea.setEvaluation.form.noRecords

*** Teardown ***
Close Browser

*** Test Case: Student Scenario ***

*** Setup ***
Open Browser            ${URL}

*** Student Scenario ***
Click Element            id=header.link.login
Click Element            id=loginPage.userNameInput
Input Text            id=loginPage.userNameInput        orange
Click Element            id=loginPage.passwordInput
Input Text            id=loginPage.passwordInput        pass
Click Element            id=loginPage.loginFormSubmit
Sleep                   2s
Click Element            id=stu.menu.myExamDates

*** Student Assertions ***
[Document] Should Not Contain text=Computation Structures

*** Teardown ***
Close Browser