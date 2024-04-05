*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}     5s

*** Test Cases ***

Teacher Test
    [Setup]    Open Browser    about:blank    ${BROWSER}
    [Teardown]    Close Browser

    # Teacher steps
    Go To    http://localhost:4680/tbuis/index.jsp
    Wait Until Element Is Visible    id:header.link.login
    Click Element    id:header.link.login
    # more steps here

    # Check steps
    # After clicking the "Participate" button
    # Check if we are still on the "Others' Subjects" page
    # Element with id "tea.otherSubjects.successAlert" is visible
    # On page "My Exam Dates" text "Linear Algebra" is present
    # Element with id "tea.myExamDates.table.noRecords-2" is visible with text "No exam dates."
    # Element with text "Linear Algebra" is visible in "New Exam Dates"
    # Element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3] contains text "Linear Algebra"
    # Element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2] contains text "Alice Pedant"

Student Test
    [Setup]    Open Browser    about:blank    ${BROWSER}
    [Teardown]    Close Browser

    # Student steps
    Go To    http://localhost:4680/tbuis/index.jsp
    Wait Until Element Is Visible    id:header.link.login
    Click Element    id:header.link.login
    # more steps here

    # Check steps
    # Element with path //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2] has text matching "Linear Algebra"
    # Element with path //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3] has text matching "Alice Pedant"