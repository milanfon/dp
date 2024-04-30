*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost:4680/tbuis/

*** Test Cases ***
Student Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text  xpath:///*[@id="loginPage.userNameInput"]  green
    Input Text  xpath:///*[@id="loginPage.passwordInput"]  pass
    Click Button  xpath:///*[@id="loginPage.loginFormSubmit"]

    # Navigate to Other Exam Dates
    Click Element  xpath:///*[@id="stu.menu.otherExamDates"]

    # Click Register button
    Click Element  xpath:///*[@id="stu.otherExamDates.table.registerButton-2-0"]

    # Check success alert
    Wait Until Page Contains Element  xpath://[@id="stu.otherExamDates.successAlert"]  10s

    # Navigate to My Exam Dates
    Click Element  xpath:///*[@id="stu.menu.myExamDates"]

    # Check if Programming in Java is present
    Page Should Contain Element  xpath://td[contains(text(), "Programming in Java")]

    Close Browser

Teacher Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text  xpath:///*[@id="loginPage.userNameInput"]  strict
    Input Text  xpath:///*[@id="loginPage.passwordInput"]  pass
    Click Button  xpath:///*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Exam Dates
    Click Element  xpath:///*[@id="tea.menu.myExamDates"]

    # Click Participants button
    Click Element  xpath:///*[@id="tea.myExamDates.table.participantsButton-1-0"]

    # Check if Mia Orange is present
    Page Should Contain Element  xpath://td[contains(text(), "Mia Orange")]

    Close Browser