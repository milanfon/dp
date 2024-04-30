*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://a[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://input[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Input Password    xpath://input[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Button    xpath://input[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://a[@id="tea.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath://input[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Page Should Contain Element    xpath://input[@id="tea.mySubjects.table.unregisterSubjectButton-1"]
    Page Should Contain Element    xpath://input[@id="tea.mySubjects.table.unregisterSubjectButton-2"]
    Element Should Be Disabled    xpath://input[@id="tea.mySubjects.table.unregisterSubjectButton-1"]
    Element Should Be Disabled    xpath://input[@id="tea.mySubjects.table.unregisterSubjectButton-2"]
    Click Button    xpath://input[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Page Should Contain Element    xpath://div[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://a[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath://th[contains(text(), 'Operating Systems')]
    Click Element    xpath://a[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Not Contain Element    xpath://option[contains(text(), 'Operating Systems')]
    Click Element    xpath://a[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Not Contain Element    xpath://option[contains(text(), 'Operating Systems')]
    Click Element    xpath://a[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Page Should Not Contain Element    xpath://option[contains(text(), 'Operating Systems')]
    Click Element    xpath://a[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Page Should Contain Element    xpath://td[contains(text(), 'Operating Systems')]
    Click Element    xpath://a[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Not Contain    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window 
    Sleep    2s
    Click Element    xpath://a[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://input[@id="loginPage.userNameInput"]    orange  
    Sleep    2s
    Input Password    xpath://input[@id="loginPage.passwordInput"]    pass
    Sleep    2s  
    Click Button    xpath://input[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://a[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Page Should Not Contain    Peter Strict
    Page Should Not Contain Element    xpath://tr[contains(., 'Operating Systems') and contains(., 'Peter Strict')]
    Close Browser