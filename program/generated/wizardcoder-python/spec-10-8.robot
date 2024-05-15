*** Settings ***
Library    SeleniumLibrary    WITH NAME    Selenium

*** Variables ***
${BROWSER}    Chrome
${DELAY}    0s
${URL}    http://localhost:4680/tbuis/
${USER}    strict
${PASS}    pass
${USER_ST}    orange
${PASS_ST}    pass

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

*** Test Cases ***
Teacher Test
    Open Browser To Login Page
    Login As Teacher
    Teacher Test Steps
    Close Browser

Student Test
    Open Browser To Login Page
    Login As Student
    Student Test Steps
    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    //*[@id="loginPage.userNameInput"]    ${USER}
    Input Text    //*[@id="loginPage.passwordInput"]    ${PASS}
    Click Button    //*[@id="loginPage.loginFormSubmit"]

Login As Student
    Input Text    //*[@id="loginPage.userNameInput"]    ${USER_ST}
    Input Text    //*[@id="loginPage.passwordInput"]    ${PASS_ST}
    Click Button    //*[@id="loginPage.loginFormSubmit"]

Teacher Test Steps
    Click Link    //*[@id="tea.menu.mySubjects"]
    Click Button    //*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Click Link    //*[@id="tea.menu.myExamDates"]
    Click Link    //*[@id="tea.menu.newExamDates"]
    Click Link    //*[@id="tea.menu.setEvaluation"]
    Click Link    //*[@id="tea.menu.evaluationTable"]
    Click Link    //*[@id="tea.menu.otherSubjects"]
    Click Link    //*[@id="tea.menu.listOfAllTeachers"]
    Click Link    //*[@id="tea.menu.logout"]

Student Test Steps
    Click Link    //*[@id="stu.menu.otherSubjects"]

*** Test Cases ***
Teacher Test
    [Tags]    teacher
    Open Browser To Login Page
    Login As Teacher
    Teacher Test Steps
    [Teardown]    Close Browser

Student Test
    [Tags]    student
    Open Browser To Login Page
    Login As Student
    Student Test Steps
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Teacher Test Steps
    Click Link    //*[@id="tea.menu.mySubjects"]
    ${all_buttons}=    Get Webelements    //*[@id="tea.mySubjects.table.removeSubjectButton"]
    ${length}=    Get Length    ${all_buttons}
    ${count}=    Get Matching Xpath Count    //*[@id="tea.mySubjects.table.removeSubjectButton"]
    Should Be Equal    ${length}    ${count}
    Click Button    //*[@id="tea.mySubjects.table.removeSubjectButton-0"]
    Wait Until Element Is Visible    //*[@id="tea.mySubjects.successAlert"]
    Click Link    //*[@id="tea.menu.myExamDates"]
    Wait Until Element Is Not Visible    //*[@id="tea.myExamDates.table.subjects"]//*[.="Operating Systems"]
    Click Link    //*[@id="tea.menu.newExamDates"]
    Wait Until Element Is Not Visible    //*[@id="tea.newExamDates.table.subjects"]//*[.="Operating Systems"]
    Click Link    //*[@id="tea.menu.setEvaluation"]
    Wait Until Element Is Not Visible    //*[@id="tea.setEvaluation.table.subjects"]//*[.="Operating Systems"]
    Click Link    //*[@id="tea.menu.otherSubjects"]
    Wait Until Element Is Not Visible    //*[@id="tea.otherSubjects.table.subjects"]//*[.="Operating Systems"]
    Click Link    //*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Element Is Not Visible    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//*[.="Operating Systems"]

Student Test Steps
    Click Link    //*[@id="stu.menu.otherSubjects"]
    Wait Until Element Is Not Visible    //*[contains(., "Operating Systems")]    xpath=//*[@id="stu.otherSubjects.table.subjects"]//tr[contains(., "Operating Systems")]//following-sibling::*
    [Teardown]    Close Browser 