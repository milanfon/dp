## Solution

### Student scenario


| Step | Action | Argument |
| - | - | - |
| 1 | Open Browser | http://localhost:4680/tbuis/index.jsp |
| 2 | Input Text | id:loginPage.userNameInput | maroon |
| 3 | Input Text | id:loginPage.passwordInput | pass |
| 4 | Click Element | id:loginPage.loginFormSubmit |
| 5 | Click Element | id:stu.menu.otherSubjects |
| 6 | Click Element | id:stu.otherSubjects.table.enrollButton-10 |
| 7 | Click Element | id:stu.menu.mySubjects |
| 8 | Wait Until Element Is Visible | id:stu.otherSubjects.successAlert | 10s |
| 9 | Wait Until Element Is Visible | xpath=//tr[@id='stu.mySubjects.enrolledTable.subjectRow-2'] | 10s |
| 10 | Element Text Should Be | xpath=//tr[@id='stu.mySubjects.enrolledTable.subjectRow-2']/td[1] | Software Quality Assurance |
| 11 | Element Text Should Be | xpath=//tr[@id='stu.mySubjects.enrolledTable.subjectRow-2']/td[2] | Peter Strict |
| 12 | Close Browser |



### Teacher scenario

| Step | Action | Argument |
| - | - | - |
| 1 | Open Browser | http://localhost:4680/tbuis/index.jsp |
| 2 | Input Text | id:loginPage.userNameInput | strict |
| 3 | Input Text | id:loginPage.passwordInput | pass |
| 4 | Click Element | id:loginPage.loginFormSubmit |
| 5 | Click Element | id:tea.menu.mySubjects |
| 6 | Click Element | id:tea.mySubjects.table.listOfStudentsButton-3 |
| 7 | Wait Until Element Is Visible | id:tea.mySubjects.table.listOfStudents-3 | 10s |
| 8 | Element Text Should Be | id:tea.mySubjects.table.listOfStudents-3 | Students (2) |
| 9 | Click Element | id:tea.mySubjects.table.listOfStudents-3 |
| 10 | Wait Until Element Is Visible | xpath=//a[.//td[.='William Maroon'] | 10s |
| 11 | Element Text Should Be | xpath=//a[.//td[.='William Maroon'] | William Maroon |
| 12 | Close Browser | 