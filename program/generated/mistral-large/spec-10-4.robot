*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${URL}  http://localhost:4680/tbuis/index.jsp
${USERNAME}  strict
${PASSWORD}  pass
${SUBJECT}  Operating Systems

*** Test Cases ***
Teacher Scenario
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text  xpath://*[@id="loginPage.userNameInput"]  ${USERNAME}
    Input Password  xpath://*[@id="loginPage.passwordInput"]  ${PASSWORD}
    Click Button  xpath://*[@id="loginPage.loginFormSubmit"]

    # My Subjects page
    Click Link  xpath://*[@id="tea.menu.mySubjects"]

    # Check if all other Remove buttons are disabled
    ${buttons}=  Get WebElements  xpath://button[contains(text(), 'Remove') and not(@disabled)]
    Should Be Empty  ${buttons}

    # Click Remove button
    Click Button  xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]

    # Check if success alert appears
    Wait Until Page Contains Element  xpath://*[@id="tea.mySubjects.successAlert"]
    Page Should Contain Element  xpath://*[@id="tea.mySubjects.successAlert"]

    # My Exam Dates page
    Click Link  xpath://*[@id="tea.menu.myExamDates"]

    # Check if subject is not present
    ${element}=  Get WebElement  xpath://th[contains(text(), '${SUBJECT}')]
    Should Be Empty  ${element}

    # New Exam Dates page
    Click Link  xpath://*[@id="tea.menu.newExamDates"]

    # Check if subject is not present
    ${element}=  Get WebElement  xpath://option[contains(text(), '${SUBJECT}')]
    Should Be Empty  ${element}

    # Set Evaluation page
    Click Link  xpath://*[@id="tea.menu.setEvaluation"]

    # Check if subject is not present
    ${element}=  Get WebElement  xpath://option[contains(text(), '${SUBJECT}')]
    Should Be Empty  ${element}

    # Evaluation Table page
    Click Link  xpath://*[@id="tea.menu.evaluationTable"]

    # Check if subject is not present
    ${element}=  Get WebElement  xpath://option[contains(text(), '${SUBJECT}')]
    Should Be Empty  ${element}

    # Others' Subjects page
    Click Link  xpath://*[@id="tea.menu.otherSubjects"]

    # Check if subject is present
    Page Should Contain Element  xpath://td[contains(text(), '${SUBJECT}')]

    # List of All Teachers page
    Click Link  xpath://*[@id="tea.menu.listOfAllTeachers"]

    # Check if subject is not present in specific row
    ${element}=  Get WebElement  xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[contains(text(), '${SUBJECT}')]
    Should Be Empty  ${element}

    Close Browser

Student Scenario
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Input Password  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Button  xpath://*[@id="loginPage.loginFormSubmit"]

    # Others' Subjects page
    Click Link  xpath://*[@id="stu.menu.otherSubjects"]

    # Check if teacher's name is not present in the same row as subject
    ${element}=  Get WebElement  xpath://tr[contains(., '${SUBJECT}') and contains(., 'Peter Strict')]
    Should Be Empty  ${element}

    Close Browser