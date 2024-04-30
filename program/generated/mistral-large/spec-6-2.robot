*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    2s

*** Test Cases ***
Student Enrollment
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104

    # Steps to login as a student and enroll in a subject
    ...

    # On page "Other Subjects" after clicking on the Enroll button, check if element with id "stu.otherSubjects.successAlert" appears
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Wait Until Page Contains Element    xpath://*[@id="stu.otherSubjects.successAlert"]    ${DELAY}

    # On page "My Subjects" check if element <tr id="stu.mySubjects.enrolledTable.subjectRow-2"> with childs <td>Software Quality Assurance</td> and <td> Peter Strict </td>
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Page Should Contain Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]

    Close Browser

Teacher Verification
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104

    # Steps to login as a teacher
    ...

    # Button with id "tea.mySubjects.table.listOfStudentsButton-3" has text "Students (2) "
    ${button_text}    Get Text    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal    ${button_text}    Students (2)

    # After clicking on the button, <td> with text "William Maroon" appears
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Wait Until Page Contains Element    xpath://td[text()="William Maroon"]    ${DELAY}

    Close Browser
