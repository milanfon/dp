*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Cases ***

# Scenario 1: Test for teacher's actions

[Tea Scenario]
Test My Subjects Removal
    Open Browser
    *** Wait ***
    ${delay}= 1s
    Sleep ${delay}

    ${page_title_1}= Get Title
    Should Be ${page_title_1} Equal To "University information system"

    ${username}= Get Element #loginPage.userNameInput
    ${password}= Get Element #loginPage.passwordInput

    Input Text ${username} "strict"
    Input Text ${password} "pass"

    Click Element #loginPage.loginFormSubmit
    *** Wait ***
    ${delay}= 1s
    Sleep ${delay}

    ${page_title_2}= Get Title
    Should Be ${page_title_2} Equal To "Teacher's View"

    Click Element #tea.menu.mySubjects
    *** Wait ***
    ${delay}= 1s
    Sleep ${delay}

    ${remove_buttons}= Get Elements #tea.mySubjects.table.unregisterSubjectButton
    ${remove_buttons_len}= Length ${remove_buttons}

    For ${i} In Range ${remove_buttons_len}
        ${button_i}= Get Element #tea.mySubjects.table.unregisterSubjectButton-${i}
        ${disabled}= Get Element Attribute ${button_i} disabled
        Should Be ${disabled} Equal To "false"
        Should Be Text Element #tea.mySubjects.table.unregisterSubjectButton-${i} Contain "Remove"

        Click Element #tea.mySubjects.table.unregisterSubjectButton-${i}
        *** Wait ***
        ${delay}= 1s
        Sleep ${delay}

        ${success_alert}= Get Element #tea.mySubjects.successAlert
        Should Be Element ${success_alert} Present

        Click Element #tea.menu.mySubjects
        *** Wait ***
        ${delay}= 1s
        Sleep ${delay}

        ${page_title_3}= Get Title
        Should Be ${page_title_3} Equal To "Teacher's View"

        Click Element #tea.menu.myExamDates
        *** Wait ***
        ${delay}= 1s
        Sleep ${delay}

        ${th_operating_systems}= Get Element #tea.examDates.table.th[.//text()="Operating Systems"]
        Should Be Element ${th_operating_systems} Not Present

        Click Element #tea.menu.newExamDates
        *** Wait ***
        ${delay}= 1s
        Sleep ${delay}

        ${option_operating_systems}= Get Element #tea.newExamDates.option[.//text()="Operating Systems"]
        Should Be Element ${option_operating_systems} Not Present

        Click Element #tea.menu.setEvaluation
        *** Wait ***
        ${delay}= 1s
        Sleep ${delay}

        ${option_operating_systems_set_evaluation}= Get Element #tea.setEvaluation.option[.//*[.//text()="Operating Systems"]]
        Should Be Element ${option_operating_systems_set_evaluation} Not Present

        Click Element #tea.menu.evaluationTable
        *** Wait ***
        ${delay}= 1s
        Sleep ${delay}

        ${option_operating_systems_evaluation_table}= Get Element #tea.evaluationTable.option[.//*[.//text()="Operating Systems"]]
        Should Be Element ${option_operating_systems_evaluation_table} Not Present

        Click Element #tea.menu.otherSubjects
        *** Wait ***
        ${delay}= 1s
        Sleep ${delay}

        ${page_title_4}= Get Title
        Should Be ${page_title_4} Equal To "Teacher's View"

        ${td_operating_systems}= Get Element #tea.otherSubjects.table.td[.//text()="Operating Systems"]
        Should Be Element ${td_operating_systems} Present

        Click Element #tea.menu.listOfAllTeachers
        *** Wait ***
        ${delay}= 1s
        Sleep ${delay}

        ${page_title_5}= Get Title
        Should Be ${page_title_5} Equal To ""

        ${teacher_row_5}= Get Element #tea.listOfAllTeachers.table.tr[1][.//*[.//text()="5"]]
        ${td_operating_systems_teacher_row_5}= Get Element #tea.listOfAllTeachers.table.td[.//text()="Operating