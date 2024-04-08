*** Settings ***
Library         SeleniumLibrary


*** Test Cases ***
Check students
    Open browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Input text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click element    xpath://*[@id="tea.menu.mySubjects"]
    Click element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click element    xpath://*[@id="closeModalButtonCross"]
    Click element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    ${students}=    Get element count    xpath://*[@id="tea.students.table.table"]/tbody/tr
    should be equal as numbers    ${students}    4
    ${names}=    Get text    xpath://*[@id="tea.students.table.table"]/tbody/tr/td[contains(., 'Benjamin')]
    ${names}=    Get text    xpath://*[@id="tea.students.table.table"]/tbody/tr/td[contains(., 'Mia')]
    ${names}=    Get text    xpath://*[@id="tea.students.table.table"]/tbody/tr/td[contains(., 'Charlotte')]
    ${names}=    Get text    xpath://*[@id="tea.students.table.table"]/tbody/tr/td[contains(., 'Isabella')]
    should be true    ${names} == 'Benjamin Green'    ${names} == 'Mia Orange'    ${names} == 'Charlotte Purple'    ${names} == 'Isabella Yellow'
    Close browser