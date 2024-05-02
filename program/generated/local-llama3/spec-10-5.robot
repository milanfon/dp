*** Settings ***
Library         SeleniumLibrary
Suite Setup     Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown  Close Browser

*** Test Cases ***
Teacher Login
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    1
    ${remove_buttons}=    Get WebElements    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-"]
    ${remove_buttons_disabled}=    Get WebElements    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-"][@disabled="disabled"]
    Should Be Equal    ${remove_buttons_disabled}    ${remove_buttons}
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1
    Element Should Be Visible    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.myExamDates.table"]/th[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.newExamDates.table"]/option[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.setEvaluation.table"]/option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.evaluationTable.table"]/option[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    1
    Element Should Be Visible    xpath://*[@id="tea.otherSubjects.table"]/td[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.listOfAllTeachers.table"]/tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[contains(text(), "Operating Systems")]

*** Test Cases ***
Student Login
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="stu.otherSubjects.table"]/tr[td[text()="Operating Systems"]]/td[contains(text(), "Peter Strict")]
    Close Browser