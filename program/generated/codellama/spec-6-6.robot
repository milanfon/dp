*** Settings ***
Library  SeleniumLibrary  timeout=5  implicit_wait=0

*** Test Cases ***
Spec 6 Student
    [Setup]  Open Browser  ${URL}  ${BROWSER}
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  maroon
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="stu.menu.otherSubjects"]
    Click Element  xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Element Should Be Visible  xpath://*[@id="stu.otherSubjects.successAlert"]
    Click Element  xpath://*[@id="stu.menu.mySubjects"]
    Element Should Be Visible  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
    Element Should Be Visible  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]
    Element Should Be Visible  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]
    Element Should Be Visible  xpath://*[text()="Software Quality Assurance"]
    Element Should Be Visible  xpath://*[text()="Peter Strict"]
    Close Browser

Spec 6 Teacher
    [Setup]  Open Browser  ${URL}  ${BROWSER}
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="tea.menu.mySubjects"]
    Element Should Be Visible  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Element Should Be Visible  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Element Should Be Visible  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]/text()="Students (2) "
    Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Element Should Be Visible  xpath://*[text()="William Maroon"]
    Close Browser