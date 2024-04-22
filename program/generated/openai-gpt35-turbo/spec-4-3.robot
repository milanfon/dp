***Settings***
Library    SeleniumLibrary

***Variables***
${URL}    http://localhost:4680/tbuis/index.jsp

***Test Cases***
Open Page and Check Student Elements
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Wait Until Element Is Visible    aria/Login
    Click Element    aria/Login
    Wait Until Element Is Visible    aria/Username
    Input Text    aria/Username    gray
    Press Keys    aria/Username    TAB
    Input Password    aria/Password    pass
    Press Keys    Enter
    Wait Until Element Is Visible    aria/My Subjects
    Click Element    aria/My Subjects
    Wait Until Element Is Visible    stu.mySubjects.enrolledTable.unenrollSubjectButton-1
    Click Element    stu.mySubjects.enrolledTable.unenrollSubjectButton-1
    Wait Until Element Is Visible    stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    Click Element    stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    Sleep    3
    Page Should Contain Element    stu.mySubjects.successAlert
    Page Should Contain Element    stu.mySubjects.enrolledTable.Title
    Page Should Not Contain Element    xpath=//td[text()="Database Systems"]
    Close Browser

Login as Teacher and Check Teacher Elements
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Wait Until Element Is Visible    aria/Login
    Click Element    aria/Login
    Wait Until Element Is Visible    aria/Username
    Input Text    aria/Username    pedant
    Press Keys    aria/Username    TAB
    Input Password    aria/Password    pass
    Press Keys    Enter
    Wait Until Element Is Visible    aria/My Subjects
    Click Element    aria/My Subjects
    Wait Until Element Is Visible    tea.mySubjects.table.listOfStudentsButton-1
    Page Should Contain Element    tea.mySubjects.table.listOfStudentsButton-1    Students (0)
    Click Element    aria/My Exam Dates
    Wait Until Element Is Visible    tea.myExamDates.table.participantsButton-1-0
    Page Should Contain Element    tea.myExamDates.table.participantsButton-1-0    Participants (0/10)
    Click Element    aria/Set Evaluation
    Wait Until Element Is Visible    tea.setEvaluation.form.examTermDateSelect
    Click Element    tea.setEvaluation.form.examTermDateSelect
    Select From List by Index    tea.setEvaluation.form.examTermDateSelect    1
    Click Element    aria/Evaluation Table
    Wait Until Element Is Visible    tea.evalTable.filter.subjectSelect
    Click Element    tea.evalTable.filter.subjectSelect
    Select From List by Index    tea.evalTable.filter.subjectSelect    2
    Click Element    aria/Filter[role="button"]
    Sleep    3
    Page Should Contain Element    xpath=//td[text()="No students on this exam date"]
    Close Browser