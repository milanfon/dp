*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    http://localhost:4680
${BROWSER}    Chrome

*** Test Cases ***
Student Enrollment
    Open Browser    ${BASE_URL}/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

    Input Text    //*[@id="loginPage.userNameInput"]    maroon
    Input Password    //*[@id="loginPage.passwordInput"]    pass
    Click Button    //*[@id="loginPage.loginFormSubmit"]

    Click Element    //*[@id="stu.menu.otherSubjects"]
    Click Element    //*[@id="stu.otherSubjects.table.enrollButton-10"]

    Wait Until Page Contains Element    //*[@id="stu.otherSubjects.successAlert"]    10s

    Click Element    //*[@id="stu.menu.mySubjects"]

    ${subject_row}    Set Variable    //tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
    ${subject_name}    Set Variable    //td[text()="Software Quality Assurance"]
    ${teacher_name}    Set Variable    //td[text()=" Peter Strict "]

    Wait Until Page Contains Element    ${subject_row}    10s
    Element Should Contain    ${subject_row}    ${subject_name}
    Element Should Contain    ${subject_row}    ${teacher_name}

    Close Browser

Teacher Login
    Open Browser    ${BASE_URL}/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

    Input Text    //*[@id="loginPage.userNameInput"]    strict
    Input Password    //*[@id="loginPage.passwordInput"]    pass
    Click Button    //*[@id="loginPage.loginFormSubmit"]

    Click Element    //*[@id="tea.menu.mySubjects"]

    ${button_id}    Set Variable    //*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    ${expected_text}    Set Variable    Students (2)

    Wait Until Page Contains Element    ${button_id}    10s
    ${actual_text}    Get Text    ${button_id}
    Should Be Equal    ${actual_text}    ${expected_text}

    Click Element    ${button_id}

    ${student_name}    Set Variable    //td[text()="William Maroon"]
    Wait Until Page Contains Element    ${student_name}    10s
    Element Should Be Visible    ${student_name}

    Close Browser