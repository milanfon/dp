*** Settings ***
Library             SeleniumLibrary
Browser             Chrome

*** Variables ***
${RECORDING_TITLE_TEACHER}    spec 10 teacher
${RECORDING_TITLE_STUDENT}    spec 10 student

*** Test Cases ***

@${RECORDING_TITLE_TEACHER}
[Documentation]    Test case for teacher's scenario with provided recording

*** Setup ***
Set Up
    Open Browser

*** Teacher's Test ***
${TEACHER_MY_SUBJECTS}    My Subjects
    [Documentation]    Open My Subjects page
    Click Button    id=tea.menu.mySubjects

    ${IS_REMOVE_BUTTONS_DISABLED}    False
    [Documentation]    Check if all Remove buttons are disabled before clicking
    Click Button    id=tea.mySubjects.table.unregisterSubjectButton-0
    Sleep   5s
    ${IS_SUCCESS_ALERT_PRESENT}    False
    [Documentation]    Check if success alert is present after clicking Remove
    Click Element    id=tea.mySubjects.successAlert
    Sleep   5s
    ${IS_OPERATING_SYSTEM_TH_PRESENT_IN_MY_EXAM_DATES}    False
    [Documentation]    Check if Operating Systems <th> is not present in My Exam Dates
    Click Button    id=tea.menu.myExamDates
    Sleep   5s
    Click Element    xpath=//th[.='Operating Systems']
    Sleep   5s
    ${IS_OPERATING_SYSTEM_OPTION_NOT_PRESENT_IN_NEW_EXAM_DATES}    True
    [Documentation]    Check if Operating Systems <option> is not present in New Exam Dates
    Click Button    id=tea.menu.newExamDates
    Sleep   5s
    Click Element    xpath=//option[.='Operating Systems']
    Sleep   5s
    ${IS_OPERATING_SYSTEM_OPTION_NOT_PRESENT_IN_SET_EVALUATION}    True
    [Documentation]    Check if Operating Systems <option> is not present in Set Evaluation
    Click Button    id=tea.menu.setEvaluation
    Sleep   5s
    Click Element    xpath=//option[.='Operating Systems']
    Sleep   5s
    ${IS_OPERATING_SYSTEM_OPTION_NOT_PRESENT_IN_EVALUATION_TABLE}    True
    [Documentation]    Check if Operating Systems <option> is not present in Evaluation Table
    Click Button    id=tea.menu.evaluationTable
    Sleep   5s
    Click Element    xpath=//option[.='Operating Systems']
    Sleep   5s
    ${IS_OPERATING_SYSTEM_TD_PRESENT_IN_OTHER_SUBJECTS}    False
    [Documentation]    Check if Operating Systems <td> is present in Other Subjects
    Click Button    id=tea.menu.otherSubjects
    Sleep   5s
    Click Element    xpath=//td[.='Operating Systems']
    Sleep   5s
    ${IS_PETER_STRICT_NOT_PRESENT_IN_SAME_TR_IN_OTHER_SUBJECTS}    True
    [Documentation]    Check if there is no text value containing "Peter Strict" in the same <tr> as "Operating Systems"
    Click Button    id=tea.menu.listOfAllTeachers
    Sleep   5s
    Click Element    id=tea.listOfAllTeachers.table.teacherRow-5
    Sleep   5s
    Click Element    xpath=//td[.='Operating Systems']
    Sleep   5s
    Click Element    xpath=//td[.='']
    Sleep   5s
    Element Should Not Exist    xpath=//td[.='Peter Strict']

*** Tear Down ***
    Close Browser

*** Student's Test ***
${STUDENT_OTHER_SUBJECTS}    Other Subjects
    [Documentation]    Open Other Subjects page
    Click Button    id=stu.menu.otherSubjects

    ${IS_PETER_STRICT_NOT_PRESENT_IN_SAME_TR_IN_OTHER_SUBJECTS}    True
    [Documentation]    Check if there is no text value containing "Peter Strict" in the same <tr> as "Operating Systems"
    Sleep   5s
    Click Element    xpath=//td[.='Operating Systems']
    Sleep   5s
    Click Element    xpath=//td[.='']
    Sleep   5s
    Element Should Not Exist    xpath=//td[.='Peter Strict']

*** Teardown ***
    Close Browser

*** Cleanup ***
    Close Browser