*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${delay}    ${1}
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Student
    Open Browser    ${URL}    ${BROWSER}
    Input Text    //*[@id="loginPage.userNameInput"]    gray
    Input Password    //*[@id="loginPage.passwordInput"]    pass
    Click Element    //*[@id="header.link.login"]
    Sleep    ${delay}
    Click Element    //*[@id="stu.menu.mySubjects"]
    Sleep    ${delay}
    Click Element    //*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    ${delay}
    Click Element    //*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    ${delay}
    ${is_present}    Run Keyword and Return Status    Element Should Be Visible    //*[@id="stu.mySubjects.successAlert"]
    Should Be True    ${is_present}
    ${is_present}    Run Keyword and Return Status    Element Should Be Visible    //*[@id="stu.mySubjects.enrolledTable.Title"]
    Should Be True    ${is_present}
    ${is_present}    Run Keyword and Return Status    Element Should Not Be Visible    //td[contains(text(), "Database Systems")]
    Should Be True    ${is_present}
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    browser=${browser}