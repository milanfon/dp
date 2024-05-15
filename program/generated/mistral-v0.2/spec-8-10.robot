*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Variables ***
${URL}             http://localhost:4680/tbuis/

*** Test Cases ***

Test Student Exam Dates
    [Documentation]       Test student exam dates functionality

    [Preparation]         Set Up
    Set Viewport            1501,1104,1,1,False,False,False
    Set Browser Implicit Wait   10

    [Actions]         Open Browser
    Open Browser            ${URL}

    [Actions]         Login as Student
    Click Element            id=header.link.login
    Input Text            id=loginPage.userNameInput         student
    Input Text            id=loginPage.passwordInput         pass
    Click Element            id=loginPage.loginFormSubmit

    [Actions]         Check Other Exam Dates
    Click Element            id=stu.menu.otherExamDates
    Click Element            id=stu.otherExamDates.table.registerButton-2-0
    Wait Until Element Is Visible            id=stu.otherExamDates.successAlert

    [Actions]         Check My Exam Dates
    Click Element            id=stu.menu.myExamDates
    Wait Until Element Is Visible            xpath=//td[text()="Programming in Java"]

    [Teardown]         Close Browser

Test Teacher Exam Dates
    [Documentation]       Test teacher exam dates functionality

    [Preparation]         Set Up
    Set Viewport            1501,1104,1,1,False,False,False
    Set Browser Implicit Wait   10

    [Actions]         Open Browser
    Open Browser            ${URL}

    [Actions]         Login as Teacher
    Click Element            id=header.link.login
    Input Text            id=loginPage.userNameInput         teacher
    Input Text            id=loginPage.passwordInput         pass
    Click Element            id=loginPage.loginFormSubmit

    [Actions]         Check My Exam Dates
    Click Element            id=tea.menu.myExamDates
    Click Element            id=tea.myExamDates.table.participantsButton-1-0
    Wait Until Element Is Visible            xpath=//td[text()="Mia Orange"]

    [Teardown]         Close Browser

[Documentation]         This script automates the testing of the student and teacher exam dates functionalities in the TBUIS application.
[Documentation]         The script opens the TBUIS application in Chrome browser, logs in as a student and teacher, and performs the required checks.
[Documentation]         The script uses the SeleniumLibrary and sets the browser viewport and implicit wait.
[Documentation]         The script includes a setup, actions, and teardown for each test case.
[Documentation]         The setup includes setting the viewport and browser implicit wait.
[Documentation]         The actions for the student test case include opening the browser, logging in as a student, and checking the other and my exam dates.
[Documentation]         The actions for the teacher test case include opening the browser, logging in as a teacher, and checking the my exam dates.
[Documentation]         The teardown for each test case includes closing the browser.