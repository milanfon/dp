*** Settings ***
Documentation     A suite of tests for the university information system.
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}        Chrome
${DELAY}          2s
${USERNAME_TEACHER}    pedant
${PASSWORD_TEACHER}    pass
${USERNAME_STUDENT}    yellow
${PASSWORD_STUDENT}    pass

*** Test Cases ***
Teacher Test
    [Documentation]    Test case for the teacher functionality.
    Open Browser To Login Page
    Login As Teacher
    Click Others' Subjects
    Click Participate Button
    Check If Still On Others' Subjects Page
    Check Success Alert Visibility
    Click My Exam Dates
    Check Linear Algebra Presence
    Check No Exam Dates Text
    Click New Exam Dates
    Check Linear Algebra In Dropdown
    Click List Of All Teachers
    Check Teacher Details
    Close Browser

Student Test
    [Documentation]    Test case for the student functionality.
    Open Browser To Login Page
    Login As Student
    Click Other Subjects
    Check Subject And Teacher Details
    Close Browser

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Open the browser and navigate to the login page.
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Login As Teacher
    [Documentation]    Login as a teacher using the provided credentials.
    Input Text    id=loginPage.userNameInput    ${USERNAME_TEACHER}
    Input Text    id=loginPage.passwordInput    ${PASSWORD_TEACHER}
    Click Button    id=loginPage.loginFormSubmit

Login As Student
    [Documentation]    Login as a student using the provided credentials.
    Input Text    id=loginPage.userNameInput    ${USERNAME_STUDENT}
    Input Text    id=loginPage.passwordInput    ${PASSWORD_STUDENT}
    Click Button    id=loginPage.loginFormSubmit

Click Others' Subjects
    [Documentation]    Click on Others' Subjects in the menu.
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]

Click Participate Button
    [Documentation]    Click the Participate button on the Others' Subjects page.
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]

Check If Still On Others' Subjects Page
    [Documentation]    Check if we are still on the Others' Subjects page after clicking the Participate button.
    Page Should Contain    Others' Subjects

Check Success Alert Visibility
    [Documentation]    Check if the success alert is visible after clicking the Participate button.
    Element Should Be Visible    id=tea.otherSubjects.successAlert

Click My Exam Dates
    [Documentation]    Click on My Exam Dates in the menu.
    Click Element    xpath://*[@id="tea.menu.myExamDates"]

Check Linear Algebra Presence
    [Documentation]    Check if the text "Linear Algebra" is present on the My Exam Dates page.
    Page Should Contain    Linear Algebra

Check No Exam Dates Text
    [Documentation]    Check if there is a <tr> element with id "tea.myExamDates.table.noRecords-2" and text "No exam dates.".
    Element Text Should Be    xpath://*[@id="tea.myExamDates.table.noRecords-2"]    No exam dates.

Click New Exam Dates
    [Documentation]    Click on New Exam Dates in the menu.
    Click Element    xpath://*[@id="tea.menu.newExamDates"]

Check Linear Algebra In Dropdown
    [Documentation]    Check if there is an element <option> with text "Linear Algebra".
    Element Should Contain    xpath://option[contains(text(), 'Linear Algebra')]    Linear Algebra

Click List Of All Teachers
    [Documentation]    Click on List of All Teachers in the menu.
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]

Check Teacher Details
    [Documentation]    Check if there is an element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3] containing the text "Linear Algebra" and element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2] should have text matching "Alice Pedant".
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Click Other Subjects
    [Documentation]    Click on Other Subjects in the menu.
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]

Check Subject And Teacher Details
    [Documentation]    Check if element with path //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2] has text matching "Linear Algebra" and element with path //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3] has text matching "Alice Pedant".
    Element Text Should Be    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Be    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant