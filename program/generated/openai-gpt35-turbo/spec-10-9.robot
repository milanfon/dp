*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario 1: Perform actions as a teacher
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

    Click Element    aria=Login
    Input Text    aria=Username    strict
    Input Text    aria=Password    pass
    Click Element    aria=Login[role="button"]
    Sleep    2

    Click Element    aria=My Subjects
    Sleep    2
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2

    Click Element    aria=My Exam Dates
    Sleep    2

    Click Element    aria=New Exam Dates
    Sleep    2

    Click Element    aria=Set Evaluation
    Sleep    2

    Click Element    aria=Evaluation Table
    Sleep    2

    Click Element    aria=Others' Subjects
    Sleep    2

    Click Element    aria=List of All Teachers
    Sleep    2

    Close Browser

Scenario 2: Perform actions as a student
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

    Click Element    aria=Login
    Input Text    aria=Username    orange
    Input Text    aria=Password    pass
    Click Element    aria=Login[role="button"]
    Sleep    2

    Click Element    aria=Other Subjects
    Sleep    2

    Close Browser