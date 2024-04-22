*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          2s
${BROWSER}        chrome
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser And Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
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

Go To Page My Subjects
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}

Go To Page My Exam Dates
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}

Go To Page New Exam Dates
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}

Go To Page Set Evaluation
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}

Go To Page Evaluation Table
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}

Go To Page Others Subjects
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}

Go To Page List Of All Teachers
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}

*** Test Cases ***
Teacher Removes Subject

    Open Browser And Login
    Go To Page My Subjects
    ${remove_buttons}=    Get Webelements    xpath://input[@value="Remove"]
    Sleep    ${DELAY}
    FOR    ${button}    IN    @{remove_buttons}
        Run Keyword If    '${button}' != '${remove_buttons}[0]'    Element Should Be Disabled    ${button}
    END
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="tea.mySubjects.successAlert"]
    Go To Page My Exam Dates
    Page Should Not Contain Element    xpath://th[text()="Operating Systems"]
    Go To Page New Exam Dates
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Go To Page Set Evaluation
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Go To Page Evaluation Table
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Go To Page Others Subjects
    Page Should Contain Element    xpath://td[text()="Operating Systems"]
    Go To Page List Of All Teachers
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser

Student Checks Other Subjects

    Open Browser And Login
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
    Go To Page Others Subjects
    Page Should Not Contain Element    xpath://tr[td[contains(text(), "Operating Systems")]]//td[contains(text(), "Peter Strict")]
    Close Browser
