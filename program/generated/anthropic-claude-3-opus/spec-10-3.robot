*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Click Element    xpath:///*[@id="header.link.login"]
    Click Element    xpath:///*[@id="loginPage.userNameInput"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath:///*[@id="tea.menu.mySubjects"]
    Page Should Contain Element    xpath:///*[@id="tea.mySubjects.table.unregisterSubjectButton-0" and @disabled]
    Click Element    xpath:///*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Wait Until Page Contains Element    xpath:///*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath:///*[@id="tea.menu.myExamDates"]
    Page Should Not Contain Element    xpath://th[contains(text(), "Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.newExamDates"]
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.setEvaluation"]
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.evaluationTable"]
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.otherSubjects"]
    Page Should Contain Element    xpath://td[contains(text(), "Operating Systems")]
    Click Element    xpath:///*[@id="tea.menu.listOfAllTeachers"]
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Click Element    xpath:///*[@id="header.link.login"]
    Click Element    xpath:///*[@id="loginPage.userNameInput"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath:///*[@id="stu.menu.otherSubjects"]
    ${rows}=    Get Element Count    xpath://tr[td[contains(text(), "Operating Systems")]]
    FOR    ${i}    IN RANGE    1    ${rows}+1
        Page Should Not Contain Element    xpath://tr[td[contains(text(), "Operating Systems")]][${i}]//td[contains(text(), "Peter Strict")]
    END
    Close Browser