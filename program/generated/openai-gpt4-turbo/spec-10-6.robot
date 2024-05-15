*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${MAIN_URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${TEACHER_OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview

*** Test Cases ***
Scenario For Teacher
    Open Browser    ${MAIN_URL}    ${BROWSER}
    Login As Teacher
    Navigate And Validate My Subjects
    Navigate And Validate My Exam Dates
    Navigate And Validate New Exam Dates
    Navigate And Validate Set Evaluation
    Navigate And Validate Evaluation Table
    Navigate And Validate Other's Subjects
    Navigate And Validate List of All Teachers
    [Teardown]    Close Browser

Scenario For Student
    Open Browser    ${MAIN_URL}    ${BROWSER}
    Login As Student
    Navigate And Validate Other Subjects
    [Teardown]    Close Browser

*** Keywords ***
Login As Teacher
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Location Should Be    ${TEACHER_OVERVIEW_URL}

Login As Student
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Location Should Be    ${STUDENT_OVERVIEW_URL}

Navigate And Validate My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    3s
    @{buttons} =    Get Webelements    xpath=//button[@value="Remove"]
    FOR    ${button}    IN    @{buttons}
        Element Should Be Disabled    ${button}
    END
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Wait Until Element Is Visible    xpath=//*[@id="tea.mySubjects.successAlert"]

Navigate And Validate My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Element Should Not Contain    xpath=//th    Operating Systems

Navigate And Validate New Exam Dates
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems

Navigate And Validate Set Evaluation
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems

Navigate And Validate Evaluation Table
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Element Should Not Contain    xpath=//option    Operating Systems

Navigate And Validate Other's Subjects
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Element Should Contain    xpath=//td    Operating Systems

Navigate And Validate List of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems

Navigate And Validate Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    ${row_xpath}=    Get Element Attribute    xpath=//*[contains(text(), "Operating Systems")]    xpath
    Element Should Not Contain    ${row_xpath}/..    Peter Strict