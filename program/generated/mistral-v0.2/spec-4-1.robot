*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Test Case ***
Test My Subjects and My Exam Dates Checks

    *** Settings ***
    Delay         1s

    *** Variables ***
    @students_page  http://localhost:4680/tbuis/student-view/mySubjects
    @teacher_page1  http://localhost:4680/tbuis/teacher-view/mySubjects
    @teacher_page2  http://localhost:4680/tbuis/teacher-view/myExamDates
    @teacher_page3  http://localhost:4680/tbuis/teacher-view/setEvaluation
    @teacher_page4  http://localhost:4680/tbuis/teacher-view/evaluationTable

    *** Task ***
    Open student page
    Open Browser  @students_page

    *** Step ***
    Wait Until Page Contains  stu.mySubjects.successAlert

    *** Step ***
    Wait Until Page Contains  stu.mySubjects.enrolledTable.Title

    *** Step ***
    Wait Until Page Contains  Database Systems  Regexp  //td[contains(text(), 'Database Systems')]
    [Document]  Not Found

    *** Step ***
    Close Browser

    *** Task ***
    Open teacher page 1
    Open Browser  @teacher_page1

    *** Step ***
    Wait Until Page Contains  tea.mySubjects.table.listOfStudentsButton-1
    Wait Until Element Is Visible  //button[contains(text(), 'Students (0) ')]

    *** Step ***
    Wait Until Page Contains  tea.myExamDates.table.participantsButton-1-0
    Wait Until Element Is Visible  //button[contains(text(), 'Participants (0/10) ')]

    *** Step ***
    Open teacher page 2
    Open Browser  @teacher_page2

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Set Evaluation')]
    Click Element  //button[contains(text(), 'Set Evaluation')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'No One Student')]
    Click Element  //button[contains(text(), 'No One Student')]

    *** Step ***
    Open teacher page 3
    Open Browser  @teacher_page3

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Evaluation Table')]
    Click Element  //button[contains(text(), 'Evaluation Table')]

    *** Step ***
    Wait Until Page Contains  tea.setEvaluation.form.noOneStudent

    *** Step ***
    Wait Until Page Contains  tea.setEvaluation.form.noOneStudent.label

    *** Step ***
    Wait Until Page Contains  tea.evaluationTable.noStudentsOnExamDate

    *** Step ***
    Wait Until Element Is Visible  //td[contains(text(), 'No students on this exam date')]

    *** Step ***
    Close Browser

    *** Task ***
    Open teacher page 1
    Open Browser  @teacher_page1

    *** Step ***
    Login  username  pierce  password  pass

    *** Step ***
    Open teacher page 2
    Go To  @teacher_page2

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Set Evaluation')]
    Click Element  //button[contains(text(), 'Set Evaluation')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Subject and date of exam:')]
    Click Element  //button[contains(text(), 'Subject and date of exam:')]

    *** Step ***
    Wait Until Element Is Visible  //option[contains(text(), '33')]
    Click Element  //option[contains(text(), '33')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Evaluation Table')]
    Click Element  //button[contains(text(), 'Evaluation Table')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Subject')]
    Click Element  //button[contains(text(), 'Subject')]

    *** Step ***
    Wait Until Element Is Visible  //option[contains(text(), '3')]
    Click Element  //option[contains(text(), '3')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Filter')]
    Click Element  //button[contains(text(), 'Filter')]

    *** Step ***
    Wait Until Page Contains  tea.evaluationTable.noStudentsOnExamDate

    *** Step ***
    Close Browser

    *** Task ***
    Open teacher page 1
    Open Browser  @teacher_page1

    *** Step ***
    Login  username  pierce  password  pass

    *** Step ***
    Open teacher page 2
    Go To  @teacher_page2

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Set Evaluation')]
    Click Element  //button[contains(text(), 'Set Evaluation')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Subject and date of exam:')]
    Click Element  //button[contains(text(), 'Subject and date of exam:')]

    *** Step ***
    Wait Until Element Is Visible  //option[contains(text(), '33')]
    Click Element  //option[contains(text(), '35')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Evaluation Table')]
    Click Element  //button[contains(text(), 'Evaluation Table')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Subject')]
    Click Element  //button[contains(text(), 'Subject')]

    *** Step ***
    Wait Until Element Is Visible  //option[contains(text(), '3')]
    Click Element  //option[contains(text(), '3')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Filter')]
    Click Element  //button[contains(text(), 'Filter')]

    *** Step ***
    Wait Until Page Contains  tea.evaluationTable.noStudentsOnExamDate

    *** Step ***
    Close Browser

    *** Task ***
    Open teacher page 1
    Open Browser  @teacher_page1

    *** Step ***
    Login  username  pierce  password  pass

    *** Step ***
    Open teacher page 2
    Go To  @teacher_page2

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Set Evaluation')]
    Click Element  //button[contains(text(), 'Set Evaluation')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Subject and date of exam:')]
    Click Element  //button[contains(text(), 'Subject and date of exam:')]

    *** Step ***
    Wait Until Element Is Visible  //option[contains(text(), '33')]
    Click Element  //option[contains(text(), '33')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Evaluation Table')]
    Click Element  //button[contains(text(), 'Evaluation Table')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Subject')]
    Click Element  //button[contains(text(), 'Subject')]

    *** Step ***
    Wait Until Element Is Visible  //option[contains(text(), '3')]
    Click Element  //option[contains(text(), '3')]

    *** Step ***
    Wait Until Element Is Visible  //button[contains(text(), 'Filter')]
    Click Element  //button[contains(text(), 'Filter')]

    *** Step ***
    Wait Until Page Contains  tea.evaluationTable.noStudentsOnExamDate

    *** Step ***
    Close Browser

*** Test Case ***
Test My Subjects and My Exam Dates Checks