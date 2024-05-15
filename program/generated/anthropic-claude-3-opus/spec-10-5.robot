*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Removes Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Page Should Not Contain Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-1" and @disabled]
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]  
    Page Should Not Contain Element    xpath=//th[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Page Should Contain Element    xpath=//td[contains(text(), "Operating Systems")] 
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Page Should Not Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser
    
Student Checks Removed Subject  
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange  
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Page Should Not Contain    Peter Strict    limit=//tr[td[contains(text(), "Operating Systems")]]
    Close Browser