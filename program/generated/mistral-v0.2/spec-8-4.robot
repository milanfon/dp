*** Settings ***
Library          SeleniumLibrary
Library          Collections

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:4680/tbuis/
${Teacher_URL}     http://localhost:4680/tbuis/index.jsp
${Delay}          4

*** Test Cases ***

Test Case        Student_Other_Exam_Dates
    [Documentation]    Test case for checking the presence of elements for Student

    Open Browser        ${URL}    ${BROWSER}

    *** Set Up ***

    [Documentation]    Login as Student

    Login
        Username        ${username}
        Password        ${password}

    *** Test ***

    [Documentation]    Click on Other Exam Dates

    Click Element
        Target Element    id=stu.menu.otherExamDates

    [Documentation]    Click on Register button and check for success alert

    Click Element
        Target Element    id=stu.otherExamDates.table.registerButton-2-0

    Wait Until Element Is Visible
        Element Is Visible    id=stu.otherExamDates.successAlert
        Timeout             ${Delay}s

    [Documentation]    Click on My Exam Dates

    Click Element
        Target Element    id=stu.menu.myExamDates

    [Documentation]    Check for the presence of text "Programming in Java"

    Element Should Contain
        Element        td
        Contain         text=Programming in Java

    [Documentation]    Close the browser

    Close Browser

Test Case        Teacher_My_Exam_Dates
    [Documentation]    Test case for checking the presence of text "Mia Orange" for Teacher

    Open Browser        ${Teacher_URL}    ${BROWSER}

    *** Set Up ***

    [Documentation]    Login as Teacher

    Login
        Username        ${teacher_username}
        Password        ${teacher_password}

    *** Test ***

    [Documentation]    Click on My Exam Dates

    Click Element
        Target Element    id=tea.menu.myExamDates

    [Documentation]    Check for the presence of text "Mia Orange"

    Element Should Contain
        Element        td
        Contain         text=Mia Orange

    [Documentation]    Close the browser

    Close Browser

*** Teardown ***

[Documentation]    Close browser after each test case

Close Browser