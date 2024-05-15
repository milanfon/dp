*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
URL             http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Test Case         Teacher Scenario
    [Documentation]         This scenario opens the page and checks certain elements

    [Preparation]
    Set Viewport            1501   1104
    Set     ChromeOptions     args=["--disable-infobars"]

    [Actions]
    Navigate To             ${URL}
    Click Element             aria/Login
    Input Text             userNameInput             pedant
    Click Element             aria/Password
    Input Text             passwordInput             pass
    Click Element             aria/Login[role="button"]

    [Conditions]
    Wait Until Element Is Visible             id=tea.otherSubjects.successAlert
    Should Be Visible             id=tea.otherSubjects.successAlert

    [Actions]
    Go To             http://localhost:4680/tbuis/teacher-view/otherSubjects

    [Conditions]
    Should Contain             id=tea.myExamDates.table.noRecords-2         text=No exam dates.
    Should Contain             xpath=//tr[@id="tea.myExamDates.table.noRecords-2"]/td[2]         text=Linear Algebra

    [Actions]
    Go To             http://localhost:4680/tbuis/teacher-view/newExamDates

    [Conditions]
    Should Contain             id=tea.newExamDates.table.subjectOption-0         text=Linear Algebra

    [Actions]
    Go To             http://localhost:4680/tbuis/teacher-view/listOfAllTeachers

    [Conditions]
    Should Contain             xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]         text=Linear Algebra
    Should Contain             xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]         text=Alice Pedant

*** Test Case ***
Test Case         Student Scenario
    [Documentation]         This scenario opens the page and checks certain elements

    [Preparation]
    Set Viewport            1501   1104

    [Actions]
    Navigate To             ${URL}

    [Actions]
    Click Element             aria/Login

    [Actions]
    Input Text             userNameInput             yellow
    Input Text             passwordInput             pass
    Click Element             aria/Login[role="button"]

    [Conditions]
    Should Contain             xpath=//tr[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]         text=Linear Algebra
    Should Contain             xpath=//tr[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]         text=Alice Pedant

*** Teardown ***
Close Browser