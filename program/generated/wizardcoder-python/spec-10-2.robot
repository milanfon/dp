*** Settings ***
Library    SeleniumLibrary   
Library    Collections

*** Variables ***
${delay}   5s

*** Test Cases ***
Test Teacher
    Teacher Test

Test Student
    Student Test

*** Keywords ***
Teacher Test
    Open Browser    http://localhost:4680    Chrome    executable_path=${exec_path}
    Set Window Size    ${468}    ${400}
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Sleep    ${delay}
    Click Element    id:tea.menu.mySubjects
    Sleep    ${delay}
    ${remove_buttons}    Get Webelements    xpath://*[contains(@id, 'tea.mySubjects.table.removeSubjectButton')]
    :FOR    ${btn}    IN    @{remove_buttons}
    \    ${status}    Get Element Attribute    ${btn}@disabled
    \    Run Keyword If    '${status}' == 'true'    Log    Remove button is disabled    console=True    ELSE    Fail    Remove button is not disabled
    Click Element    id:tea.mySubjects.table.removeSubjectButton-0
    Sleep    ${delay}
    Page Should Contain Element    id:tea.mySubjects.successAlert
    Click Element    id:tea.menu.myExamDates
    Sleep    ${delay}
    Page Should Not Contain    <th>Operating Systems</th>
    Click Element    id:tea.menu.newExamDates
    Sleep    ${delay}
    Page Should Not Contain    <option>Operating Systems</option>
    Click Element    id:tea.menu.setEvaluation
    Sleep    ${delay}
    Page Should Not Contain    <option>Operating Systems</option>
    Click Element    id:tea.menu.evaluationTable
    Sleep    ${delay}
    Page Should Not Contain    <option>Operating Systems</option>
    Click Element    id:tea.menu.otherSubjects
    Sleep    ${delay}
    Page Should Contain    Operating Systems
    Click Element    id:tea.menu.listOfAllTeachers
    Sleep    ${delay}
    ${teacher_row}    Get Webelement    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]
    ${teacher_table}    Get Webelement    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    ${teacher_table_contains}    Get Length    ${teacher_table}
    Run Keyword If    ${teacher_table_contains} > 0    Fail    Teacher's table contains "Operating Systems"
    Close Browser

Student Test
    Open Browser    http://localhost:4680    Chrome    executable_path=${exec_path}
    Set Window Size    ${468}    ${400}
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Sleep    ${delay}
    Click Element    id:stu.menu.otherSubjects
    Sleep    ${delay}
    ${subjects}    Get Webelements    xpath://*[contains(@class, 'otherSubjects.subjectName')]
    ${subjects_contains}    Get Length    ${subjects}
    ${subject_found}    ${subject}    Run Keyword And Ignore Error    Get Webelement    xpath://*[contains(@class, 'otherSubjects.subjectName')]//*[contains(text(), 'Operating Systems')]
    Run Keyword If    '${subject_found[0]}' == 'PASS'    Fail    Subject found
    Close Browser