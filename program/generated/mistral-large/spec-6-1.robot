*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    Input Text    xpath://*/[@id="loginPage.userNameInput"]    maroon
    Input Password    xpath://*/[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*/[@id="loginPage.loginFormSubmit"]

    Click Element    xpath://*/[@id="stu.menu.otherSubjects"]
    Click Element    xpath://*/[@id="stu.otherSubjects.table.enrollButton-10"]
    Wait Until Page Contains Element    xpath://*/[@id="stu.otherSubjects.successAlert"]    10

    Click Element    xpath://*/[@id="stu.menu.mySubjects"]
    Page Should Contain Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()=" Peter Strict "]

    Close Browser

Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    Input Text    xpath://*/[@id="loginPage.userNameInput"]    strict
    Input Password    xpath://*/[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*/[@id="loginPage.loginFormSubmit"]

    Click Element    xpath://*/[@id="tea.menu.mySubjects"]
    ${button_text}    Get Text    xpath://*/[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal    ${button_text}    Students (2)

    Click Element    xpath://*/[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Page Should Contain Element    xpath://td[text()="William Maroon"]

    Close Browser