*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Open Browser To Login Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    browser=chrome    desired_capabilities=chrome    alias=tbuis
    Maximize Browser Window

Login
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]


Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]


Check All Elements
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Page Should Not Contain Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Page Should Not Contain    Operating Systems

    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Page Should Not Contain    Operating Systems

    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Page Should Not Contain Element    xpath://*[@id="tea.newExamDates.form.subject"]//*[contains(text(), 'Operating Systems')]

    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Page Should Not Contain Element    xpath://*[@id="tea.setEvaluation.form.subject"]//*[contains(text(), 'Operating Systems')]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Page Should Not Contain    Operating Systems

    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Page Should Contain Element    xpath://*[contains(text(), 'Operating Systems')]
    Page Should Not Contain Element    xpath://*[contains(text(), 'Operating Systems')]//following-sibling::td[contains(text(), 'Peter Strict')]
    Page Should Not Contain Element    xpath://*[contains(text(), 'Operating Systems')]//following-sibling::td[contains(text(), 'Peter Strict')]
    Page Should Not Contain Element    xpath://*[contains(text(), 'Operating Systems')]//following-sibling::td[contains(text(), 'Peter Strict')]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain    Operating Systems

    Click Element    xpath://*[@id="tea.menu.logout"]
    Close Browser

Check Student Elements
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.table.registerSubjectButton-1"]
    Page Should Not Contain Element    xpath://*[contains(text(), 'Operating Systems')]
    Page Should Not Contain Element    xpath://*[contains(text(), 'Operating Systems')]//following-sibling::td[contains(text(), 'Peter Strict')]
    Close Browser

*** Test Cases ***
Spec 10 Teacher
    Open Browser To Login Page
    Login
    Check All Elements

Spec 10 Student
    Login As Student
    Check Student Elements