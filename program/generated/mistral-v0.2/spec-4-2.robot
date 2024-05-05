*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***

Test Case 1
    [Documentation]        Test case for student functionality

    [Preparation]        Open browser
    Open Browser        ${URL}

    [Step]        Wait until page with title "University information system" is loaded
    Wait Until Page Contains        University information system

    [Step]        Login as student
    Input Text        #loginPage.userNameInput        gray
    Input Text        #loginPage.passwordInput        pass
    Click Element        #loginPage.loginButton

    [Step]        Wait until page with title "Student's View" is loaded
    Wait Until Page Contains        Student's View

    [Step]        Wait for element with id "stu.mySubjects.successAlert" to disappear
    [Condition]        ${ element = Get Element From Log        id=stu.mySubjects.successAlert        timeout=10s        backup=10s }
    ${ alert = Get Alert Text        ${ element } }
    ${ alert_contains_success = Regex Match        ${ alert }        Success\s+alert\s+disappeared }
    [Title]        Success
    [Return]        ${ not alert_contains_success }

    [Step]        Wait for element with id "stu.mySubjects.enrolledTable.Title" to be present
    [Title]        Wait for "My Subjects" title to be present
    [Condition]        ${ element = Get Element From Log        id=stu.mySubjects.enrolledTable.Title        timeout=10s        backup=10s }
    [Return]        ${ element is not None }

    [Step]        Wait for element with text "Database Systems" not to be present in the table
    [Condition]        ${ table = Get Element From Log        id=stu.mySubjects.enrolledTable        timeout=10s        backup=10s }
    ${ rows = Get Table Rows        ${ table } }
    ${ rows_len = Len        ${ rows } }
    ${ db_sys_not_present = True }
    ${ i = 0 }
    ${ while        ${ i < rows_len } }
        ${ cell = Get Table Cell        ${ rows[${ i }] }        row=0 }
        ${ db_sys_not_present = ${ db_sys_not_present and Not Text Matches        ${ cell[0] }        Database Systems }
        ${ i = ${ i + 1 } }
    ${ end }
    [Return]        ${ db_sys_not_present }

    [Step]        Log out
    Click Element        #stu.menu.logout

    [Step]        Wait until page with title "University information system" is loaded

Test Case 2
    [Documentation]        Test case for teacher functionality

    [Preparation]        Open browser
    Open Browser        ${URL}

    [Step]        Wait until page with title "University information system" is loaded

    [Step]        Login as teacher
    Input Text        #loginPage.userNameInput        pedant
    Input Text        #loginPage.passwordInput        pass
    Click Element        #loginPage.loginButton

    [Step]        Wait until page with title "Teacher's View" is loaded

    [Step]        Wait for element with id "tea.mySubjects.table.listOfStudentsButton-1" to have text "Students (0)"
    [Title]        Wait for "Students (0)" text to be present
    [Condition]        ${ element = Get Element From Log        id=tea.mySubjects.table.listOfStudentsButton-1        timeout=10s        backup=10s }
    ${ text = Get Text        ${ element } }
    ${ text_contains_zero = Regex Match        ${ text }        Students\s+(0)\s+ }
    [Return]        ${ text_contains_zero }

    [Step]        Wait for element with id "tea.myExamDates.table.participantsButton-1-0" to have text "Participants (0/10)"
    [Title]        Wait for "Participants (0/10)" text to be present
    [Condition]        ${ element = Get Element From Log        id=tea.myExamDates.table.participantsButton-1-0        timeout=10s        backup=10s }
    ${ text = Get Text        ${ element } }
    ${ text_contains_zero_and_slash = Regex Match        ${ text }        Participants\s+(0\/\d+)\s+ }
    [Return]        ${ text_contains_zero_and_slash }

    [Step]        Log out
    Click Element        #tea.menu.logout

    [Step]        Wait until page with title "University information system" is loaded

Test Case 3
    [Documentation]        Test case for teacher functionality

    [Preparation]        Open browser
    Open Browser        ${URL}

    [Step]        Wait until page with title "University information system" is loaded

    [Step]        Login as teacher
    Input Text        #loginPage.userNameInput        pedant
    Input Text        #loginPage.passwordInput        pass
    Click Element        #loginPage.loginButton

    [Step]        Wait until page with title "Teacher's View" is loaded

    [Step]        Wait for element with id "tea.setEvaluation.form.noOneStudent" to be present
    [Title]        Wait for "No students" message to be present
    [Condition]        ${ element = Get Element From Log        id=tea.setEvaluation.form.noOneStudent        timeout=10s        backup=10s }
    [Return]        ${ element is not None }

    [Step]        Log out
    Click Element        #tea.menu.logout

    [Step]        Wait until page with title "University information system" is loaded

    [Step]        Wait for element with id "tea.mySubjects.table.listOfStudentsButton-1" to have text "Students (0)"

    [Step]        Wait for element with id "tea.myExamDates.table.participantsButton-1-0" to have text "Participants (0/10)"

    [Step]        Login as teacher
    Input Text        #loginPage.userNameInput        pedant
    Input Text        #loginPage.passwordInput        pass
    Click Element        #loginPage.loginButton

    [Step]        Click on "Set Evaluation"
    Click Element        #tea.menu.setEvaluation

    [Step]        Select a subject
    Select From List        #tea.setEvaluation.form.subjectSelect        label="Database Systems"

    [Step]        Wait for element with id "tea.setEvaluation.form.noOneStudent" to disappear
    [Condition]        ${ element = Get Element From Log        id=tea.setEvaluation.form.noOneStudent        timeout=10s        backup=10s }
    ${ alert = Get Alert Text        ${ element } }
    ${ alert_contains_success = Regex Match        ${ alert }        Success\s+message\s+disappeared }
    [Title]        Success
    [Return]        ${ not alert_contains_success }

    [Step]        Click on "Evaluation Table"
    Click Element        #tea.menu.evaluationTable

    [Step]        Wait for element with id "tea.evalTable.filter.submitButton" to be present

    [Step]        Wait for element of type "td" with text "No students on this exam date" to be present
    [Title]        Wait for "No students on this exam date" text to be present
    [Condition]        ${ element = Get Element From Log        tag="td"        text="No students on this exam date"        timeout=10s        backup=10s }
    [Return]        ${ element is not None }

    [Step]        Log out
    Click Element        #tea.menu.logout

    [Step]        Wait until page with title "University information system" is loaded

Test Case 4
    [Documentation]        Test case for teacher functionality

    [Preparation]        Open browser
    Open Browser        ${URL}

    [Step]        Wait until page with title "University information system" is loaded

    [Step]        Login as teacher
    Input Text        #loginPage.userNameInput        pedant
    Input Text        #loginPage.passwordInput        pass
    Click Element        #loginPage.loginButton

    [Step]        Wait until page with title "Teacher's View" is loaded

    [Step]        Click on "My Subjects"
    Click Element        #tea.menu.mySubjects

    [Step]        Wait for element with id "tea.mySubjects.table.listOfStudentsButton-1" to have text "Students (0)"

    [Step]        Click on "My Exam Dates"
    Click Element        #tea.menu.myExamDates

    [Step]        Wait for element with id "tea.myExamDates.table.participantsButton-1-0" to have text "Participants (0/10)"

    [Step]        Click on "Set Evaluation"
    Click Element        #tea.menu.setEvaluation

    [Step]        Select a subject
    Select From List        #tea.setEvaluation.form.subjectSelect        label="Database Systems"

    [Step]        Click on "Evaluation Table"
    Click Element        #tea.menu.evaluationTable

    [Step]        Wait for element with id "tea.evalTable.filter.subjectSelect" to be present

    [Step]        Wait for element with id "tea.evalTable.filter.submitButton" to be present

    [Step]        Wait for element with id "tea.evalTable.filter.submitButton" to be clickable
    [Condition]        ${ element = Get Element From Log        id=tea.evalTable.filter.submitButton        timeout=10s        backup=10s }
    ${ is_clickable = Is Element Clickable        ${ element } }
    [Return]        ${ is_clickable }

    [Step]        Click on "Filter"
    Click Element        #tea.evalTable.filter.submitButton

    [Step]        Wait for element of type "td" with text "No students on this exam date" to be present

    [Step]        Log out
    Click Element        #tea.menu.logout

    [Step]        Wait until page with title "University information system" is loaded

*** Teardown ***
Close Browser