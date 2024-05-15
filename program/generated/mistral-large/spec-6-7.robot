*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Browser}        Chrome
${URL}            http://localhost:4680/tbuis/index.jsp
${Delay}          2s

*** Test Cases ***
Student Test
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    ${Delay}

    # Login as student
    Input Text    //*[@id="loginPage.userNameInput"]    maroon
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Button    //*[@id="loginPage.loginFormSubmit"]

    # Navigate to Other Subjects
    Click Element    //*[@id="stu.menu.otherSubjects"]

    # Enroll in a subject
    Click Element    //*[@id="stu.otherSubjects.table.enrollButton-10"]

    # Check success alert
    Wait Until Page Contains Element    //*[@id="stu.otherSubjects.successAlert"]    ${Delay}

    # Navigate to My Subjects
    Click Element    //*[@id="stu.menu.mySubjects"]

    # Check enrolled subject
    ${subject_row}    Set Variable    //tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td
    ${subject_name}    Set Variable    xpath=//td[text()='Software Quality Assurance']
    ${teacher_name}    Set Variable    xpath=//td[text()=' Peter Strict ']

    Page Should Contain Element    ${subject_row}
    Element Should Contain    ${subject_row}    ${subject_name}
    Element Should Contain    ${subject_row}    ${teacher_name}

    Close Browser

Teacher Test
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    ${Delay}

    # Login as teacher
    Input Text    //*[@id="loginPage.userNameInput"]    strict
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Button    //*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Subjects
    Click Element    //*[@id="tea.menu.mySubjects"]

    # Check button text
    ${button}    Set Variable    //*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    ${button_text}    Get Text    ${button}
    Should Be Equal    ${button_text}    Students (2)

    # Click button and check student's name
    Click Element    ${button}
    Page Should Contain Element    xpath=//td[text()='William Maroon']

    Close Browser