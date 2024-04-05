*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Spec 4 Student
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    # Student steps here
    # ...
    # ...
    # Check if element with id "stu.mySubjects.successAlert" is present
    Page Should Contain Element    id=stu.mySubjects.successAlert
    # Check if element with id "stu.mySubjects.enrolledTable.Title" is present
    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    # Check if element of type <td> with text "Database Systems" is not present
    Page Should Not Contain Element    xpath=//td[text()='Database Systems']
    [Teardown]    Close Browser

Spec 4 Teacher
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    # Teacher steps here
    # ...
    # ...
    # On page "My Subjects" element with id "tea.mySubjects.table.listOfStudentsButton-1" has text of "Students (0) "
    Page Should Contain    Students (0)    id=tea.mySubjects.table.listOfStudentsButton-1
    # On page "My Exam Dates" element with id "tea.myExamDates.table.participantsButton-1-0" has text of "Participants (0/10) "
    Page Should Contain    Participants (0/10)    id=tea.myExamDates.table.participantsButton-1-0
    # On page "Set Evaluation" after selecting the subject, element with id "tea.setEvaluation.form.noOneStudent" is displayed.
    # ...
    # On page "Evaluation Table" after selecting the subject and clicking the filter button, there should be element of type <td> with text "No students on this exam date" present.
    Page Should Contain    No students on this exam date    xpath=//td[text()='No students on this exam date']
    [Teardown]    Close Browser