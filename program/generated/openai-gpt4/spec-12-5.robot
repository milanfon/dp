*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Teacher Actions With Exam Dates And Evaluations
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Login As Teacher    scatterbrained    pass
    Cancel Exam Date And Verify Success Alert
    Navigate To Set Evaluation And Check For No Records
    Select First Option In Evaluation Table And Check No Exam Dates
    [Teardown]    Close Browser

Student Check For Computation Structures
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Login As Student    orange    pass
    Check For Absence Of Computation Structures
    [Teardown]    Close Browser

*** Keywords ***
Login As Teacher
    [Arguments]    ${username}    ${password}
    Wait And Click    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Wait And Click    xpath=//*[@id="loginPage.loginFormSubmit"]

Login As Student
    [Arguments]    ${username}    ${password}
    Wait And Click    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Wait And Click    xpath=//*[@id="loginPage.loginFormSubmit"]

Cancel Exam Date And Verify Success Alert
    Wait And Click    xpath=//*[@id="tea.menu.myExamDates"]
    Wait And Click    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Accept Alert
    Wait Until Element Is Visible    xpath=//*[@id="tea.myExamDates.successAlert"]

Navigate To Set Evaluation And Check For No Records
    Wait And Click    xpath=//*[@id="tea.menu.setEvaluation"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.setEvaluation.form.noRecords"]

Select First Option In Evaluation Table And Check No Exam Dates
    Wait And Click    xpath=//*[@id="tea.menu.evaluationTable"]
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    0
    Wait And Click    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject

Check For Absence Of Computation Structures
    Wait And Click    xpath=//*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures

Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}