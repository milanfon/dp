*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    about:blank    ${BROWSER}
Test Teardown     Close Browser
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        chrome

*** Keywords ***
Login Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text      xpath://*[@id="loginPage.userNameInput"]     strict
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text      xpath://*[@id="loginPage.passwordInput"]     pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep            2s

Login Student
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text      xpath://*[@id="loginPage.userNameInput"]     orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text      xpath://*[@id="loginPage.passwordInput"]     pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep            2s

My Subjects Page
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep            2s

Remove Subject
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    ${remove_buttons}=    Get Webelements    xpath://input[@value="Remove"]
    FOR    ${button}    IN    @{remove_buttons}
        Element Should Be Disabled    ${button}
    END
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Sleep            2s

My Exam Dates Page
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep            2s
    Page Should Not Contain Element    xpath://th[text()="Operating Systems"]

New Exam Dates Page
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep            2s
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]

Set Evaluation Page
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep            2s
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]

Evaluation Table Page
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep            2s
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]

Other Subjects Page
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep            2s
    Page Should Contain Element    xpath://td[text()="Operating Systems"]

List of All Teachers Page
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep            2s
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]


*** Test Cases ***
Teacher Actions
    Go To    http://localhost:4680/tbuis/index.jsp
    Login Teacher
    My Subjects Page
    Remove Subject
    My Exam Dates Page
    New Exam Dates Page
    Set Evaluation Page
    Evaluation Table Page
    Other Subjects Page
    List of All Teachers Page

Student Actions
    Go To    http://localhost:4680/tbuis/index.jsp
    Login Student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep            2s
    Page Should Not Contain Element    xpath://tr[td[text()="Operating Systems"] and td[contains(text(), "Peter Strict")]] 
