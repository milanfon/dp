*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${DELAY}      2s

*** Keywords ***
Login Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Check Element Disabled
    [Arguments]    ${locator}
    ${elements}=    Get WebElements    ${locator}
    FOR    ${element}    IN    @{elements}
        Element Should Be Disabled    ${element}
    END

Check Element Not Present
    [Arguments]    ${locator}
    Run Keyword And Expect Error    Element should not be visible    Page Should Contain Element    ${locator}

*** Test Cases ***
Remove Subject Teacher
    Login Teacher
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Check Element Disabled    xpath://input[@value="Remove" and not(@id="tea.mySubjects.table.unregisterSubjectButton-0")]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Check Element Not Present    xpath://th[text()="Operating Systems"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Check Element Not Present    xpath://option[text()="Operating Systems"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Check Element Not Present    xpath://option[contains(text(), "Operating Systems")]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Check Element Not Present    xpath://option[text()="Operating Systems"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()="Operating Systems"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Check Element Not Present    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Sleep    ${DELAY}
    Close Browser

Remove Subject Student
    Login Student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Check Element Not Present    xpath://tr[td[text()="Operating Systems"]]//td[contains(text(), "Peter Strict")]
    Sleep    ${DELAY}
    Close Browser
