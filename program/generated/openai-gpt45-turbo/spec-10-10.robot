*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_URL}    http://localhost:4680/tbuis/student-view/overview
${TEACHER_URL}    http://localhost:4680/tbuis/teacher-view/overview
${BROWSER}    Chrome

*** Test Cases ***
Teacher Workflow with Custom Validations
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Login as Teacher
    Navigate to My Subjects
    Validate My Subjects Page
    Navigate to My Exam Dates
    Validate My Exam Dates Page
    Navigate to New Exam Dates
    Validate New Exam Dates Page
    Navigate to Set Evaluation
    Validate Set Evaluation Page
    Navigate to Evaluation Table
    Validate Evaluation Table
    Navigate to Other's Subjects
    Validate Other's Subjects
    Navigate to List of All Teachers
    Validate List of All Teachers
    Close Browser

Student Workflow with Custom Validations
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Login as Student
    Navigate to Other Subjects
    Validate Other Subjects Page for Student
    Close Browser

*** Keywords ***
Login as Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Location Should Be    ${TEACHER_URL}

Navigate to My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s

Validate My Subjects Page
    ${disabled_buttons}=    Get Element Count    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"][@disabled='disabled']
    Should Be Equal As Integers    ${disabled_buttons}    1
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]

Navigate to My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s

Validate My Exam Dates Page
    Page Should Not Contain Element    xpath=//th[text()="Operating Systems"]

Navigate to New Exam Dates
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s

Validate New Exam Dates Page
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]

Navigate to Set Evaluation
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s

Validate Set Evaluation Page
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]

Navigate to Evaluation Table
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s

Validate Evaluation Table
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]

Navigate to Other's Subjects
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s

Validate Other's Subjects
    Element Should Contain    xpath=//td[text()="Operating Systems"]

Navigate to List of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s

Validate List of All Teachers
    Page Should Not Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[contains(text(), "Operating Systems")]

Login as Student
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Location Should Be    ${STUDENT_URL}

Navigate to Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s

Validate Other Subjects Page for Student
    ${parent}=    Get WebElement    xpath=//tr[contains(., "Operating Systems")]
    Element Should Not Contain    ${parent}    "Peter Strict"