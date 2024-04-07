# Open "Other Exam Dates" page
Open Browser    http://localhost:4680/tbuis    Chrome
Input Text    xpath://*[@id="loginPage.userNameInput"]    green
Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
Click Element    xpath://*[@id="stu.menu.otherExamDates"]
Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
Wait Until Element Is Visible    xpath://*[@id="stu.otherExamDates.successAlert"]
Click Element    xpath://*[@id="stu.menu.myExamDates"]
Wait Until Element Is Visible    xpath://*[@id="stu.menu.myExamDates"]
Click Element    xpath://*[@id="stu.menu.myExamDates"]

# Check for "Programming in Java"
Wait Until Element Is Visible    xpath://td[contains(text(), "Programming in Java")]

# Login as teacher
Click Element    xpath://*[@id="header.link.login"]
Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
Click Element    xpath://*[@id="tea.menu.myExamDates"]
Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]

# Check for "Mia Orange"
Wait Until Element Is Visible    xpath://td[contains(text(), "Mia Orange"]

Close Browser