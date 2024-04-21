*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Open Page and Verify Elements
    [Documentation]    Open page and verify elements on "Other Subjects" and "My Subjects" pages
    Open Browser    chrome
    Set Viewport    1501    1104
    Navigate To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath///*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    ENTER
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    id=stu.otherSubjects.successAlert
    Page Should Contain Element    xpath//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Close Browser

Login as Teacher and Verify Elements
    [Documentation]    Login as teacher and verify elements on "My Subjects" page
    Open Browser    chrome
    Set Viewport    1501    1104
    Navigate To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath//td[text()="William Maroon"]
    Close Browser