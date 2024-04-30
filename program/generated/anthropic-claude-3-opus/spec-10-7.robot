*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    Chrome
${DELAY}    1

*** Test Cases ***
Teacher Removes Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath://a[@id='header.link.login']
    Input Text    xpath://input[@id='loginPage.userNameInput']    strict
    Input Text    xpath://input[@id='loginPage.passwordInput']    pass
    Click Element    xpath://button[@id='loginPage.loginFormSubmit']
    Sleep    ${DELAY}
    Click Element    xpath://a[@id='tea.menu.mySubjects']
    Sleep    ${DELAY}
    ${remove_buttons}=    Get WebElements    xpath://button[contains(@id, 'tea.mySubjects.table.unregisterSubjectButton')]
    FOR    ${button}    IN    @{remove_buttons}
        ${disabled}=    Get Element Attribute    ${button}    disabled
        Should Be Equal    ${disabled}    true
    END
    Click Element    xpath://button[@id='tea.mySubjects.table.unregisterSubjectButton-0']
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://div[@id='tea.mySubjects.successAlert']
    Sleep    ${DELAY}
    Click Element    xpath://a[@id='tea.menu.myExamDates']
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://th[text()='Operating Systems']
    Sleep    ${DELAY}
    Click Element    xpath://a[@id='tea.menu.newExamDates']
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://option[text()='Operating Systems']
    Sleep    ${DELAY}
    Click Element    xpath://a[@id='tea.menu.setEvaluation']
    Sleep    ${DELAY}
    Page Should Not Contain    Operating Systems
    Sleep    ${DELAY}
    Click Element    xpath://a[@id='tea.menu.evaluationTable']
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://option[text()='Operating Systems']
    Sleep    ${DELAY}
    Click Element    xpath://a[@id='tea.menu.otherSubjects']
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()='Operating Systems']
    Sleep    ${DELAY}
    Click Element    xpath://a[@id='tea.menu.listOfAllTeachers']
    Sleep    ${DELAY}
    Page Should Not Contain    xpath=//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']//td[contains(text(), 'Operating Systems')]
    Sleep    ${DELAY}
    Close Browser

Student Checks Removed Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window  
    Click Element    xpath://a[@id='header.link.login']
    Input Text    xpath://input[@id='loginPage.userNameInput']    orange
    Input Text    xpath://input[@id='loginPage.passwordInput']    pass
    Click Element    xpath://button[@id='loginPage.loginFormSubmit']
    Sleep    ${DELAY}
    Click Element    xpath://a[@id='stu.menu.otherSubjects']
    Sleep    ${DELAY}
    ${rows}=    Get WebElements    xpath=//table/tbody/tr
    FOR    ${row}    IN    @{rows}
        ${subject}=    Get Text    ${row}/td[1]
        ${teacher}=    Get Text    ${row}/td[2]
        Run Keyword If    'Operating Systems' in '''${subject}'''    Should Not Contain    ${teacher}    Peter Strict
    END
    Close Browser