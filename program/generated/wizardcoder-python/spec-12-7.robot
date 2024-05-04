### Scenario: spec 12 teacher


*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_PAGE_URL}        http://localhost:4680/tbuis/login
${LOGIN_USER}          scatterbrained
${LOGIN_PASS}         pass
${LOGIN_USER_STUDENT}   orange
${LOGIN_PASS_STUDENT}  pass
${BROWSER}            Chrome

*** Keywords ***
Open Browser
    [Arguments]    ${url}
    Open Browser    ${url}    browser=${BROWSER}

Login
    [Arguments]    ${username}    ${password}
    Input Text    id=loginPage.userNameInput    ${username}
    Input Text    id=loginPage.passwordInput    ${password}
    Click Element    id=loginPage.loginFormSubmit


*** Test Cases ***
Teacher
    [Tags]    teacher
    [Setup]    Open Browser    ${LOGIN_PAGE_URL}
    Login    ${LOGIN_USER}    ${LOGIN_PASS}
    Wait Until Page Contains    Teacher's View
    Click Element    aria=My Exam Dates
    Wait Until Page Contains    Exam Dates
    Click Element    aria=Set Evaluation
    Wait Until Page Contains    Teacher's View
    Click Element    aria=Evaluation Table
    Wait Until Page Contains    Evaluation Table
    Click Element    aria=Subject
    Wait Until Page Contains    Select a subject
    Select From List    id=tea.evalTable.filter.subjectSelect    -1
    Click Element    aria=Filter
    Wait Until Page Contains    Teacher's View
    Click Element    aria=X
    Wait Until Page Contains    Teacher's View
    Wait Until Page Contains    Exam dates cancelled
    Click Element    aria=X
    Wait Until Page Contains    Teacher's View
    Page Should Contain Element    id=tea.myExamDates.successAlert
    Click Element    aria=Set Evaluation
    Wait Until Page Contains    Teacher's View
    Page Should Contain Element    id=tea.setEvaluation.form.noRecords
    Close Browser

Student
    [Tags]    student
    [Setup]    Open Browser    ${LOGIN_PAGE_URL}
    Login    ${LOGIN_USER_STUDENT}    ${LOGIN_PASS_STUDENT}
    Wait Until Page Contains    Student's View
    Click Element    aria=My Exam Dates
    Wait Until Page Contains    Exam Dates
    Page Should Not Contain    Computation Structures
    Close Browser

### Explanation:

This test suite consists of two test cases: Teacher and Student. Both test cases use the SeleniumLibrary. In the Teacher test case, we open the login page, login and perform the steps from the JSON recording. We use the keywords and variables from the JSON recording, and we add the necessary keywords and variables to perform the necessary actions. We use the Wait Until Page Contains and Page Should Contain Element keywords to check the expected texts and elements. We add the Close Browser keyword to close the browser after the test case is done. In the Student test case, we perform the same steps, but we check if the Computation Structures text is not present. We use the same keywords and variables, but the steps are different. We use the Close Browser keyword to close the browser after the test case is done. We use the tags to differentiate the test cases. We use the same browser, but we can use different browsers by changing the BROWSER variable. We can also add more test cases to the test suite by copying the Teacher test case and changing the tags and the login credentials. 