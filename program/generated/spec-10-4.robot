*** Settings ***
Documentation     This is a test scenario for navigating and performing checks in a university information system.
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Open University Information System And Perform Checks
    Open Browser And Navigate To Login
    Perform Teacher Actions And Checks
    Perform Student Actions And Checks

*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}

Perform Teacher Actions And Checks
    # Login as teacher
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

    # Navigate to "My Subjects" and perform checks
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    ${buttons_disabled}=    Run Keyword And Return Status    Page Should Not Contain Element    xpath=//button[@value="Remove" and not(@disabled)]
    Run Keyword If    ${buttons_disabled}    Log    All "Remove" buttons are disabled before clicking.
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Wait Until Element Is Visible    xpath=//*[@id="tea.mySubjects.successAlert"]

    # Check "My Exam Dates"
    Check Page For Absence Of Element With Text    tea.menu.myExamDates    <th>    Operating Systems

    # Check "New Exam Dates"
    Check Page For Absence Of Element With Text    tea.menu.newExamDates    <option>    Operating Systems

    # Check "Set Evaluation"
    Check Page For Absence Of Element Containing Text    tea.menu.setEvaluation    <option>    Operating Systems

    # Check "Evaluation Table"
    Check Page For Absence Of Element With Text    tea.menu.evaluationTable    <option>    Operating Systems

    # Check "Other's Subjects"
    Check Page For Presence Of Element With Text    tea.menu.otherSubjects    <td>    Operating Systems

    # Check "List of All Teachers"
    Check Row For Absence Of Element Containing Text    tea.menu.listOfAllTeachers    tea.listOfAllTeachers.table.teacherRow-5    Operating Systems

Perform Student Actions And Checks
    # Log in as student
    [Teardown]    Close Browser
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

    # Navigate to "Other Subjects" and check for absence of "Peter Strict" in same row as "Operating Systems"
    Check Row For Absence Of Element Containing Text    stu.menu.otherSubjects    //tr[contains(.,'Operating Systems')]    Peter Strict

*** Keywords ***
Check Page For Absence Of Element With Text
    [Arguments]    ${page_element_id}    ${element_tag}    ${text}
    Click Element    xpath=//*[@id="${page_element_id}"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath=//${element_tag}[contains(text(), '${text}')]

Check Page For Presence Of Element With Text
    [Arguments]    ${page_element_id}    ${element_tag}    ${text}
    Click Element    xpath=//*[@id="${page_element_id}"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//${element_tag}[contains(text(), '${text}')]

Check Row For Absence Of Element Containing Text
    [Arguments]    ${page_element_id}    ${row_id}    ${text}
    Click Element    xpath=//*[@id="${page_element_id}"]
    Sleep    ${DELAY}
    ${is_present}=    Run Keyword And Return Status    Element Should Contain    xpath=//*[@id="${row_id}"]    ${text}
    Run Keyword If    not ${is_present}    Log    Text "${text}" is not present in row with ID "${row_id}".
