*** Settings ***
Library           SeleniumLibrary
SeleniumBrowser   Chrome

*** Variables ***

*** Test Cases ***

Test Check Students
    [Documentation]     Check if names "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow" are present on the page

    [Setup]
    Set Viewport 1501, 1104, 1
    Set Browser Implicit Wait 10

    [Actions]
    Navigate To http://localhost:4680/tbuis/index.jsp
    Click Element xpath//*[@id="header.link.login"]
    Input Text #loginPage.userNameInput pierce
    Input Text #loginPage.passwordInput pass
    Click Element xpath//*[@id="loginPage.loginFormSubmit"]
    Click Element xpath//*[@id="tea.menu.mySubjects"]
    Click Element xpath//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

    [Conditions]
    Should Element Exist xpath//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

    [Teardown]
    Click Element xpath//*[@id="closeModalButtonCross"]
    Close Browser

    [Checks]
    [Table]    | Name            | Expected | Found |
            |-----------------|----------|-------|
            | Benjamin Green   | True     |      |
            | Mia Orange      | True     |      |
            | Charlotte Purple | True     |      |
            | Isabella Yellow | True     |      |
            | No students     | True     |      |

            [Documentation]     Check if the text "No students" is present on the page
            Get Text Element xpath//*[@class="dataTables_empty"]
            Should Contain Variable Text Equal ${Text}

            [Documentation]     Check if the names "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow" are present on the page
            ${names} =    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
            ${present} =    List Created    ${names}
            ${present_on_page} =    List Created    ${present}
            ${i} =    Variable    ${ITERATE_VAR}
            ${name} =    List Get    ${present_on_page}    ${ITERATE_KEY}
            ${name_on_page} =    Get Text    Element    xpath=//*[contains(text(),${name})]
            Should Contain    ${name_on_page}    ${name}
            Set Variable    ITERATE_KEY    ${ITERATE_KEY} + 1
            Should Be True    ${ITERATE_KEY}  lt    ${length}

    [Teardown]
    Close Browser