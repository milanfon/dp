*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Removes Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    ${elements}=    Get WebElements    xpath://input[@value="Remove"]
    FOR    ${element}    IN    @{elements}
        Element Should Be Disabled    ${element}
    END
    Click Button    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Page Should Not Contain Element    xpath://th[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    1s
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    1s
    Page Should Contain Element    xpath://td[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems
    Close Browser

Student Checks Other Subjects
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    ${elements}=    Get WebElements    xpath://tr[contains(., "Operating Systems")]
    FOR    ${element}    IN    @{elements}
        Element Should Not Contain    ${element}    Peter Strict
    END
    Close Browser