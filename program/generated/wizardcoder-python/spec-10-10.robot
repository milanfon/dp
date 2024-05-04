*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test Teacher
    Teacher Test

Test Student
    Student Test

*** Keywords ***

Teacher Test
    Open Browser    http://localhost:4680    chrome
    Set Selenium Speed    ${DELAY}
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:tea.menu.mySubjects
    ${disabled}    Get Element Count    xpath://*[@id='tea.mySubjects.table.unregisterSubjectButton'][@disabled]
    Should Be True    ${disabled} > 0
    Click Element    id:tea.mySubjects.table.unregisterSubjectButton-0
    Wait Until Element Is Visible    id:tea.mySubjects.successAlert
    Click Link    id:tea.menu.myExamDates
    Page Should Not Contain    Operating Systems
    Click Link    id:tea.menu.newExamDates
    Page Should Not Contain    Operating Systems
    Click Link    id:tea.menu.setEvaluation
    Page Should Not Contain    Operating Systems
    Click Link    id:tea.menu.evaluationTable
    Page Should Not Contain    Operating Systems
    Click Link    id:tea.menu.otherSubjects
    Page Should Contain    Operating Systems
    Click Link    id:tea.menu.listOfAllTeachers
    Page Should Not Contain    Operating Systems    xpath:.//*[@id="tea.listOfAllTeachers.teacherRow-5"]
    Close All Browsers

Student Test
    Open Browser    http://localhost:4680    chrome
    Set Selenium Speed    ${DELAY}
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:stu.menu.otherSubjects
    Page Should Not Contain    Peter Strict    xpath:.//tr[contains(., 'Operating Systems')]
    Close All Browsers