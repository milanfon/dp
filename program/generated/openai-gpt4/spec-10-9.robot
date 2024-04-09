*** Settings ***
Documentation     Validation of specific elements after navigating through various pages as per the recorded steps.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${LOGIN_URL}      http://localhost:4680/tbuis/login
${TEACHER_USERNAME}       strict
${STUDENT_USERNAME}       orange
${PASSWORD}       pass

*** Test Cases ***
Teacher Scenario Validations
    [Documentation]    Performs steps according to the teacher's recording and validates conditions on different pages.
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Login    ${TEACHER_USERNAME}    ${PASSWORD}
    My Subjects Validations
    My Exam Dates Validation
    New Exam Dates Validation
    Set Evaluation Validation
    Evaluation Table Validation
    Others Subjects Validation
    List Of All Teachers Validation
    Close Browser

Student Scenario Validations
    [Documentation]    Performs steps according to the student's recording and validates the condition on the Other Subjects page.
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Login    ${STUDENT_USERNAME}    ${PASSWORD}
    Navigate To Other Subjects
    Page Should Not Contain    xpath=//tr[.//td[contains(text(), 'Operating Systems')]]/td[contains(text(), 'Peter Strict')]
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

My Subjects Validations
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    ${buttons}=    Get Webelements    xpath=//button[@value='Remove' and not(@id='tea.mySubjects.table.unregisterSubjectButton-0')]
    FOR    ${button}    IN    @{buttons}
        Element Should Be Disabled    ${button}
    END
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]

My Exam Dates Validation
    Navigate And Validate Not Present    My Exam Dates    th    Operating Systems

New Exam Dates Validation
    Navigate And Validate Not Present    New Exam Dates    option    Operating Systems

Set Evaluation Validation
    Navigate And Validate Not Present    Set Evaluation    option    *Operating Systems*

Evaluation Table Validation
    Navigate And Validate Not Present    Evaluation Table    option    Operating Systems

Others Subjects Validation
    Navigate And Validate Present    Others' Subjects    td    Operating Systems

List Of All Teachers Validation
    Navigate To    List of All Teachers
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems

Navigate And Validate Not Present
    [Arguments]    ${page_name}    ${element_tag}    ${text}
    Navigate To    ${page_name}
    Page Should Not Contain Element    xpath=//${element_tag}[contains(text(), '${text}')]

Navigate And Validate Present
    [Arguments]    ${page_name}    ${element_tag}    ${text}
    Navigate To    ${page_name}
    Page Should Contain Element    xpath=//${element_tag}[contains(text(), '${text}')]

Navigate To
    [Arguments]    ${page_name}
    Click Element    xpath=//*[contains(text(), '${page_name}')]
    Sleep    1s