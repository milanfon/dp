*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student Enrollment
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text    //*[@id="loginPage.userNameInput"]    maroon
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Press Keys    //*[@id="loginPage.passwordInput"]    ENTER

    # Navigate to Other Subjects page
    Click Element    //*[@id="stu.menu.otherSubjects"]

    # Enroll in a subject
    Click Element    //*[@id="stu.otherSubjects.table.enrollButton-10"]

    # Check if enrollment success alert appears
    Wait Until Page Contains Element    //*[@id="stu.otherSubjects.successAlert"]    10s

    # Navigate to My Subjects page
    Click Element    //*[@id="stu.menu.mySubjects"]

    # Check if enrolled subject appears in My Subjects table
    ${subject_row}    Get Element    //tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
    ${subject_name}    Get Text    ${subject_row}    //td[text()="Software Quality Assurance"]
    ${teacher_name}    Get Text    ${subject_row}    //td[text()="Peter Strict"]
    Should Be Equal    ${subject_name}    Software Quality Assurance
    Should Be Equal    ${teacher_name}    Peter Strict

    Close Browser

Teacher Subject Check
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text    //*[@id="loginPage.userNameInput"]    strict
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Press Keys    //*[@id="loginPage.passwordInput"]    ENTER

    # Navigate to My Subjects page
    Click Element    //*[@id="tea.menu.mySubjects"]

    # Check if button has correct text
    ${button_text}    Get Text    //*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal    ${button_text}    Students (2)

    # Click button and check if student appears in the list
    Click Element    //*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Wait Until Page Contains Element    //td[text()="William Maroon"]    10s

    Close Browser