*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Login as student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath://*[@id="loginPage.passwordInput"]    ENTER

    # Check elements on My Subjects page
    Wait Until Page Contains Element    xpath://*[@id="stu.mySubjects.successAlert"]
    Wait Until Page Contains Element    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath://td[text()='Database Systems']

    Close Browser

Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Login as teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath://*[@id="loginPage.passwordInput"]    ENTER

    # Check elements on different pages
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    ${text}=    Get Text    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Should Be Equal    ${text}    Students (0)

    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    ${text}=    Get Text    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Should Be Equal    ${text}    Participants (0/10)

    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    # Select the second option in the dropdown
    ${options}=    Get WebElements    xpath://select[@id='tea.setEvaluation.form.subjectSelect']/option
    ${size}=    Get Length    ${options}
    Click Element    xpath://select[@id='tea.setEvaluation.form.subjectSelect']/option[2]
    Wait Until Page Contains Element    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]

    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    # Select the third option in the dropdown
    ${options}=    Get WebElements    xpath://select[@id='tea.evalTable.filter.subjectSelect']/option
    ${size}=    Get Length    ${options}
    Click Element    xpath://select[@id='tea.evalTable.filter.subjectSelect']/option[3]
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Wait Until Page Contains Element    xpath://td[text()='No students on this exam date']

    Close Browser