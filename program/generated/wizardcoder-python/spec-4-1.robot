*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 4 Student
    Open Browser    http://localhost:4680    Chrome
    Set Selenium Speed   0
    Go To    http://localhost:4680
    Input Text    id:loginPage.userNameInput    gray
    Input Text    id:loginPage.passwordInput    pass
    Click Button    xpath://*[@id="loginPage.loginButton"]
    Click Link    xpath://*[@id="stu.menu.mySubjects"]
    Click Button    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Button    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    # Add delay
    Wait Until Element Is Not Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    # Check if element with id "stu.mySubjects.successAlert" is present
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.successAlert"]
    # Check if element with id "stu.mySubjects.enrolledTable.Title" is present
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    # Check if element of type <td> with text "Database Systems" is not present
    Page Should Not Contain Element    xpath://td[contains(text(),"Database Systems")]
    Close Browser

Spec 4 Teacher
    Open Browser    http://localhost:4680    Chrome
    Set Selenium Speed   0
    Go To    http://localhost:4680
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Button    xpath://*[@id="loginPage.loginButton"]
    Click Link    xpath://*[@id="tea.menu.mySubjects"]
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Select From List By Index    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]   1
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]
    # Add delay
    # On page "My Subjects" element with id "tea.mySubjects.table.listOfStudentsButton-1" has text of "Students (0) "
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    # this should contain "Students (0) "
    # On page "My Exam Dates" element with id "tea.myExamDates.table.participantsButton-1-0" has text of "Participants (0/10) "
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    # this should contain "Participants (0/10) "
    # On page "Set Evaluation" after selecting the subject, element with id "tea.setEvaluation.form.noOneStudent" is displayed.
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    # On page "Evaluation Table" after selecting the subject and clicking the filter button, there should be element of type <td> with text "No students on this exam date" present.
    Page Should Contain Element    xpath://td[contains(text(),"No students on this exam date")]
    Close Browser