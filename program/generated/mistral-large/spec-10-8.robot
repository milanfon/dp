*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${USERNAME}    strict
${PASSWORD}    pass

*** Test Cases ***
Teacher Operations
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=loginPage.userNameInput    ${USERNAME}
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Button    id=loginPage.loginFormSubmit

    # My Subjects
    Click Element    xpath//*[text()='My Subjects']
    ${remove_buttons}=    Get WebElements    xpath//button[text()='Remove' and @disabled]
    Should Be Equal    ${remove_buttons[0].get_attribute('disabled')}    true
    Click Element    xpath//button[text()='Remove']
    Wait Until Page Contains Element    id=tea.mySubjects.successAlert
    Should Be Visible    id=tea.mySubjects.successAlert

    # My Exam Dates
    Click Element    xpath//*[text()='My Exam Dates']
    ${th_elements}=    Get WebElements    xpath//th
    FOR    ${th}    IN    @{th_elements}
        Should Not Contain    ${th.text}    Operating Systems
    END

    # New Exam Dates
    Click Element    xpath//*[text()='New Exam Dates']
    ${option_elements}=    Get WebElements    xpath//option
    FOR    ${option}    IN    @{option_elements}
        Should Not Contain    ${option.text}    Operating Systems
    END

    # Set Evaluation
    Click Element    xpath//*[text()='Set Evaluation']
    ${option_elements}=    Get WebElements    xpath//option
    FOR    ${option}    IN    @{option_elements}
        Should Not Contain    ${option.text}    Operating Systems
    END

    # Evaluation Table
    Click Element    xpath//*[text()='Evaluation Table']
    ${option_elements}=    Get WebElements    xpath//option
    FOR    ${option}    IN    @{option_elements}
        Should Not Contain    ${option.text}    Operating Systems
    END

    # Other's Subjects
    Click Element    xpath//*[text()="Others' Subjects"]
    Should Contain    xpath//td[text()='Operating Systems']    Operating Systems

    # List of All Teachers
    Click Element    xpath//*[text()='List of All Teachers']
    ${tr_element}=    Get WebElement    xpath//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']
    ${td_elements}=    Get WebElements    xpath=.//td    parent=${tr_element}
    FOR    ${td}    IN    @{td_elements}
        Should Not Contain    ${td.text}    Operating Systems
    END

    Close Browser

Student Operations
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=loginPage.userNameInput    orange
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit

    Click Element    xpath//*[text()='Other Subjects']
    ${tr_elements}=    Get WebElements    xpath//tr
    FOR    ${tr}    IN    @{tr_elements}
        ${td_elements}=    Get WebElements    xpath=.//td    parent=${tr}
        ${operating_systems_present}=    Run Keyword And Return Status    Should Contain    ${td_elements[0].text}    Operating Systems
        ${peter_strict_present}=    Run Keyword And Return Status    Should Contain    ${td_elements[1].text}    Peter Strict
        Should Be True    not($operating_systems_present and $peter_strict_present)
    END

    Close Browser