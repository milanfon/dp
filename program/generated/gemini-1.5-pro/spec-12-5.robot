*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          2s
${BROWSER}        chrome
${URL}             http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Login As Teacher
    Open Browser      ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="header.link.login"]
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="loginPage.userNameInput"]
    Sleep             ${DELAY}
    Input Text        xpath://*[@id="loginPage.userNameInput"]     scatterbrained
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="loginPage.passwordInput"]
    Sleep             ${DELAY}
    Input Text        xpath://*[@id="loginPage.passwordInput"]     pass
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep             ${DELAY}

Login As Student
    Open Browser      ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="header.link.login"]
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="loginPage.userNameInput"]
    Sleep             ${DELAY}
    Input Text        xpath://*[@id="loginPage.userNameInput"]     orange
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="loginPage.passwordInput"]
    Sleep             ${DELAY}
    Input Text        xpath://*[@id="loginPage.passwordInput"]     pass
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep             ${DELAY}

Go To My Exam Dates As Teacher
    Click Element     xpath://*[@id="tea.menu.myExamDates"]
    Sleep             ${DELAY}

Go To My Exam Dates As Student
    Click Element     xpath://*[@id="stu.menu.myExamDates"]
    Sleep             ${DELAY}

Go To Set Evaluation
    Click Element     xpath://*[@id="tea.menu.setEvaluation"]
    Sleep             ${DELAY}

Go To Evaluation Table
    Click Element     xpath://*[@id="tea.menu.evaluationTable"]
    Sleep             ${DELAY}

Cancel Exam Date
    Click Element     xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep             ${DELAY}
    Alert Should Be Present
    Accept Alert
    Sleep             ${DELAY}

Filter Subjects
    Click Element     xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep             ${DELAY}
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]     1202
    Sleep             ${DELAY}
    Click Element     xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep             ${DELAY}

*** Test Cases ***
Cancel Exam Date And Check Alert
    Login As Teacher
    Go To My Exam Dates As Teacher
    Cancel Exam Date
    Location Should Be    http://localhost:4680/tbuis/teacher-view/myExamDates
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Close Browser

Check Set Evaluation Page
    Login As Teacher
    Go To Set Evaluation
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Close Browser

Filter Subjects And Check Results
    Login As Teacher
    Go To Evaluation Table
    Filter Subjects
    Page Should Contain    No exam dates for this subject
    Close Browser

Check Subjects As Student
    Login As Student
    Go To My Exam Dates As Student
    Page Should Not Contain    Computation Structures
    Close Browser
