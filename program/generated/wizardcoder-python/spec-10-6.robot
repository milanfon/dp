*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680
${DELAY}       0    # You can increase this value if needed
${LOGIN}    xpath://*[@id="loginPage.loginFormSubmit"]
${LOGIN_URL}    ${URL}/login
${LOGIN_USER}    strict
${LOGIN_PASS}    pass
${LOGIN_USER_ST}    orange
${LOGIN_PASS_ST}    pass
${LOGIN_BTN}    xpath://*[@id="loginPage.loginFormSubmit"]

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${LOGIN_USER}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${LOGIN_PASS}
    Click Element    ${LOGIN_BTN}
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    ${ALL_BTN_DISABLED}    Get Element Count    xpath://*[@id="tea.mySubjects.table"]//button[@disabled="disabled"]
    Should Be True    ${ALL_BTN_DISABLED} > 0
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain    xpath://*[@id="tea.myExamDates.table"]//th[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain    xpath://*[@id="tea.newExamDates.table"]//*[@id="tea.newExamDates.table"]//option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Page Should Not Contain    xpath://*[@id="tea.setEvaluation.table"]//*[@id="tea.setEvaluation.table"]//option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Page Should Not Contain    xpath://*[@id="tea.evaluationTable.table"]//*[@id="tea.evaluationTable.table"]//*[@id="tea.evaluationTable.table"]//option[contains(text(), "Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Page Should Contain    xpath://*[@id="tea.otherSubjects.table"]//*[@id="tea.otherSubjects.table"]//td[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Page Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table"]//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//*[contains(text(), "Operating Systems"]
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${LOGIN_USER_ST}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${LOGIN_PASS_ST}
    Click Element    ${LOGIN_BTN}
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    ${TXT_NOT_FOUND}    Get Element Count    xpath://*[@id="stu.otherSubjects.table"]//*[contains(text(), "Operating Systems"]
    Should Be True    ${TXT_NOT_FOUND} == 0
    ${TXT_NOT_FOUND}    Get Element Count    xpath://*[@id="stu.otherSubjects.table"]//*[contains(text(), "Peter Strict"]
    Should Be True    ${TXT_NOT_FOUND} == 0
    Close Browser