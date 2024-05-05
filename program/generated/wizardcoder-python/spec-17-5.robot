*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}   0
${USERNAME}    pedant
${PASSWORD}    pass

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    ${USERNAME}
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=tea.menu.otherSubjects
    Click Element    id=tea.otherSubjects.table.participateButton-3
    Sleep    ${DELAY}
    ${current_url}    Get Location
    Should Be Equal    ${current_url}    ${URL}/teacher-view/otherSubjects
    ${teacher_visible}    Get Element Attribute    id=tea.otherSubjects.successAlert@visible
    Should Be Equal    ${teacher_visible}    true
    Click Element    id=tea.menu.myExamDates
    ${linear_algebra_visible}    Get WebElement    xpath=//*[contains(text(), 'Linear Algebra')]
    Should Be Equal    ${linear_algebra_visible}    ${True}
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain    No exam dates.
    Click Element    id=tea.menu.newExamDates
    Click Element    xpath=//*[@id="tea.newExamDates.select.subject"]//*[contains(text(), 'Linear Algebra')]
    Click Element    xpath=//*[@id="tea.newExamDates.select.teacher"]//*[contains(text(), 'Alice Pedant')]
    Click Element    xpath=//*[@id="tea.newExamDates.addDates"]
    Click Element    id=tea.menu.listOfAllTeachers
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    yellow
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=stu.menu.otherSubjects
    ${linear_algebra_visible}    Get WebElement    xpath=//*[contains(text(), 'Linear Algebra')]
    Should Be Equal    ${linear_algebra_visible}    ${True}
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}    remote_url=http://localhost:44444/wd/hub    desired_capabilities=browserName=${browser}    options=add_argument:headless

Close Browser
    Sleep    ${DELAY}
    Close Browser

Get Location
    Sleep    ${DELAY}
    ${current_url}    Get Location
    Return From Keyword    ${current_url}

Get Element Attribute
    [Arguments]    ${element}    ${attribute}
    Sleep    ${DELAY}
    ${element_attribute}    Get Element Attribute    ${element}    ${attribute}
    Return From Keyword    ${element_attribute}

Get WebElement
    [Arguments]    ${xpath}
    Sleep    ${DELAY}
    ${element}    Get WebElement    ${xpath}
    Return From Keyword    ${element}

Element Should Contain
    [Arguments]    ${xpath}    ${text}
    Sleep    ${DELAY}
    ${element}    Get WebElement    ${xpath}
    ${element_text}    Get Text    ${element}
    Should Contain    ${element_text}    ${text}

Page Should Contain
    [Arguments]    ${text}
    Sleep    ${DELAY}
    Page Should Contain    ${text}

Page Should Contain Element
    [Arguments]    ${xpath}
    Sleep    ${DELAY}
    Page Should Contain Element    ${xpath}