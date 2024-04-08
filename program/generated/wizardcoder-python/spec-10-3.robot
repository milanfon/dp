*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680    Chrome
    Login Teacher
    Teacher Scenario Steps
    Close Browser

*** Keywords ***
Login Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Teacher Scenario Steps
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    # Check if other Remove buttons are disabled
    Elements Should Be Disabled    xpath://*[@id="tea.mySubjects.table"]//button[.="Remove"]
    Click Element    xpath://*[@id="tea.mySubjects.table.removeSubjectButton-0"]
    Sleep    1s
    Element Should Be Visible    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Page Should Not Contain Element    xpath://*//th[.="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Page Should Not Contain Element    xpath://*//option[.="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Page Should Not Contain Element    xpath://*//option[.="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Page Should Not Contain Element    xpath://*//option[.="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Page Should Contain Element    xpath://*//td[.="Operating Systems"]
    Page Should Not Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[.="Operating Systems"]