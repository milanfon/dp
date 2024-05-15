*** Settings ***
Library           SeleniumLibrary
Browser           Chrome

*** Variables ***
url = http://localhost:4680/tbuis/index.jsp

*** Test Case: Teacher Scenario ***

@Setup
@Tags teacher
Set Viewport 1501 1104
Set Browser Implicit Wait 10

[Teaser] Test teacher scenario

[Documentation] Open URL, login, go to Others' Subjects, participate, check success alert and elements visibility

[Preparation]
Navigate To ${url}
Set username pedant
Set password pass

[Steps]
Click Element #header.link.login
Set Value ${USERNAME} Username Input
Set Value ${PASSWORD} Password Input
Click Element #loginPage.loginFormSubmit

[Wait]
Wait Until Element Is Visible #tea.otherSubjects.successAlert
Wait Until Element Is Visible #tea.otherSubjects.table.participateButton-3

[Steps]
Click Element #tea.otherSubjects.table.participateButton-3

[Wait]
Wait Until Element Is Visible #tea.myExamDates.table.noRecords-2
Wait Until Element Is Visible #tea.myExamDates.table
Should Element Contain #tea.myExamDates.table.noRecords-2 Text "No exam dates."
Should Contain Text #tea.myExamDates.table Contain "Linear Algebra"

[Steps]
Click Element #tea.menu.newExamDates

[Wait]
Wait Until Element Is Visible #tea.newExamDates.table.option
Should Contain Text #tea.newExamDates.table.option Contain "Linear Algebra"

[Steps]
Click Element #tea.menu.listOfAllTeachers

[Wait]
Wait Until Element Is Visible #tea.listOfAllTeachers.table
Should Contain Text #tea.listOfAllTeachers.table Contain "Linear Algebra"
Should Contain Text #tea.listOfAllTeachers.table Containing "Alice Pedant"

[Teardown]
Close Browser

*** Test Case: Student Scenario ***

@Setup
@Tags student
Set Viewport 1501 1104
Set Browser Implicit Wait 10

[Teaser] Test student scenario

[Documentation] Open URL, login, go to Others' Subjects, check elements text

[Preparation]
Navigate To ${url}
Set username yellow
Set password pass

[Steps]
Click Element #header.link.login
Set Value ${USERNAME} Username Input
Set Value ${PASSWORD} Password Input
Click Element #loginPage.loginFormSubmit

[Steps]
Click Element #stu.otherSubjects.table.subjectRow-2

[Wait]
Wait Until Element Is Visible #stu.otherSubjects.table.subjectRow-2

[Steps]
Should Contain Text #stu.otherSubjects.table.subjectRow-2.td[2] Contain "Linear Algebra"
Should Contain Text #stu.otherSubjects.table.subjectRow-2.td[3] Contain "Alice Pedant"

[Teardown]
Close Browser