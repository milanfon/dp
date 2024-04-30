*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text    xpath//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath//*[@id="loginPage.loginFormSubmit"]

    # Others' Subjects page
    Click Element    xpath//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath//*[@id="tea.otherSubjects.table.participateButton-3"]
    ${page_title}    Get Title
    Page Should Contain Element    xpath//*[@id="tea.otherSubjects.successAlert"]
    Should Be Equal    ${page_title}    Others' Subjects

    # My Exam Dates page
    Click Element    xpath//*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath//*[@id="tea.myExamDates.table.noRecords-2"]

    # New Exam Dates page
    Click Element    xpath//*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath//option[text()="Linear Algebra"]

    # List of All Teachers page
    Click Element    xpath//*[@id="tea.menu.listOfAllTeachers"]
    ${teacher_name}    Get Text    xpath//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]
    ${subject_name}    Get Text    xpath//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Should Be Equal    ${teacher_name}    Alice Pedant
    Should Be Equal    ${subject_name}    Linear Algebra

    Close Browser

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text    xpath//*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath//*[@id="loginPage.loginFormSubmit"]

    # Other Subjects page
    Click Element    xpath//*[@id="stu.menu.otherSubjects"]
    ${subject_name}    Get Text    xpath//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    ${teacher_name}    Get Text    xpath//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]
    Should Be Equal    ${subject_name}    Linear Algebra
    Should Be Equal    ${teacher_name}    Alice Pedant

    Close Browser