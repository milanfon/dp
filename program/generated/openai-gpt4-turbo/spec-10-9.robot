*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${EMPTY}    Chrome
Suite Teardown    Close All Browsers

*** Variables ***
${BASE_URL}    http://localhost:4680/tbuis

*** Test Cases ***
Teacher Check Operating Systems Removal
    Open Teacher UI and Login
    Check My Subjects Page
    Check My Exam Dates Page
    Check New Exam Dates Page
    Check Set Evaluation Page
    Check Evaluation Table Page
    Check Others' Subjects Page
    Check List of All Teachers Page
    [Teardown]    Close Browser

Student Verify Absence of Peter Strict and Operating Systems Combination
    Open Student UI and Login
    Check Other Subjects Page for Peter Strict
    [Teardown]    Close Browser

*** Keywords ***
Open Teacher UI and Login
    Open Browser    ${BASE_URL}/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s

Check My Subjects Page
    ${status}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Run Keyword If    ${status}    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]

Check My Exam Dates Page
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//th[text()="Operating Systems"]

Check New Exam Dates Page
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//option[text()="Operating Systems"]

Check Set Evaluation Page
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Text Should Not Contain    xpath=//option    Operating Systems

Check Evaluation Table Page
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//option[text()="Operating Systems"]

Check Others' Subjects Page
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[text()="Operating Systems"]

Check List of All Teachers Page
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems

Open Student UI and Login
    Open Browser    ${BASE_URL}/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Check Other Subjects Page for Peter Strict
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    ${table_row}=    Get Webelement    xpath=//tr[contains(., "Operating Systems") and not(contains(., "Peter Strict"))]
    Element Should Be Visible    ${table_row}