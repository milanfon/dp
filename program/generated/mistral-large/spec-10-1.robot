*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome

    # Login steps
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]

    # My Subjects page
    Click Element  xpath://*[@id="tea.menu.mySubjects"]
    ${other_remove_buttons}=  Get WebElements  xpath://button[@value='Remove']
    FOR  ${button}  IN  @{other_remove_buttons}
        Run Keyword And Ignore Error  Should Be Element Attribute  ${button}  disabled  true
    END
    Click Element  xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Wait Until Page Contains Element  xpath://*[@id="tea.mySubjects.successAlert"]

    # My Exam Dates page
    Click Element  xpath://*[@id="tea.menu.myExamDates"]
    ${os_element}=  Get WebElement  xpath://th[text()='Operating Systems']
    Run Keyword And Ignore Error  Element Should Not Be Visible  ${os_element}

    # New Exam Dates page
    Click Element  xpath://*[@id="tea.menu.newExamDates"]
    ${os_element}=  Get WebElement  xpath://option[text()='Operating Systems']
    Run Keyword And Ignore Error  Element Should Not Be Visible  ${os_element}

    # Set Evaluation page
    Click Element  xpath://*[@id="tea.menu.setEvaluation"]
    ${os_element}=  Get WebElement  xpath://option[contains(text(), 'Operating Systems')]
    Run Keyword And Ignore Error  Element Should Not Be Visible  ${os_element}

    # Evaluation Table page
    Click Element  xpath://*[@id="tea.menu.evaluationTable"]
    ${os_element}=  Get WebElement  xpath://option[text()='Operating Systems']
    Run Keyword And Ignore Error  Element Should Not Be Visible  ${os_element}

    # Others' Subjects page
    Click Element  xpath://*[@id="tea.menu.otherSubjects"]
    ${os_element}=  Get WebElement  xpath://td[text()='Operating Systems']
    Element Should Be Visible  ${os_element}

    # List of All Teachers page
    Click Element  xpath://*[@id="tea.menu.listOfAllTeachers"]
    ${os_element}=  Get WebElement  xpath://tr[@id='tea.listOfAllTeachers.table.teacherRow-5']//td[contains(text(), 'Operating Systems')]
    Run Keyword And Ignore Error  Element Should Not Be Visible  ${os_element}

    Close Browser

Student Scenario
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome

    # Login steps
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]

    # Others' Subjects page
    Click Element  xpath://*[@id="stu.menu.otherSubjects"]
    ${os_element}=  Get WebElement  xpath://tr[td[text()='Operating Systems']]//td[contains(text(), 'Peter Strict')]
    Run Keyword And Ignore Error  Element Should Not Be Visible  ${os_element}

    Close Browser