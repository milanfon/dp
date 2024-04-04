*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario 1: Spec 6 Student
    [Setup]    Open Browser    ${URL}    Chrome
    # Student steps
    # ...
    # Check for element with id "stu.otherSubjects.successAlert"
    Element Should Be Visible    id:stu.otherSubjects.successAlert
    # Check for element with id "stu.mySubjects.enrolledTable.subjectRow-2"
    Element Should Be Visible    id:stu.mySubjects.enrolledTable.subjectRow-2
    # Check for child elements
    Element Should Contain    id:stu.mySubjects.enrolledTable.subjectRow-2    Software Quality Assurance
    Element Should Contain    id:stu.mySubjects.enrolledTable.subjectRow-2    Peter Strict
    [Teardown]    Close Browser

Scenario 2: Spec 6 Teacher
    [Setup]    Open Browser    ${URL}    Chrome
    # Teacher steps
    # ...
    # Check for button with id "tea.mySubjects.table.listOfStudentsButton-3"
    Element Should Be Visible    id:tea.mySubjects.table.listOfStudentsButton-3
    # Check for "Students (2) " text
    Element Should Contain    id:tea.mySubjects.table.listOfStudentsButton-3    Students (2) 
    # Click the button
    Click Element    id:tea.mySubjects.table.listOfStudentsButton-3
    # Check for <td> with text "William Maroon"
    Element Should Contain    xpath:.//td    William Maroon
    [Teardown]    Close Browser