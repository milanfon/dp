Here's the Robot Framework script:

*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***

Teacher Test
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    # Login as teacher
    # Execute steps for teacher
    # Checks
    # On "Others' Subjects" page
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    # On "My Exam Dates" page
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.noRecords-2"]    No exam dates.
    # On "New Exam Dates" page
    Select From List By Value    xpath://*[@id="tea.newExamDates.subjectSelect"]    Linear Algebra
    # On "List of All Teachers" page
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Close Browser

Student Test
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    # Login as student
    # Execute steps for student
    # Checks
    # On "Other Subjects" page
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]
    Element Should Contain    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Close Browser

Note:

- The JSON recordings should be converted to Robot Framework keywords before using them in this script.
- The above script assumes you've already implemented keywords to handle JSON-based navigation.
- The script doesn't include delays as you've requested. If you need to insert delays between steps, you can add them using the `Sleep` keyword.
- Make sure to replace the selectors and the locator strategies (like xpath, id, etc.) as per the actual application's structure.