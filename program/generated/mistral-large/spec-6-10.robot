*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student Enrollment
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text    xpath=//input[@id='loginPage.userNameInput']    maroon
    Input Password    xpath=//input[@id='loginPage.passwordInput']    pass
    Click Button    xpath=//button[@id='loginPage.loginFormSubmit']

    # Navigate to Other Subjects
    Click Element    xpath=//a[@id='stu.menu.otherSubjects']

    # Enroll in a subject
    Click Element    xpath=//button[@id='stu.otherSubjects.table.enrollButton-10']

    # Check enrollment success
    Wait Until Page Contains Element    xpath=//*[@id='stu.otherSubjects.successAlert']    10s

    # Navigate to My Subjects
    Click Element    xpath=//a[@id='stu.menu.mySubjects']

    # Check enrolled subject
    ${enrolled_subject}=    Get Text    xpath=//tr[@id='stu.mySubjects.enrolledTable.subjectRow-2']/td[1]
    Should Be Equal    ${enrolled_subject}    Software Quality Assurance

    ${enrolled_teacher}=    Get Text    xpath=//tr[@id='stu.mySubjects.enrolledTable.subjectRow-2']/td[2]
    Should Be Equal    ${enrolled_teacher}    Peter Strict

    Close Browser

Teacher Subject Check
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text    xpath=//input[@id='loginPage.userNameInput']    strict
    Input Password    xpath=//input[@id='loginPage.passwordInput']    pass
    Click Button    xpath=//button[@id='loginPage.loginFormSubmit']

    # Navigate to My Subjects
    Click Element    xpath=//a[@id='tea.menu.mySubjects']

    # Check button text
    ${button_text}=    Get Text    xpath=//button[@id='tea.mySubjects.table.listOfStudentsButton-3']
    Should Be Equal    ${button_text}    Students (2)

    # Click button and check student list
    Click Element    xpath=//button[@id='tea.mySubjects.table.listOfStudentsButton-3']
    Wait Until Page Contains Element    xpath=//td[text()='William Maroon']    10s

    Close Browser
