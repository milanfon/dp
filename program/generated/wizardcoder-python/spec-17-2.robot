Here's the Robot Framework scenario based on the provided JSON recordings:


*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close Browser

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    0.5s

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Element Should Be Visible    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]    Element with id "tea.myExamDates.table.noRecords-2" is not visible
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]    No exam dates.
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra    Element with path "//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]" does not contain "Linear Algebra"
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant    Element with path "//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]" does not contain "Alice Pedant"

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra    Element with path "//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]" does not contain "Linear Algebra"
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant    Element with path "//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]" does not contain "Alice Pedant"

*** Keywords ***
Close Browser
    Close Browser

*** Keywords ***
Close Browser
    Close Browser

The scenario is written in Robot Framework syntax. The "Teacher Scenario" and "Student Scenario" sections contain the steps from the provided JSON recordings. The "Close Browser" keyword is used to close the browser after the test is executed. The "Set Window Size" keyword is used to set the browser window to the same size as in the JSON recordings. The "Element Should Be Visible" keyword is used to check if the element is present on the page. The "Element Should Contain" keyword is used to check if the element contains the specified text. The "Input Text" keyword is used to input text in the input fields. The "Click Element" keyword is used to click on the specified element. The "xpath" locator is used to locate the elements. The "Element Should Contain" keyword is used to check if the element contains the specified text. The "Element Should Contain" keyword is used to check if the element contains the specified text. The "Element Should Be Visible" keyword is used to check if the element is visible. The "Open Browser" keyword is used to open the specified URL. The "Set Viewport" keyword is not used because the viewport size is not required to be set. 