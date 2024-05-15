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
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Teacher
    Check Elements On Teacher Pages
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Student
    Check Element On Student Page
    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    id=loginPage.userNameInput    ${USERNAME}
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Button    id=loginPage.loginFormSubmit

Login As Student
    Input Text    id=loginPage.userNameInput    orange
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit

Check Elements On Teacher Pages
    Click Element    xpath=//*[text()='My Subjects']
    Sleep    1s
    ${disabled_buttons}=    Get WebElements    xpath://button[text()='Remove' and @disabled]
    Should Be True    ${disabled_buttons} != []
    Click Element    xpath=//button[text()='Remove']
    Sleep    1s
    Page Should Contain Element    id=tea.mySubjects.successAlert
    Sleep    1s

    Click Element    xpath=//*[text()='My Exam Dates']
    Sleep    1s
    Page Should Not Contain Element    xpath=//th[text()='${SUBJECT}']
    Sleep    1s

    Click Element    xpath=//*[text()='New Exam Dates']
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[text()='${SUBJECT}']
    Sleep    1s

    Click Element    xpath=//*[text()='Set Evaluation']
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[contains(text(), '${SUBJECT}')]
    Sleep    1s

    Click Element    xpath=//*[text()='Evaluation Table']
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[text()='${SUBJECT}']
    Sleep    1s

    Click Element    xpath=//*[text()="Others' Subjects"]
    Sleep    1s
    Page Should Contain Element    xpath=//td[text()='${SUBJECT}']
    Sleep    1s

    Click Element    xpath=//*[text()='List of All Teachers']
    Sleep    1s
    ${teacher_row}=    Get WebElement    xpath://tr[@id='tea.listOfAllTeachers.table.teacherRow-5']
    ${teacher_cells}=    Get WebElements    xpath=//td    parent=${teacher_row}
    FOR    ${cell}    IN    @{teacher_cells}
        ${text}=    Get Text    ${cell}
        Should Not Contain    ${text}    ${SUBJECT}
    END
    Sleep    1s

Check Element On Student Page
    Click Element    xpath//*[text()='Other Subjects']
    Sleep    1s
    ${subject_row}=    Get WebElement    xpath://td[text()='${SUBJECT}']/ancestor::tr
    ${teacher_cell}=    Get WebElement    xpath=//td[text()='${TEACHER}']    parent=${subject_row}
    Run Keyword And Ignore Error    Get Text    ${teacher_cell}
    Element Text Should Not Be    ${teacher_cell}    ${TEACHER}
    Sleep    1s
