### Solution:
### Student's View

| Action | Target | Value |
| ------ | ------ | ------ |
| Open Browser | http://localhost:4680/tbuis/index.jsp |
| Input Text | id:loginPage.userNameInput | gray |
| Input Text | id:loginPage.passwordInput | pass |
| Click Element | id:loginPage.loginButton |
| Wait Until Element Is Visible | id:stu.menu.mySubjects |
| Click Element | id:stu.menu.mySubjects |
| Wait Until Element Is Visible | id:stu.mySubjects.enrolledTable.Title |
| Element Should Not Be Visible | xpath://td[contains(text(), 'Database Systems')] |
| Element Should Be Visible | id:stu.mySubjects.successAlert |
| Element Should Be Visible | id:stu.mySubjects.enrolledTable.Title |
| Close Browser |


### Teacher's View

| Action | Target | Value |
| ------ | ------ | ------ |
| Open Browser | http://localhost:4680/tbuis/index.jsp |
| Input Text | id:loginPage.userNameInput | pedant |
| Input Text | id:loginPage.passwordInput | pass |
| Click Element | id:loginPage.loginButton |
| Wait Until Element Is Visible | id:tea.menu.mySubjects |
| Click Element | id:tea.menu.mySubjects |
| Wait Until Element Is Visible | id:tea.mySubjects.table.listOfStudentsButton-1 |
| Element Should Contain | id:tea.mySubjects.table.listOfStudentsButton-1 | Students (0) |
| Click Element | id:tea.menu.myExamDates |
| Wait Until Element Is Visible | id:tea.myExamDates.table.participantsButton-1-0 |
| Element Should Contain | id:tea.myExamDates.table.participantsButton-1-0 | Participants (0/10) |
| Click Element | id:tea.menu.setEvaluation |
| Click Element | id:tea.setEvaluation.form.examTermDateSelect |
| Input Text | id:tea.setEvaluation.form.examTermDateSelect | 33 |
| Click Element | id:tea.setEvaluation.form.examTermDateSelect |
| Click Element | id:tea.menu.evaluationTable |
| Click Element | id:tea.evalTable.filter.subjectSelect |
| Select From List By Value | id:tea.evalTable.filter.subjectSelect | 3 |
| Click Element | id:tea.evalTable.filter.submitButton |
| Wait Until Element Is Visible | id:tea.evalTable.noStudents |
| Element Should Be Visible | id:tea.evalTable.noStudents |
| Element Should Be Visible | id:tea.evalTable.noStudents |
| Element Should Contain | id:tea.evalTable.noStudents | No students on this exam date |
| Close Browser | 