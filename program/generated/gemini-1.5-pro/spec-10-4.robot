*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome
${DELAY}          2s

*** Keywords ***
Open Browser To Index Page
    Open Browser    ${INDEX URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

Login As Teacher
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login As Student
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Check Other Subjects Page As Student
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://tr[td[text()="Operating Systems"] and td[contains(text(), "Peter Strict")]]
    Sleep    ${DELAY}

Check My Subjects Page As Teacher
    Click Link    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0" and @disabled]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-1" and @disabled]
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Sleep    ${DELAY}

Check My Exam Dates Page As Teacher
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://th[text()="Operating Systems"]
    Sleep    ${DELAY}

Check New Exam Dates Page As Teacher
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Sleep    ${DELAY}

Check Set Evaluation Page As Teacher
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://option[contains(text(), "Operating Systems")]
    Sleep    ${DELAY}

Check Evaluation Table Page As Teacher
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Sleep    ${DELAY}

Check Others Subjects Page As Teacher
    Click Link    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()="Operating Systems"]
    Sleep    ${DELAY}

Check List of All Teachers Page As Teacher
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[contains(text(), "Operating Systems")]
    Sleep    ${DELAY}

*** Test Cases ***
Remove Subject By Teacher And Check Other Pages
    Open Browser To Index Page
    Login As Teacher
    Check My Subjects Page As Teacher
    Check My Exam Dates Page As Teacher
    Check New Exam Dates Page As Teacher
    Check Set Evaluation Page As Teacher
    Check Evaluation Table Page As Teacher
    Check Others Subjects Page As Teacher
    Check List of All Teachers Page As Teacher
    Close Browser

Check If Removed Subject Is Not Present For Student
    Open Browser To Index Page
    Login As Student
    Check Other Subjects Page As Student
    Close Browser
