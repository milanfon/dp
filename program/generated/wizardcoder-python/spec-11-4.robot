**Settings**

Library | SeleniumLibrary
Library | Selenium2Library

**Variables**
${DELAY} | 2s

**Test Cases**
Test Case
    Open browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    ${DELAY}
    ${list}    Get Elements    xpath://*[@id="tea.mySubjects.table.listOfStudents"]//a
    ${count}    Get Length    ${list}
    Should Be True    ${count} > 0
    ${text}    Get Text    xpath://*[@id="tea.mySubjects.table.listOfStudents"]
    Should Contain    ${text}    Benjamin Green
    Should Contain    ${text}    Mia Orange
    Should Contain    ${text}    Charlotte Purple
    Should Contain    ${text}    Isabella Yellow
    Close Browser


**Keywords**
Get Elements
    [Arguments]    ${locator}
    ${elements}    Get Webelements    ${locator}
    [Return]    ${elements}

Get Text
    [Arguments]    ${locator}
    ${elements}    Get Elements    ${locator}
    ${text}    Get Text    ${elements}
    [Return]    ${text}

Get Elements
    [Arguments]    ${locator}
    ${elements}    Get Webelements    ${locator}
    [Return]    ${elements}

Get Text
    [Arguments]    ${elements}
    ${text}    Set Variable    ${EMPTY}
    ${count}    Get Length    ${elements}
    :FOR    ${index}    IN RANGE    ${count}
    \    ${text}    ${text}    Catenate    ${text}    ${elements[${index].text} }\n
    [Return]    ${text}

Close Browser
    Close Browser    ALL

**Explanation**
First, we import the Selenium2Library. Then we set the delay between steps to 2 seconds. Then we open the browser to the provided URL. After that, we click the login button, input the username and password, and login. Then we click the "My Subjects" button and the "Students" button. We close the modal and click the button with id "tea.mySubjects.table.listOfStudentsButton-2". We get the list of elements with the provided locator and check if the length of the list is greater than 0. We get the text of the list of elements and check if it contains the required names. Finally, we close the browser. 