*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Enroll in Other Subjects
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath///*[@id="loginPage.userNameInput"]    TAB
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    ENTER
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Click Element    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2
    Element Should Be Visible    id=stu.otherSubjects.successAlert
    Close Browser

Check Subjects in My Subjects
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2
    Page Should Contain Element    xpath//tr[@id="tea.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath//tr[@id="tea.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Close Browser