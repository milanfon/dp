*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${USERNAME}    strict
${PASSWORD}    pass
${SUBJECT}    Operating Systems
${TEACHER}    Peter Strict

*** Test Cases ***
Teacher Operations
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=loginPage.userNameInput    ${USERNAME}
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Button    id=loginPage.loginFormSubmit

    # My Subjects page
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    ${remove_buttons}    Get WebElements    xpath=//button[contains(text(), 'Remove') and not(@disabled)]
    Should Be Equal    ${remove_buttons}    1
    Click Element    xpath=//button[contains(text(), 'Remove')]
    Wait Until Page Contains Element    id=tea.mySubjects.successAlert    10s
    Should Be Visible    id=tea.mySubjects.successAlert

    # My Exam Dates page
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    ${header}    Get Text    xpath=//th[contains(text(), '${SUBJECT}')]
    Should Be Empty    ${header}

    # New Exam Dates page
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    ${option}    Get Text    xpath=//option[contains(text(), '${SUBJECT}')]
    Should Be Empty    ${option}

    # Set Evaluation page
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    ${option}    Get Text    xpath=//option[contains(text(), '${SUBJECT}')]
    Should Be Empty    ${option}

    # Evaluation Table page
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    ${option}    Get Text    xpath=//option[contains(text(), '${SUBJECT}')]
    Should Be Empty    ${option}

    # Others' Subjects page
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    ${subject}    Get Text    xpath=//td[contains(text(), '${SUBJECT}')]
    Should Not Be Empty    ${subject}

    # List of All Teachers page
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    ${teacher}    Get Text    xpath=//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']//td[contains(text(), '${SUBJECT}')]
    Should Be Empty    ${teacher}
    Close Browser

Student Operations
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=loginPage.userNameInput    orange
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit

    # Others' Subjects page
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    ${teacher_in_subject}    Get Text    xpath=//tr[contains(., '${SUBJECT}') and contains(., '${TEACHER}')]
    Should Be Empty    ${teacher_in_subject}
    Close Browser
