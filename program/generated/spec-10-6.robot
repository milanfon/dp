*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To LoginPage
Suite Teardown    Close All Browsers
Test Setup        Navigate To LoginPage
Test Teardown     Close Browser
Force Tags        teacher

*** Variables ***
${BROWSER}        Chrome
${DELAY}          1s
${BASE_URL}       http://localhost:4680/tbuis
${LOGIN_PAGE}     ${BASE_URL}/login
${TEACHER_USERNAME}    strict
${TEACHER_PASSWORD}    pass

*** Test Cases ***
Verify Teacher Functionalities
    [Tags]    VerifyMySubjects
    Perform Login    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Go To My Subjects
    Verify All Remove Buttons Are Disabled Except First
    Click And Verify Removal
    Verify Absence Of Operating Systems In My Exam Dates
    Verify Absence Of Operating Systems In New Exam Dates
    Verify Absence Of Operating Systems In Set Evaluation
    Verify Absence Of Operating Systems In Evaluation Table
    Verify Presence Of Operating Systems In Others Subjects
    Verify Absence Of Operating Systems In List Of All Teachers

*** Keywords ***
Open Browser To LoginPage
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Navigate To LoginPage
    Go To    ${LOGIN_PAGE}

Perform Login
    [Arguments]    ${username}    ${password}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Go To My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s

Verify All Remove Buttons Are Disabled Except First
    ${status}=    Run Keyword And Return Status    Element Should Be Disabled    xpath=//button[@value="Remove" and not(@id="tea.mySubjects.table.unregisterSubjectButton-0")]
    Should Be True    ${status}

Click And Verify Removal
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]

Verify Absence Of Operating Systems In My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//th[contains(text(), "Operating Systems")]

Verify Absence Of Operating Systems In New Exam Dates
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]

Verify Absence Of Operating Systems In Set Evaluation
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]

Verify Absence Of Operating Systems In Evaluation Table
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]

Verify Presence Of Operating Systems In Others Subjects
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(), "Operating Systems")]

Verify Absence Of Operating Systems In List Of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Page Should Not Contain Element    xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
