*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Removes Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath:///*[@id="loginPage.userNameInput"]
    Click Element    xpath:///*[@id="loginPage.userNameInput"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath:///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.menu.mySubjects"]
    Click Element    xpath:///*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    ${remove_buttons}=    Get WebElements    xpath://input[@value="Remove"]
    ${disabled_count}=    Set Variable    0
    FOR    ${button}    IN    @{remove_buttons}
        ${is_disabled}=    Get Element Attribute    ${button}    disabled
        IF    '${is_disabled}' == 'true'
            ${disabled_count}=    Evaluate    ${disabled_count} + 1
        END
    END
    Should Be Equal As Integers    ${disabled_count}    ${1}
    Click Button    xpath:///*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.mySubjects.successAlert"]
    Page Should Contain Element    xpath:///*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath:///*[@id="tea.menu.myExamDates"]
    Wait Until Page Does Not Contain Element    xpath://th[contains(text(),"Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.newExamDates"]
    Page Should Not Contain Element    xpath://option[contains(text(),"Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.setEvaluation"]
    Page Should Not Contain Element    xpath://option[contains(text(),"Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.evaluationTable"]
    Page Should Not Contain Element    xpath://option[contains(text(),"Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.otherSubjects"]
    Page Should Contain Element    xpath://td[contains(text(),"Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.listOfAllTeachers"]
    ${teacher_row}=    Get WebElement    xpath:///*[@id="tea.listOfAllTeachers.table.teacherRow-5"]
    ${teacher_row_text}=    Get Text    ${teacher_row}
    Should Not Contain    ${teacher_row_text}    Operating Systems
    Close Browser

Student Checks Other Subjects
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath:///*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath:///*[@id="loginPage.userNameInput"]
    Click Element    xpath:///*[@id="loginPage.userNameInput"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath:///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath:///*[@id="stu.menu.otherSubjects"]
    Click Element    xpath:///*[@id="stu.menu.otherSubjects"]
    ${subject_row}=    Get WebElement    xpath://tr[contains(., "Operating Systems")]
    ${subject_row_text}=    Get Text    ${subject_row}
    Should Not Contain    ${subject_row_text}    Peter Strict
    Close Browser