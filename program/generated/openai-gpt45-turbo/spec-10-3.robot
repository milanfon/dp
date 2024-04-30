*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${TEACHER_URL}    http://localhost:4680/tbuis/index.jsp
${STUDENT_URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Workflow Checks
    Open Browser    ${TEACHER_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${is_disabled}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//button[@value="Remove"]
    Run Keyword If    ${is_disabled}    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//th[text()="Operating Systems"]
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Element Should Be Visible    xpath=//td[text()="Operating Systems"]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser

Student Workflow Checks
    Open Browser    ${STUDENT_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//tr[contains(., "Operating Systems")]//td[contains(., "Peter Strict")]
    Close Browser