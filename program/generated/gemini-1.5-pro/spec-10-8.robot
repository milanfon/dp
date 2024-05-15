*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome
${DELAY}          2s

*** Keywords ***
Open Browser And Maximize
    Open Browser    ${INDEX URL}    ${BROWSER}
    Maximize Browser Window

Login As Teacher
    Click Link    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login As Student
    Click Link    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Go To My Subjects Page
    Click Link    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}

Go To My Exam Dates Page
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}

Go To New Exam Dates Page
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}

Go To Set Evaluation Page
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}

Go To Evaluation Table Page
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}

Go To Other Subjects Page
    Click Link    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}

Go To List Of All Teachers Page
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}

Go To Student Other Subjects Page
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}

Check Other Remove Buttons On My Subject Page
    ${buttons}=    Get WebElements    xpath://input[@value="Remove"]
    Sleep    ${DELAY}
    FOR    ${button}    IN    @{buttons}
        Run Keyword If    '${button}' != '${buttons}[0]' 
        ...    Element Should Be Disabled    ${button}
        
Check Success Alert On My Subject Page
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Sleep    ${DELAY}

Check Operating Systems On My Exam Dates Page
    Page Should Not Contain Element    xpath://th[text()="Operating Systems"]
    Sleep    ${DELAY}

Check Operating Systems On New Exam Dates Page
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Sleep    ${DELAY}

Check Operating Systems On Set Evaluation Page
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Sleep    ${DELAY}

Check Operating Systems On Evaluation Table Page
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Sleep    ${DELAY}

Check Operating Systems On Other Subjects Page
    Page Should Contain Element    xpath://td[text()="Operating Systems"]
    Sleep    ${DELAY}

Check Operating Systems On List Of All Teachers Page
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(., "Operating Systems")]
    Sleep    ${DELAY}

Check Operating Systems On Student Other Subjects Page
    Page Should Not Contain Element    xpath://tr[td[contains(., "Operating Systems")]]//td[contains(., "Peter Strict")]
    Sleep    ${DELAY}

*** Test Cases ***
Remove subject from My Subjects as teacher
    Open Browser And Maximize
    Login As Teacher
    Go To My Subjects Page
    Check Other Remove Buttons On My Subject Page
    Click Button    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Check Success Alert On My Subject Page
    Go To My Exam Dates Page
    Check Operating Systems On My Exam Dates Page
    Go To New Exam Dates Page
    Check Operating Systems On New Exam Dates Page
    Go To Set Evaluation Page
    Check Operating Systems On Set Evaluation Page
    Go To Evaluation Table Page
    Check Operating Systems On Evaluation Table Page
    Go To Other Subjects Page
    Check Operating Systems On Other Subjects Page
    Go To List Of All Teachers Page
    Check Operating Systems On List Of All Teachers Page
    Close Browser

Check Other Subjects page as student
    Open Browser And Maximize
    Login As Student
    Go To Student Other Subjects Page
    Check Operating Systems On Student Other Subjects Page
    Close Browser
