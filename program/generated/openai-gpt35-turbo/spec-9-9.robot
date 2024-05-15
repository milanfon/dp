*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

    Wait Until Element Is Visible    id=stu.myExamDates.participantsModal.title    timeout=10s

    @{expected_names}    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    @{actual_names}    Get Texts    //td

    FOR    ${name}    IN    @{expected_names}
        Run Keyword If    '${name}' not in @{actual_names}    Fail    Element with text ${name} not found
    END

    Close Browser