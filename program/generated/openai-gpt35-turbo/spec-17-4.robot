*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Open Page and Verify Elements as Teacher
    Open Browser    chrome
    Set Selenium Speed    ${DELAY}
    Go to    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.otherSubjects"]
    Click Element    xpath///*[@id="tea.otherSubjects.table.participateButton-3"]
    Wait Until Element Is Visible    tea.otherSubjects.successAlert
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Wait Until Element Is Visible    tea.myExamDates.table.noRecords-2
    Click Element    xpath///*[@id="tea.menu.newExamDates"]
    Wait Until Element Is Visible    xpath//option[text()='Linear Algebra']
    Click Element    xpath///*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Element Is Visible    xpath//td[contains(text(),'Linear Algebra')]
    Wait Until Element Is Visible    xpath//td[text()='Alice Pedant']
    Close Browser

Open Page and Verify Elements as Student
    Open Browser    chrome
    Set Selenium Speed    ${DELAY}
    Go to    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Wait Until Element Is Visible    xpath//td[contains(text(),'Linear Algebra')]
    Wait Until Element Is Visible    xpath//td[contains(text(),'Alice Pedant')]
    Close Browser