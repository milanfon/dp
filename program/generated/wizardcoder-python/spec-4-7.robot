Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
Input Text    id:loginPage.userNameInput    gray
Input Text    id:loginPage.passwordInput    pass
Click Element    xpath://*[@id="loginPage.userNameInput"]
Click Element    xpath://*[@id="loginPage.passwordInput"]
Click Element    xpath://*[@id="loginPage.passwordInput"]
Click Element    xpath://*[@id="loginPage.loginButton"]
Click Element    xpath://*[@id="stu.menu.mySubjects"]
Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectModal.unenrollSubjectButton"]

${stu_subjects_success_alert_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
${stu_my_subjects_title_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
${stu_database_system_present}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath://td[text()="Database Systems"]

Close Browser

${stu_database_system_present}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath://td[text()="Database Systems"]

Close Browser