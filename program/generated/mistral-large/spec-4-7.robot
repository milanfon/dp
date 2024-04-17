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

    # Login as student
    Input Text  xpath//*[@id="loginPage.userNameInput"]  gray
    Input Password  xpath//*[@id="loginPage.passwordInput"]  pass
    Press Key  xpath//*[@id="loginPage.passwordInput"]  ENTER

    # Navigate to My Subjects page
    Click Element  xpath//*[@id="stu.menu.mySubjects"]

    # Check elements
    Page Should Contain Element  xpath//*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element  xpath//*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element  xpath//td[text()='Database Systems']

    Close Browser

Teacher Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  0.5

    # Login as teacher
    Input Text  xpath//*[@id="loginPage.userNameInput"]  pedant
    Input Password  xpath//*[@id="loginPage.passwordInput"]  pass
    Press Key  xpath//*[@id="loginPage.passwordInput"]  ENTER

    # Navigate to My Subjects page
    Click Element  xpath//*[@id="tea.menu.mySubjects"]

    # Check element
    ${text}=  Get Text  xpath//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Should Be Equal  ${text}  Students (0)

    # Navigate to My Exam Dates page
    Click Element  xpath//*[@id="tea.menu.myExamDates"]

    # Check element
    ${text}=  Get Text  xpath//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Should Be Equal  ${text}  Participants (0/10)

    # Navigate to Set Evaluation page
    Click Element  xpath//*[@id="tea.menu.setEvaluation"]

    # Select second subject
    ${subject}=  Get WebElements  xpath//*[@id="tea.setEvaluation.form.subjectSelect"]/option
    ${size}=  Get Length  ${subject}
    Select From List By Index  xpath//*[@id="tea.setEvaluation.form.subjectSelect"]  1

    # Check element
    Page Should Contain Element  xpath//*[@id="tea.setEvaluation.form.noOneStudent"]

    # Navigate to Evaluation Table page
    Click Element  xpath//*[@id="tea.menu.evaluationTable"]

    # Select third subject
    ${subject}=  Get WebElements  xpath//*[@id="tea.evalTable.filter.subjectSelect"]/option
    ${size}=  Get Length  ${subject}
    Select From List By Index  xpath//*[@id="tea.evalTable.filter.subjectSelect"]  2

    # Click filter button
    Click Element  xpath//*[@id="tea.evalTable.filter.submitButton"]

    # Check element
    Page Should Contain Element  xpath//td[text()='No students on this exam date']

    Close Browser