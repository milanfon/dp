Test case: Check students' names on page


    Open browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set selenium speed    ${0}
    Click element    xpath://*[@id="header.link.login"]
    Input text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click element    xpath://*[@id="tea.menu.mySubjects"]
    Click element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click element    xpath://*[@id="closeModalButtonCross"]
    Click element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    
    # Check if names are present
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.table"]
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.table"]//a[text()="Benjamin Green"]
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.table"]//a[text()="Mia Orange"]
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.table"]//a[text()="Charlotte Purple"]
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.table"]//a[text()="Isabella Yellow"]
    
    Close browser


    
Test case: Check no students message

    Open browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set selenium speed    ${0}
    Click element    xpath://*[@id="header.link.login"]
    Input text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click element    xpath://*[@id="tea.menu.mySubjects"]
    Click element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click element    xpath://*[@id="closeModalButtonCross"]
    Click element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    
    # Check if "No students" text is present
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.table"]
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.table"]//*[text()="No students"]
    
    Close browser 