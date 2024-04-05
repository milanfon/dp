
*** Settings ***
Library            SeleniumLibrary

*** Test Cases ***
Spec 4 Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    # rest of the code for spec 4 student
    # ...
    # ...
    # check for the elements
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath://td[contains(text(), "Database Systems")]
    Close Browser

Spec 4 Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    # rest of the code for spec 4 teacher
    # ...
    # ...
    # check for the elements
    Page Should Contain    Students (0)    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Page Should Contain    Participants (0/10)    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Page Should Contain Element    xpath://td[contains(text(), "No students on this exam date")]
    Close Browser