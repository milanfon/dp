*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  0.5

    Input Text  xpath///*[@id="loginPage.userNameInput"]  gray
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Press Key  xpath///*[@id="loginPage.passwordInput"]  ENTER

    Wait Until Page Contains  Student's View

    Click Element  xpath///*[@id="stu.menu.mySubjects"]
    Wait Until Page Contains  Student's View

    ${success_alert_present} =  Run Keyword And Return Status  Page Should Contain Element  xpath///*[@id="stu.mySubjects.successAlert"]
    ${enrolled_table_present} =  Run Keyword And Return Status  Page Should Contain Element  xpath///*[@id="stu.mySubjects.enrolledTable.Title"]
    ${database_systems_not_present} =  Run Keyword And Return Status  Page Should Not Contain Element  xpath//td[text()="Database Systems"]

    Should Be True  ${success_alert_present}
    Should Be True  ${enrolled_table_present}
    Should Be True  ${database_systems_not_present}

    Close Browser

Teacher Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  0.5

    Input Text  xpath///*[@id="loginPage.userNameInput"]  pedant
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Press Key  xpath///*[@id="loginPage.passwordInput"]  ENTER

    Wait Until Page Contains  Teacher's View

    Click Element  xpath///*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains  Teacher's View
    ${list_of_students_text} =  Get Text  xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Should Contain  ${list_of_students_text}  Students (0)

    Click Element  xpath///*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains  Teacher's View
    ${participants_text} =  Get Text  xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Should Contain  ${participants_text}  Participants (0/10)

    Click Element  xpath///*[@id="tea.menu.setEvaluation"]
    Wait Until Page Contains  Teacher's View
    Select From List By Index  xpath///*[@id="tea.setEvaluation.form.subjectSelect"]  1
    ${no_one_student_displayed} =  Run Keyword And Return Status  Page Should Contain Element  xpath///*[@id="tea.setEvaluation.form.noOneStudent"]
    Should Be True  ${no_one_student_displayed}

    Click Element  xpath///*[@id="tea.menu.evaluationTable"]
    Wait Until Page Contains  Teacher's View
    Select From List By Index  xpath///*[@id="tea.evalTable.filter.subjectSelect"]  2
    Click Element  xpath///*[@id="tea.evalTable.filter.submitButton"]
    ${no_students_on_this_exam_date_present} =  Run Keyword And Return Status  Page Should Contain Element  xpath//td[text()="No students on this exam date"]
    Should Be True  ${no_students_on_this_exam_date_present}

    Close Browser