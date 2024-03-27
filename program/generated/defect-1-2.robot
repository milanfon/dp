*** Settings ***
Documentation A test suite for a University information system
Library SeleniumLibrary

Suite Setup Open Browser http://localhost:4680/tbuis/ chrome
Suite Teardown Close All Browsers

*** Test Cases ***
Open Page And Check Button Background Color
Set Window Size 1501 1104
Sleep 1s
Click Element xpath=//[@id="header.link.login"]
Sleep 1s
Click Element xpath=//[@id="loginPage.userNameInput"]
Input Text xpath=//[@id="loginPage.userNameInput"] brown
Press Key xpath=//[@id="loginPage.userNameInput"] \09 # Tab key
Input Text xpath=//[@id="loginPage.passwordInput"] pass
Click Element xpath=//[@id="loginPage.loginFormSubmit"]
Sleep 2s
Click Element xpath=//[@id="stu.menu.myExamDates"]
Sleep 2s
${backgroundColor}= Get Element CSS Value xpath=//[@id="stu.myExamDates.table.ParticipantsButton-0"] background-color
Should Be Equal ${backgroundColor} #007bff