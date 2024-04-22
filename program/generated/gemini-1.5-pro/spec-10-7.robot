*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Test Teardown     Close Browser

*** Variables ***
${DELAY}          2

*** Keywords ***
Wait And Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${DELAY}
    Click Element    ${locator}
    Sleep    ${DELAY}

Login As Teacher
    Wait And Click Element    xpath://*[@id="header.link.login"]
    Wait And Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Wait And Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Wait And Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Login As Student
    Wait And Click Element    xpath://*[@id="header.link.login"]
    Wait And Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Wait And Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Wait And Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Open My Subjects
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait And Click Element    xpath://*[@id="tea.menu.mySubjects"]

Open My Exam Dates
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.myExamDates"]
    Wait And Click Element    xpath://*[@id="tea.menu.myExamDates"]

Open New Exam Dates
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.newExamDates"]
    Wait And Click Element    xpath://*[@id="tea.menu.newExamDates"]

Open Set Evaluation
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.setEvaluation"]
    Wait And Click Element    xpath://*[@id="tea.menu.setEvaluation"]

Open Evaluation Table
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.evaluationTable"]
    Wait And Click Element    xpath://*[@id="tea.menu.evaluationTable"]

Open Others' Subjects
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.otherSubjects"]
    Wait And Click Element    xpath://*[@id="tea.menu.otherSubjects"]

Open List of All Teachers
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Wait And Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]

Open Student Other Subjects
    Wait Until Page Contains Element    xpath://*[@id="stu.menu.otherSubjects"]
    Wait And Click Element    xpath://*[@id="stu.menu.otherSubjects"]

*** Test Cases ***
Remove Subject From My Subjects
    Login As Teacher
    Open My Subjects
    Page Should Contain    Remove
    ${removeButtons}=    Get Webelements    xpath://input[@value="Remove"]
    : FOR    ${button}    IN    @{removeButtons}
    \    Run Keyword Unless    ${button}[0] == ${removeButtons}[0]    Element Should Be Disabled    ${button}
    Wait And Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Page Should Contain Element    tea.mySubjects.successAlert

Check My Exam Dates
    Open My Exam Dates
    Page Should Not Contain Element    xpath://th[text()="Operating Systems"]

Check New Exam Dates
    Open New Exam Dates
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]

Check Set Evaluation
    Open Set Evaluation
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]

Check Evaluation Table
    Open Evaluation Table
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]

Check Other's Subjects
    Open Others' Subjects
    Page Should Contain Element    xpath://td[text()="Operating Systems"]

Check List of All Teachers
    Open List of All Teachers
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]

Check Student Other Subjects
    Login As Student
    Open Student Other Subjects
    Page Should Not Contain Element    xpath://tr[td[text()="Operating Systems"]]//td[contains(text(), "Peter Strict")] 
