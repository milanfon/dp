*** Settings ***
Library    SeleniumLibrary   

*** Test Cases ***
spec 10 teacher
    Open Browser    http://localhost:4680    Chrome
    Maximize Browser Window
    Input Text    //*[@id="loginPage.userNameInput"]    strict
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Element    //*[@id="loginPage.loginFormSubmit"]
    Click Element    //*[@id="tea.menu.mySubjects"]
    Click Element    //*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Click Element    //*[@id="tea.menu.myExamDates"]
    Click Element    //*[@id="tea.menu.newExamDates"]
    Click Element    //*[@id="tea.menu.setEvaluation"]
    Click Element    //*[@id="tea.menu.evaluationTable"]
    Click Element    //*[@id="tea.menu.otherSubjects"]
    Click Element    //*[@id="tea.menu.listOfAllTeachers"]
    Click Element    //*[@id="header.logout"]
    Close Browser


spec 10 student
    Open Browser    http://localhost:4680    Chrome
    Maximize Browser Window
    Input Text    //*[@id="loginPage.userNameInput"]    orange
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Element    //*[@id="loginPage.loginFormSubmit"]
    Click Element    //*[@id="stu.menu.otherSubjects"]
    Click Element    //*[@id="header.logout"]
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${URL}    ${BROWSER}
    ${driver}    Open Browser    ${URL}    ${BROWSER}
    ${current_url}    Get Location
    Should Be Equal    ${current_url}    ${URL}

Click Element
    [Arguments]    ${XPATH}
    ${elements}    Get Webelements    ${XPATH}
    ${count}    Get Length    ${elements}
    ${index}    Set Variable    ${count}
    ${index}    Evaluate    ${index} - 1
    Wait Until Keyword Succeeds   10s    1s    Element Should Be Visible    ${XPATH}
    Click Element    xpath=(//*[@id="tea.mySubjects.table.unregisterSubjectButton-0")[${index}]
    Click Element    ${XPATH}

Input Text
    [Arguments]    ${XPATH}    ${TEXT}
    Wait Until Element Is Visible    ${XPATH}
    Input Text    ${XPATH}    ${TEXT}

Close Browser
    Close Browser

Get Location
    ${current_url}    Get Location
    [Return]    ${current_url}

Get Title
    ${title}    Get Title
    [Return]    ${title}

Get Webelements
    [Arguments]    ${XPATH}
    ${elements}    Get Webelements    ${XPATH}
    [Return]    ${elements}

Element Should Be Visible
    [Arguments]    ${XPATH}
    Wait Until Element Is Visible    ${XPATH}

Element Should Be Disabled
    [Arguments]    ${XPATH}
    Wait Until Element Is Disabled    ${XPATH}

Element Should Not Be Visible
    [Arguments]    ${XPATH}
    Wait Until Element Is Not Visible    ${XPATH}

Element Should Not Be Disabled
    [Arguments]    ${XPATH}
    Wait Until Element Is Not Disabled    ${XPATH}

Element Should Not Contain
    [Arguments]    ${XPATH}    ${TEXT}
    Wait Until Element Contains    ${XPATH}    ${TEXT}
    Element Should Not Contain    ${XPATH}    ${TEXT}

Element Should Contain
    [Arguments]    ${XPATH}    ${TEXT}
    Wait Until Element Contains    ${XPATH}    ${TEXT}
    Element Should Contain    ${XPATH}    ${TEXT}

Element Should Not Contain Element
    [Arguments]    ${XPATH}    ${TEXT}
    Wait Until Element Contains    ${XPATH}    ${TEXT}
    Element Should Not Contain Element    ${XPATH}    ${TEXT}

Element Should Contain Element
    [Arguments]    ${XPATH}    ${TEXT}
    Wait Until Element Contains    ${XPATH}    ${TEXT}
    Element Should Contain Element    ${XPATH}    ${TEXT}