*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${URL}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Operations
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text  id=loginPage.userNameInput  strict
    Input Text  id=loginPage.passwordInput  pass
    Click Button  id=loginPage.loginFormSubmit

    # My Subjects page
    Click Link  xpath//a[text()='My Subjects']
    ${remove_buttons}=  Get WebElements  xpath//button[text()='Remove' and @disabled]
    Should Be Equal  ${remove_buttons}[0]  ${NULL}
    Click Button  id=tea.mySubjects.table.unregisterSubjectButton-0
    Wait Until Page Contains  id=tea.mySubjects.successAlert

    # My Exam Dates page
    Click Link  xpath//a[text()='My Exam Dates']
    ${os_header}=  Get WebElement  xpath//th[text()='Operating Systems']
    Should Be Equal  ${os_header.get_attribute('outerHTML')}  ${NULL}

    # New Exam Dates page
    Click Link  xpath//a[text()='New Exam Dates']
    ${os_option}=  Get WebElement  xpath//option[text()='Operating Systems']
    Should Be Equal  ${os_option.get_attribute('outerHTML')}  ${NULL}

    # Set Evaluation page
    Click Link  xpath//a[text()='Set Evaluation']
    ${os_option}=  Get WebElement  xpath//option[contains(text(), 'Operating Systems')]
    Should Be Equal  ${os_option.get_attribute('outerHTML')}  ${NULL}

    # Evaluation Table page
    Click Link  xpath//a[text()='Evaluation Table']
    ${os_option}=  Get WebElement  xpath//option[text()='Operating Systems']
    Should Be Equal  ${os_option.get_attribute('outerHTML')}  ${NULL}

    # Others' Subjects page
    Click Link  xpath//a[text()='Others' Subjects']
    ${os_cell}=  Get WebElement  xpath//td[text()='Operating Systems']
    Should Not Be Equal  ${os_cell.get_attribute('outerHTML')}  ${NULL}

    # List of All Teachers page
    Click Link  xpath//a[text()='List of All Teachers']
    ${teacher_row}=  Get WebElement  xpath//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']
    ${teacher_cells}=  Get WebElements  xpath=.//td  parent=${teacher_row}
    ${os_teacher}=  Set Variable  ${FALSE}
    FOR  ${cell}  IN  @{teacher_cells}
        ${cell_text}=  Get Text  ${cell}
        Run Keyword If  '${cell_text}' == 'Operating Systems'  Set Variable  ${os_teacher}  ${TRUE}
    END
    Should Be Equal  ${os_teacher}  ${FALSE}

    Close Browser

Student Operations
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text  id=loginPage.userNameInput  orange
    Input Text  id=loginPage.passwordInput  pass
    Click Button  id=loginPage.loginFormSubmit

    # Other Subjects page
    Click Link  xpath//a[text()='Other Subjects']
    ${os_row}=  Get WebElement  xpath//tr[td[text()='Operating Systems']]
    ${os_cells}=  Get WebElements  xpath=.//td  parent=${os_row}
    ${strict_teacher}=  Set Variable  ${FALSE}
    FOR  ${cell}  IN  @{os_cells}
        ${cell_text}=  Get Text  ${cell}
        Run Keyword If  '${cell_text}' == 'Peter Strict'  Set Variable  ${strict_teacher}  ${TRUE}
    END
    Should Be Equal  ${strict_teacher}  ${FALSE}

    Close Browser