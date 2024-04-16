*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Verify Elements
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=stu.myExamDates.participantsModal.title    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='Benjamin Green']    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='Mia Orange']    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='Charlotte Purple']    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='Isabella Yellow']    timeout=10s
    Close Browser