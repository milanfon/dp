*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Cases ***

# Scenario 1: Check teacher's actions on "My Subjects" page
My Subjects Teacher
    [Document]    url=http://localhost:4680/tbuis/teacher-view/mySubjects

    [Teardown]    Close Browser

    [Before All]    ${teacher_subjects_page}=    Get Element    id=tea.mySubjects.table

    [Step]    Wait Until Element Is Visible
    ${remove_button_0}=    Get Element    id=tea.mySubjects.table.unregisterSubjectButton-0

    [Step]    Wait Until Element Is Visible
    ${remove_button_1}=    Get Element    id=tea.mySubjects.table.unregisterSubjectButton-1

    [Step]    ${remove_button_0_disabled}=    Get Attribute    ${remove_button_0}    disabled
    ${remove_button_1_disabled}=    Get Attribute    ${remove_button_1}    disabled

    [Step]    ${remove_button_0_disabled_should_be_true}=    Should Be True    ${remove_button_0_disabled}
    ${remove_button_1_disabled_should_be_true}=    Should Be True    ${remove_button_1_disabled}

    [Step]    Click Element    ${remove_button_0}

    [Step]    Wait Until Element Is Visible
    ${success_alert}=    Get Element    id=tea.mySubjects.successAlert

    [Step]    ${success_alert_should_be_visible}=    Should Be Visible    ${success_alert}

# Scenario 2: Check student's actions on "Other Subjects" page
Other Subjects Student
    [Document]    url=http://localhost:4680/tbuis/student-view/otherSubjects

    [Teardown]    Close Browser

    [Before All]    ${student_other_subjects_page}=    Get Element    id=stu.otherSubjects.table

    [Step]    ${peter_strict_row}=    Get Element    xpath=//tr[.//td[.='Operating Systems']]/following-sibling::tr[1]

    [Step]    ${peter_strict_row_text}=    Get Text    ${peter_strict_row}

    [Step]    ${peter_strict_text_should_not_contain}=    Should Not Contain    ${peter_strict_row_text}    Peter Strict