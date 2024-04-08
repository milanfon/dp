*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${LOGIN_URL}    http://localhost:4680/tbuis/login
${BROWSER}    Chrome

*** Test Cases ***
Teacher spec
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    ${login_page}    Get Title
    Should Be Equal    ${login_page}    Login Page

    Input Text    id=loginPage.userNameInput    scatterbrained
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    Click Link    id=tea.menu.myExamDates
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    Click Button    id=tea.myExamDates.table.cancelButton-0-0
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    ${alert_present}    Get Alert Message
    Accept Alert
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    ${element_present}    Get Webelement    id=tea.myExamDates.successAlert
    Should Be Equal    ${element_present}    ${None}

    Click Link    id=tea.menu.setEvaluation
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    ${element_present}    Get Webelement    id=tea.setEvaluation.form.noRecords
    Should Be Equal    ${element_present}    ${None}

    Click Link    id=tea.menu.evaluationTable
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    Click Element    id=tea.evalTable.filter.subjectSelect
    ${subject_option}    Get Element Attribute    id=tea.evalTable.filter.subjectSelect    value
    Should Be Equal    ${subject_option}    -1
    Click Element    id=tea.evalTable.filter.subjectSelect
    Click Element    xpath=//option[@value='1202']
    Click Button    id=tea.evalTable.filter.submitButton
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    ${filter_text}    Get Text    id=tea.evalTable.filter.subjectSelect
    Should Be Equal    ${filter_text}    Computation Structures
    Close Browser

Student spec
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    ${login_page}    Get Title
    Should Be Equal    ${login_page}    Login Page
    Input Text    id=loginPage.userNameInput    orange
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Student's View
    Click Link    id=stu.menu.myExamDates
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Student's View
    ${title_text}    Get Text    id=stu.myExamDates.title
    Should Be Equal    ${title_text}    Exam Dates
    Close Browser