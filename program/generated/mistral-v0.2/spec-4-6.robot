*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***

*** Test Cases ***

@Setup
@Teardown
Setup And Teardown
    OpenBrowser
    Maximize Window
    Go To ${url}
    Sleep 5s

My Subjects Teacher Check
    [Document]    ${html} = Get Current Page Source
    ${success_alert} = Get Element Or None("id=tea.mySubjects.successAlert")
    ${title_element} = Get Element Or None("id=tea.mySubjects.enrolledTable.Title")

    ${students_text} = Get Text "${success_alert}"
    ${title_text} = Get Text "${title_element}"

    Should Be In String ${students_text} "Students (0)"
    Should Be In String ${title_text} "Enrolled Subjects"

    ${database_sys_element} = Get Element Or None("//td[contains(text(), 'Database Systems')]")

    Should Be None ${database_sys_element}

My Exam Dates Teacher Check
    ${participants_element} = Get Element Or None("id=tea.myExamDates.table.participantsButton-1")

    ${participants_text} = Get Text "${participants_element}"

    Should Be In String ${participants_text} "Participants (0/10)"

Set Evaluation Teacher Check
    ${no_one_student_element} = Get Element Or None("id=tea.setEvaluation.form.noOneStudent")

    Should Be Element ${no_one_student_element}

Evaluation Table Teacher Check
    ${no_students_element} = Get Element Or None("//td[contains(text(), 'No students on this exam date')]")

    Should Be Element ${no_students_element}

@Teardown
Teardown
    Close Browser

*** Keywords ***

Setup And Teardown
    ${url} = "http://localhost:4680/tbuis/index.jsp"

OpenBrowser
    Open Browser ${url}

TeacherLogin
    ${username} = "pedant"
    ${password} = "pass"

    Login To Application ${username} ${password}

Login To Application
    [Arguments]    ${username} ${password}
    ${username_element} = Get Element Or None("aria=Username")
    ${password_element} = Get Element Or None("aria=Password")

    Input Text ${username_element} ${username}
    Input Text ${password_element} ${password}
    Sleep 2s
    Keyboard SendKeys ${Keys.RETURN}

Go To
    [Arguments]    ${url}
    Open Browser ${url}

Logout
    Click Element ${Logout_button}

Keywords
    Logout_button  xpath=//*[@id="header.link.logout"]