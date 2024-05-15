*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
@{URL}        http://localhost:4680/tbuis/index.jsp

*** Test Case: Test Student Scenario ***
[Documentation] Test Student Scenario using the recorded JSON

*** Teardown ***
Close Browser

*** Test Case: Test Student Scenario ***
[Documentation] Test Student Scenario using the recorded JSON

[Before All]
Set Viewport 1501 1104

[Documentation] Login as Student
[Step] navigate to ${URL}
[Step] ${element="element"} Set Element Name main
[Step] Click Button Login
[Step] Input Text username set ${username} maroon
[Step] Input Text password set ${password} pass
[Step] Click Button Login
[Step] ${element="element"} Set Element Name main

[Documentation] Check Other Subjects Page
[Step] Click Button Other Subjects
[Step] ${element="element"} Set Element Name main
[Step] Click Button Enroll
[Step] ${element="element"} Set Name stu.otherSubjects.successAlert
[Step] Wait Until Page Contains stu.otherSubjects.successAlert

[Documentation] Check My Subjects Page
[Step] Click Button My Subjects
[Step] ${element="element"} Set Name stu.mySubjects.enrolledTable
[Step] Wait Until Page Contains stu.mySubjects.enrolledTable
[Step] ${element="row"} Set Element Name ${element} tr id="stu.mySubjects.enrolledTable.subjectRow-2"
[Step] ${element="cell1"} Set Element Name ${element} td:nth-child(1)
[Step] ${element="cell2"} Set Element Name ${element} td:nth-child(2)
[Step] Wait Until Element Is Visible ${element}
[Step] Should Contain cell1 Software Quality Assurance
[Step] Should Contain cell2 Peter Strict

[Documentation] Login as Teacher
[Step] ${element="element"} Set Element Name main
[Step] Click Button Login
[Step] Input Text username set ${username} strict
[Step] Input Text password set ${password} pass
[Step] Click Button Login
[Step] ${element="element"} Set Element Name main

[Documentation] Check My Subjects Page (Teacher)
[Step] Click Button My Subjects
[Step] ${element="element"} Set Name tea.mySubjects.table
[Step] ${element="button"} Set Element Name ${element} button[role="button"]:contains(Students)
[Step] Click Button button
[Step] ${element="table"} Set Element Name ${element} table:nth-child(2)
[Step] ${element="tr"} Set Element Name ${element} tr:nth-child(3)
[Step] ${element="td"} Set Element Name ${element} td:nth-child(2)
[Step] Wait Until Element Is Visible td
[Step] Should Contain td Students (2)

[Documentation] Wait for Element
[Step] Wait Until Element Is Visible ${element}
[Step] Should Contain td William Maroon