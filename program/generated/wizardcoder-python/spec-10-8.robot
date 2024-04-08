*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}     1s

*** Test Cases ***
Spec 10 Teacher
    [Documentation]    Tests the functionality of the Teacher's View
    [Tags]    Teacher
    Open Browser    http://localhost:4680    browser=${BROWSER}
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.mySubjects.table.unregisterSubjectButton-0
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.menu.newExamDates
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.menu.otherSubjects
    Click Element    id:tea.menu.listOfAllTeachers
    Logout

    [Teardown]    Close Browser

    Login as Student

Spec 10 Student
    [Documentation]    Tests the functionality of the Student's View
    [Tags]    Student
    Logout

    [Teardown]    Close Browser

*** Keywords ***
Login as Student
    Open Browser    http://localhost:4680    browser=${BROWSER}
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherSubjects

Logout
    Click Element    id:header.link.logout
    Wait Until Element Is Visible    id:loginPage.loginFormSubmit

Verify Elements
    [Arguments]    ${page}
    Run Keyword If    '${page}' == 'My Subjects'
    ...    Run Keywords
    ...    Wait Until Element Is Visible    id:tea.mySubjects.removeSubjects    ${DELAY}
    ...    AND    Run Keyword And Ignore Error    Page Should Contain Element    id:tea.mySubjects.removeSubjects[disabled]
    ...    AND    Run Keyword And Ignore Error    Page Should Contain Element    id:tea.mySubjects.removeSubjects[disabled]
    ...    AND    Run Keyword And Ignore Error    Page Should Contain Element    id:tea.mySubjects.removeSubjects[disabled]
    ...    AND    Run Keyword And Ignore Error    Page Should Contain Element    id:tea.mySubjects.removeSubjects[disabled]
    ...    AND    Run Keyword And Ignore Error    Page Should Contain Element    id:tea.mySubjects.removeSubjects[disabled]
    ...    AND    Run Keyword And Ignore Error    Page Should Contain Element    id:tea.mySubjects.removeSubjects[disabled]
    ...    AND    Page Should Contain Element    id:tea.mySubjects.successAlert

    Run Keyword If    '${page}' == 'My Exam Dates'
    ...    Page Should Not Contain Element    xpath://th[text()='Operating Systems']

    Run Keyword If    '${page}' == 'New Exam Dates'
    ...    Page Should Not Contain Element    xpath://option[text()='Operating Systems']

    Run Keyword If    '${page}' == 'Set Evaluation'
    ...    Page Should Not Contain Element    xpath://option[text()='Operating Systems']

    Run Keyword If    '${page}' == 'Evaluation Table'
    ...    Page Should Not Contain Element    xpath://option[text()='Operating Systems']

    Run Keyword If    '${page}' == 'Other\'s Subjects'
    ...    Page Should Contain Element    xpath://td[text()='Operating Systems']

    Run Keyword If    '${page}' == 'List of All Teachers'
    ...    Page Should Not Contain Element    xpath://td[text()='Operating Systems']
    ...    Page Should Not Contain Element    xpath://td[text()='Peter Strict']

    Run Keyword If    '${page}' == 'Other Subjects'
    ...    Page Should Not Contain    Operating Systems
    ...    Page Should Not Contain    xpath://td[text()='Peter Strict']