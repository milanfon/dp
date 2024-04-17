*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost:4680/tbuis/index.jsp
${USERNAME}  strict
${PASSWORD}  pass
${SUBJECT}  Operating Systems
${TEACHER}  Peter Strict

*** Test Cases ***
Teacher Scenario
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

    # Login
    Input Text  id=loginPage.userNameInput  ${USERNAME}
    Input Text  id=loginPage.passwordInput  ${PASSWORD}
    Click Button  id=loginPage.loginFormSubmit

    # My Subjects
    Click Link  link=My Subjects
    ${remove_buttons}=  Get WebElements  xpath=//button[contains(text(), 'Remove') and not(@disabled)]
    Should Be Equal  ${remove_buttons}  1
    Click Button  id=tea.mySubjects.table.unregisterSubjectButton-0
    Wait Until Page Contains Element  id=tea.mySubjects.successAlert

    # My Exam Dates
    Click Link  link=My Exam Dates
    ${header}=  Get Text  xpath=//th[contains(text(), '${SUBJECT}')]
    Should Not Be True  '${SUBJECT}' in ${header}

    # New Exam Dates
    Click Link  link=New Exam Dates
    ${option}=  Get Text  xpath=//option[contains(text(), '${SUBJECT}')]
    Should Not Be True  '${SUBJECT}' in ${option}

    # Set Evaluation
    Click Link  link=Set Evaluation
    ${option}=  Get Text  xpath=//option[contains(text(), '${SUBJECT}')]
    Should Not Be True  '${SUBJECT}' in ${option}

    # Evaluation Table
    Click Link  link=Evaluation Table
    ${option}=  Get Text  xpath=//option[contains(text(), '${SUBJECT}')]
    Should Not Be True  '${SUBJECT}' in ${option}

    # Others' Subjects
    Click Link  link=Others' Subjects
    ${cell}=  Get Text  xpath=//td[contains(text(), '${SUBJECT}')]
    Should Be True  '${SUBJECT}' in ${cell}

    # List of All Teachers
    Click Link  link=List of All Teachers
    ${cell}=  Get Text  xpath=//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']/td
    Should Not Be True  '${SUBJECT}' in ${cell}

    Close Browser

Student Scenario
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

    # Login
    Input Text  id=loginPage.userNameInput  orange
    Input Text  id=loginPage.passwordInput  pass
    Click Button  id=loginPage.loginFormSubmit

    # Others' Subjects
    Click Link  link=Other Subjects
    ${row}=  Get Text  xpath=//tr[contains(., '${SUBJECT}') and contains(., '${TEACHER}')]
    Should Not Be True  '${TEACHER}' in ${row}

    Close Browser