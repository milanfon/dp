*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Browser    about:blank    Chrome
Suite Teardown    Close All Browsers

*** Test Cases ***
Teacher Removes Subject
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${remove_buttons}    Get WebElements    xpath=//input[@value="Remove"]
    FOR    ${button}    IN    @{remove_buttons}[1:]
        Element Should Be Disabled    ${button}
    END
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.mySubjects.successAlert"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Page Should Not Contain Element    xpath=//th[contains(text(), "Operating Systems")]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Page Should Contain Element    xpath=//td[contains(text(), "Operating Systems")]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Page Should Not Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser

Student Checks Other Subjects
    Open Browser    about:blank    Chrome
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Page Should Not Contain Element    xpath=//tr[contains(., "Operating Systems") and contains(., "Peter Strict")]
    Close Browser