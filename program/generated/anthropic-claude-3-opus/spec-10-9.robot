*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${remove_buttons}=    Get WebElements    xpath://input[@value="Remove"]
    FOR    ${button}    IN    @{remove_buttons}[1:]
        Element Should Be Disabled    ${button}
    END
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath://th[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Page Should Contain Element    xpath://td[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    ${rows}=    Get WebElements    xpath://tr[td[contains(text(), "Operating Systems")]]
    FOR    ${row}    IN    @{rows}
        Element Should Not Contain    ${row}    Peter Strict
    END
    Close Browser