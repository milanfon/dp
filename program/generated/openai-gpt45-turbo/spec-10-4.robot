*** Settings ***
Documentation     Verify various conditions after performing specific page navigations and actions.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}      http://localhost:4680/tbuis/login
${TEACHER_VIEW}   http://localhost:4680/tbuis/teacher-view/overview
${STUDENT_VIEW}   http://localhost:4680/tbuis/student-view/overview

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    
    # Navigate to My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${disabled}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Run Keyword If    ${disabled}    Log    Other remove buttons are disabled
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Sleep    2s
    
    # Navigate to My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Element Should Not Contain    xpath=//th    Operating Systems
    Sleep    2s
    
    # Navigate to New Exam Dates
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    2s
    
    # Navigate to Set Evaluation
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    2s
    
    # Navigate to Evaluation Table
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    2s
    
    # Navigate to Other's Subjects
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Element Should Contain    xpath=//td    Operating Systems
    Sleep    2s
    
    # Navigate to List of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems
    Sleep    2s
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    
    # Navigate to Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    ${row}=    Get Element Attribute    xpath=//*[contains(text(), "Operating Systems")]/ancestor::tr    id
    Element Should Not Contain    xpath=//*[@id="${row}"]    Peter Strict
    Close Browser