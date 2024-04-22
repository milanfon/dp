*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome
${DELAY}          500ms

*** Keywords ***
Open Browser And Maximize
    Open Browser    ${INDEX URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//*[@id="header.link.login"]

Login As Teacher
    Click Link    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.mySubjects"]

Login As Student
    Click Link    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.menu.mySubjects"]

*** Test Cases ***
Teacher removes subject and student can't see it
    [Documentation]    Teacher removes subject and student can't see it
    Open Browser And Maximize
    Login As Teacher
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Link    xpath=//*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    ${removeButtons}=    Get Webelements    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]/../..//button
    FOR    ${button}    IN    @{removeButtons}
        Run Keyword If    '${button}'=='${removeButtons}[0]'
        ...    Continue For Loop
        ...    ELSE
        ...    Element Should Be Disabled    ${button}
    END
    Click Button    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Page Should Contain Element    xpath=//*[@id="tea.mySubjects.successAlert"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Link    xpath=//*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.myExamDates.table"]
    Page Should Not Contain Element    xpath=//*[@id="tea.myExamDates.table"]//th[text()="Operating Systems"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.newExamDates"]
    Click Link    xpath=//*[@id="tea.menu.newExamDates"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.newExamDates.subjectSelect"]
    Page Should Not Contain Element    xpath=//*[@id="tea.newExamDates.subjectSelect"]//option[text()="Operating Systems"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Click Link    xpath=//*[@id="tea.menu.setEvaluation"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.setEvaluation.subjectSelect"]
    Page Should Not Contain Element    xpath=//*[@id="tea.setEvaluation.subjectSelect"]//option[contains(text(), "Operating Systems")]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Link    xpath=//*[@id="tea.menu.evaluationTable"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.evaluationTable.subjectSelect"]
    Page Should Not Contain Element    xpath=//*[@id="tea.evaluationTable.subjectSelect"]//option[text()="Operating Systems"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Link    xpath=//*[@id="tea.menu.otherSubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.otherSubjects.table"]//td[text()="Operating Systems"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Click Link    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]
    Page Should Not Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser
    Open Browser And Maximize
    Login As Student
    Wait Until Page Contains Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Click Link    xpath=//*[@id="stu.menu.otherSubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.otherSubjects.table"]//td[text()="Operating Systems"]
    Page Should Not Contain Element    xpath=//*[@id="stu.otherSubjects.table"]//tr[./td[text()="Operating Systems"] and ./td[contains(text(), "Peter Strict")]]
    Close Browser
