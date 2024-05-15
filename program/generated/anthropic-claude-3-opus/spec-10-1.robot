*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Removes Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Click Element    xpath://a[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://input[@id="loginPage.userNameInput"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://input[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://button[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://a[@id="tea.menu.mySubjects"]
    Click Link    xpath://a[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath://button[contains(@id, "tea.mySubjects.table.unregisterSubjectButton")]
    Page Should Not Contain Element    xpath://button[contains(@id, "tea.mySubjects.table.unregisterSubjectButton")][not(@disabled)]
    Click Button    xpath://button[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Wait Until Page Contains Element    xpath://div[@id="tea.mySubjects.successAlert"]
    Click Link    xpath://a[@id="tea.menu.myExamDates"]  
    Page Should Not Contain Element    xpath://th[contains(text(), "Operating Systems")]
    Click Link    xpath://a[@id="tea.menu.newExamDates"]
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Link    xpath://a[@id="tea.menu.setEvaluation"]
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Link    xpath://a[@id="tea.menu.evaluationTable"]
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Link    xpath://a[@id="tea.menu.otherSubjects"]
    Page Should Contain Element    xpath://td[contains(text(), "Operating Systems")]
    Click Link    xpath://a[@id="tea.menu.listOfAllTeachers"]
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser
    
Student Checks Other Subjects
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window 
    Click Element    xpath://a[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://input[@id="loginPage.userNameInput"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://input[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://button[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://a[@id="stu.menu.otherSubjects"]  
    Click Link    xpath://a[@id="stu.menu.otherSubjects"]
    Page Should Not Contain Element    xpath://tr[contains(., "Operating Systems")]//td[contains(., "Peter Strict")]
    Close Browser