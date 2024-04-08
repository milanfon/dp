## Solution

### Scenario: Teacher


*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Test Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    ${1000}    ${100}
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.otherSubjects
    Click Element    id:tea.otherSubjects.table.participateButton-3
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.menu.newExamDates
    Click Element    id:tea.menu.listOfAllTeachers
    ${tea.otherSubjects.successAlert}    Get Element Attribute    id:tea.otherSubjects.successAlert    aria-hidden
    Should Be Equal    ${tea.otherSubjects.successAlert}    false
    ${my.exam.dates.text}    Get Element Text    id:tea.myExamDates.table.noRecords-2
    Should Be Equal    ${my.exam.dates.text}    No exam dates.
    ${tea.list.table.teacherRow-3}    Get Element Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    
    Should Contain    ${tea.list.table.teacherRow-3}    Linear Algebra    
    ${tea.list.table.teacherRow-3.teacher}    Get Element Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    
    Should Contain    ${tea.list.table.teacherRow-3.teacher}    Alice Pedant    
    
    
    Close Browser    
    
    
### Scenario: Student

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Test Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    ${100}    ${100}
    Input Text    id:loginPage.userNameInput    yellow
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherSubjects
    ${other.subjects.subject.text}    Get Element Text    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    Should Contain    ${other.subjects.subject.text}    Linear Algebra    
    ${other.subjects.teacher.text}    Get Element Text    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    
    Should Contain    ${other.subjects.teacher.text}    Alice Pedant    
    
    Close Browser    
    
    
## Explanation

We are using the SeleniumLibrary to open the browser and navigate to the specified URLs. We are using the `Open Browser` keyword to open the browser and `Set Window Size` to set the browser window to the specified size. We are using `Input Text` to input the username and password and `Click Element` to click the login button. We are using `Click Element` to click the desired buttons and `Get Element Attribute` to check if the alert is visible. We are using `Get Element Text` to check the text of the elements and `Should Contain` to check if the text is present. We are using XPath to locate the elements. We are using `Should Be Equal` to check if the alert is visible and `Should Contain` to check if the text is present. We are using `Close Browser` to close the browser after the tests are completed. 