*** Settings ***
Documentation Verify button's background color
Library SeleniumLibrary

Suite Setup Open Browser http://localhost:4680/tbuis/ chrome
Suite Teardown Close All Browsers

*** Test Cases ***
Check Button Background Color
Set Window Size 1501 1104
Sleep 1s
Click Element xpath=//[@id="header.link.login"]
Sleep 1s
Click Element xpath=//[@id="loginPage.userNameInput"]
Sleep 1s
Input Text xpath=//[@id="loginPage.userNameInput"] brown
Sleep 1s
Press Key xpath=//[@id="loginPage.userNameInput"] \09 # Tab
Sleep 1s
Input Text xpath=//[@id="loginPage.passwordInput"] pass
Sleep 1s
Click Element xpath=//[@id="loginPage.loginFormSubmit"]
Sleep 2s
Click Element xpath=//[@id="stu.menu.myExamDates"]
Sleep 2s
${backgroundColor} Get Element Css Value xpath=//[@id="stu.myExamDates.table.ParticipantsButton-0"] background-color
Should Be Equal As Strings ${backgroundColor} rgb(0, 123, 255)