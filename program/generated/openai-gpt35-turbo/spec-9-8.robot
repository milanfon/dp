*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Example Test
    Open Browser    ${url}    Chrome
    Set Viewport    1501    1104
    Wait Until Page Contains Element    stu.myExamDates.participantsModal.title    timeout=10s
    Wait Until Page Contains    <td>Benjamin Green</td>    timeout=10s
    Wait Until Page Contains    <td>Mia Orange</td>    timeout=10s
    Wait Until Page Contains    <td>Charlotte Purple</td>    timeout=10s
    Wait Until Page Contains    <td>Isabella Yellow</td>    timeout=10s
    Close Browser