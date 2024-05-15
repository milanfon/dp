*** Settings ***
Documentation     Test scenario for teacher and student actions
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:4680/tbuis/index.jsp
${TEACHER_USERNAME}   strict
${TEACHER_PASSWORD}   pass
${STUDENT_USERNAME}   orange
${STUDENT_PASSWORD}   pass

*** Test Cases ***
Teacher Actions Validation
    Open Browser    ${URL}    ${BROWSER}
    Teacher Login
    Validate My Subjects Page
    Validate My Exam Dates Page
    Validate New Exam Dates Page
    Validate Set Evaluation Page
    Validate Evaluation Table Page
    Validate Other's Subjects Page
    Validate List of All Teachers Page
    [Teardown]    Close Browser

Student Actions Validation
    Open Browser    ${URL}    ${BROWSER}
    Student Login
    Validate Other Subjects Page
    [Teardown]    Close Browser

*** Keywords ***
Teacher Login
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${TEACHER_PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Student Login
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${STUDENT_PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Validate My Subjects Page
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${remove_buttons_disabled}=    Run Keyword And Return Status    Page Should Not Contain Element    xpath=//button[@id!="tea.mySubjects.table.unregisterSubjectButton-0" and @value="Remove" and not(@disabled)]
    Run Keyword Unless    ${remove_buttons_disabled}    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]

Validate My Exam Dates Page
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    xpath=//th[text()="Operating Systems"]

Validate New Exam Dates Page
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Not Contain    xpath=//option[text()="Operating Systems"]

Validate Set Evaluation Page
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Not Contain    xpath=//option[contains(text(), "Operating Systems")]

Validate Evaluation Table Page
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Page Should Not Contain    xpath=//option[text()="Operating Systems"]

Validate Other's Subjects Page
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Element Should Be Visible    xpath=//td[text()="Operating Systems"]

Validate List of All Teachers Page
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Page Should Not Contain    xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]

Validate Other Subjects Page
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Wait Until Page Contains    Operating Systems
    ${row}=    Get Webelement    xpath=//tr[td[contains(text(), "Operating Systems")]]
    ${content}=    Get Text    ${row}
    Should Not Contain    ${content}    Peter Strict