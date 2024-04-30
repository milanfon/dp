*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open and Verify Student Page
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath///*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    ENTER
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Click Element    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Wait Until Element Is Visible    id=stu.otherSubjects.successAlert
    Click Element    xpath///*[@id="stu.menu.mySubjects"]
    Wait Until Element Is Visible    xpath//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2" and .//td[text()="Software Quality Assurance" and text()="Peter Strict"]]
    Close Browser

Open and Verify Teacher Page
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Wait Until Element Is Visible    xpath//td[text()="William Maroon"]
    Close Browser