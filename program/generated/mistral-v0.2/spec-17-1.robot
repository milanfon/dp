*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
${URL}           http://localhost:4680/tbuis/index.jsp

*** Test Cases ***

Test Teacher Scenario
    [Documentation]        Test Teacher Scenario

    [Preparation]
    Set Viewport    1501    1104
    Set     TEACHER_USERNAME    pedant
    Set     TEACHER_PASSWORD    pass

    [Test]
    Navigate To URL    ${URL}
    Login    Login    TEACHER_USERNAME    TEACHER_PASSWORD

    ${otherSubjectsURL} =    Get Element    //*[@id="tea.menu.otherSubjects"]    text
    Navigate To URL    ${otherSubjectsURL}

    ${participateButton} =    Get Element    //*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Element    ${participateButton}

    ${isOnOthersSubjects} =    Get Element    //*[@id="tea.otherSubjects.successAlert"]
    Should Be Element Present    ${isOnOthersSubjects}

    ${myExamDatesURL} =    Get Element    //*[@id="tea.menu.myExamDates"]    text
    Navigate To URL    ${myExamDatesURL}

    ${myExamDatesTable} =    Get Element    //*[@id="tea.myExamDates.table"]
    ${noRecordsTR} =    Get Element From Table    //*[@id="tea.myExamDates.table"]    tr    index=2
    Should Contain    ${noRecordsTR}    No exam dates.

    ${newExamDatesURL} =    Get Element    //*[@id="tea.menu.newExamDates"]    text
    Navigate To URL    ${newExamDatesURL}

    ${linearAlgebraOption} =    Get Element    //*[@id="tea.newExamDates.form.subjectSelect"]    option
    Should Contain    ${linearAlgebraOption}    Linear Algebra

    ${listOfAllTeachersURL} =    Get Element    //*[@id="tea.menu.listOfAllTeachers"]    text
    Navigate To URL    ${listOfAllTeachersURL}

    ${teacherRow3} =    Get Element    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]
    ${linearAlgebra} =    Get Element From Table    //*[@id="tea.listOfAllTeachers.table"]    td
    Should Contain    ${linearAlgebra[2]}    Linear Algebra
    Should Contain    ${teacherRow3.children[1]}    Alice Pedant

Test Student Scenario
    [Documentation]        Test Student Scenario

    [Preparation]
    Set Viewport    1501    1104
    Set     STUDENT_USERNAME    yellow
    Set     STUDENT_PASSWORD    pass

    [Test]
    Navigate To URL    ${URL}
    Login    Login    STUDENT_USERNAME    STUDENT_PASSWORD

    ${otherSubjectsURL} =    Get Element    //*[@id="stu.menu.otherSubjects"]    text
    Navigate To URL    ${otherSubjectsURL}

    ${subjectRow2} =    Get Element    //*[@id="stu.otherSubjects.table.subjectRow-2"]
    ${subject2Subject} =    Get Element From Table    //*[@id="stu.otherSubjects.table"]    td
    Should Contain    ${subjectRow2.children[1]}    Linear Algebra
    Should Contain    ${subjectRow2.children[2]}    Alice Pedant

*** Teardown ***
Close Browser