*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:4680/tbuis/index.jsp
${USERNAME_TEACHER}    strict
${PASSWORD_TEACHER}    pass
${USERNAME_STUDENT}    orange
${PASSWORD_STUDENT}    pass

*** Keywords ***
Login As Teacher
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=loginPage.userNameInput    ${USERNAME_TEACHER}
    Input Text      id=loginPage.passwordInput    ${PASSWORD_TEACHER}
    Click Element   id=loginPage.loginFormSubmit

Login As Student
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=loginPage.userNameInput    ${USERNAME_STUDENT}
    Input Text      id=loginPage.passwordInput    ${PASSWORD_STUDENT}
    Click Element   id=loginPage.loginFormSubmit

*** Test Cases ***
Test Case for Teacher
    Login As Teacher

    # Page "My Subjects"
    Click Element   xpath//a[text()='My Subjects']
    ${disabled_buttons}=    Get WebElements    xpath://button[text()='Remove' and @disabled]
    Should Be True    ${disabled_buttons} != []
    Click Element   xpath//button[text()='Remove']
    Should Be True    Page Should Contain Element    id=tea.mySubjects.successAlert

    # Page "My Exam Dates"
    Click Element   xpath//a[text()='My Exam Dates']
    Should Not Be True    Page Should Contain Element    xpath//th[text()='Operating Systems']

    # Page "New Exam Dates"
    Click Element   xpath//a[text()='New Exam Dates']
    Should Not Be True    Page Should Contain Element    xpath//option[text()='Operating Systems']

    # Page "Set Evaluation"
    Click Element   xpath//a[text()='Set Evaluation']
    Should Not Be True    Page Should Contain Element    xpath//option[contains(text(), 'Operating Systems')]

    # Page "Evaluation Table"
    Click Element   xpath//a[text()='Evaluation Table']
    Should Not Be True    Page Should Contain Element    xpath//option[text()='Operating Systems']

    # Page "Other's Subjects"
    Click Element   xpath//a[text()='Others\' Subjects']
    Should Be True    Page Should Contain Element    xpath//td[text()='Operating Systems']

    # Page "List of All Teachers"
    Click Element   xpath//a[text()='List of All Teachers']
    ${teacher_row}=    Get WebElement    xpath//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']
    ${teacher_cells}=    Get WebElements    xpath=./td    parent=${teacher_row}
    Should Not Be True    'Operating Systems' in [    Get Text    ${cell}    FOR    ${cell}    IN    @{teacher_cells}]

    Close All Browsers

Test Case for Student
    Login As Student

    # Page "Other Subjects"
    Click Element   xpath//a[text()='Other Subjects']
    ${subject_rows}=    Get WebElements    xpath//tr[contains(., 'Operating Systems')]
    FOR    ${row}    IN    @{subject_rows}
        ${cells}=    Get WebElements    xpath=./td    parent=${row}
        Should Not Be True    'Peter Strict' in [    Get Text    ${cell}    FOR    ${cell}    IN    @{cells}]
    END

    Close All Browsers