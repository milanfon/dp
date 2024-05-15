*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${DELAY}      2s

*** Test Cases ***
Student Enrollment
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

    # Login as student
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # Navigate to Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]

    # Enroll in a subject
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]

    # Check enrollment success
    Wait Until Page Contains Element    xpath=//*[@id="stu.otherSubjects.successAlert"]

    # Navigate to My Subjects
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]

    # Check enrolled subject
    ${enrolled_subject}=    Get Text    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]
    Should Be Equal    ${enrolled_subject}    Software Quality Assurance

    ${enrolled_teacher}=    Get Text    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]
    Should Be Equal    ${enrolled_teacher}    Peter Strict

    Close Browser

Teacher Check
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

    # Login as teacher
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]

    # Check button text
    ${button_text}=    Get Text    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal    ${button_text}    Students (2)

    # Click the button
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]

    # Check student list
    ${student_name}=    Get Text    xpath=//td[text()="William Maroon"]
    Should Be Equal    ${student_name}    William Maroon

    Close Browser
