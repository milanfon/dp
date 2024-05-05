*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
@{url_student_view} http://localhost:4680/tbuis/student-view/otherSubjects
@{url_teacher_view} http://localhost:4680/tbuis/teacher-view/mySubjects

*** Test Case: Test student view and teacher view

*** Teardown ***
Close Browser

*** Test Case: Test student view

[Document]  Set Viewport  1501   1104   1   False   False   False
[Document]  Set Variable  ${student_url}    ${url_student_view}
[Document]  Navigate To    ${student_url}
[Document]  Click Element  //*[@id="header.link.login"]
[Document]  Set Variable  ${student_username}    maroon
[Document]  Set Variable  ${student_password}    pass
[Document]  Input Text    //*[@id="loginPage.userNameInput"]    ${student_username}
[Document]  Key Down      ${KEY_TAB}
[Document]  Key Up        ${KEY_TAB}
[Document]  Input Text    //*[@id="loginPage.passwordInput"]    ${student_password}
[Document]  Key Down      ${KEY_ENTER}
[Document]  Key Up        ${KEY_ENTER}
[Document]  Click Element  //*[@id="stu.menu.otherSubjects"]
[Document]  Click Element  //*[@id="stu.otherSubjects.table.enrollButton-10"]
[Document]  Click Element  //*[@id="stu.menu.mySubjects"]
[Document]  Wait Until Element Is Visible    //*[@id="stu.mySubjects.table.listOfSubjects"][1]//*[.="Software Quality Assurance"]/following-sibling::td[1]//*[.="Peter Strict"]
[Document]  Should Be    //*[@id="stu.mySubjects.table.listOfSubjects"][1]//*[.="Software Quality Assurance"]/following-sibling::td[1]//*[.="Peter Strict"]    Contains    Peter Strict

*** Test Case: Test teacher view

[Document]  Set Viewport  1501   1104   1   False   False   False
[Document]  Set Variable  ${teacher_url}    ${url_teacher_view}
[Document]  Navigate To    ${teacher_url}
[Document]  Click Element  //*[@id="header.link.login"]
[Document]  Set Variable  ${teacher_username}    strict
[Document]  Set Variable  ${teacher_password}    pass
[Document]  Input Text    //*[@id="loginPage.userNameInput"]    ${teacher_username}
[Document]  Input Text    //*[@id="loginPage.passwordInput"]    ${teacher_password}
[Document]  Key Down      ${KEY_ENTER}
[Document]  Key Up        ${KEY_ENTER}
[Document]  Click Element  //*[@id="tea.menu.mySubjects"]
[Document]  Click Element  //*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
[Document]  Should Contain  //*[@id="tea.mySubjects.table.listOfStudents"]//*[.="Students"]    Text    Students
[Document]  Should Contain  //*[@id="tea.mySubjects.table.listOfStudents"]//tr[3]/td[1]    Text    Willam Maroon

*** Test Case: Test student view (with delay)

[Document]  Set Viewport  1501   1104   1   False   False   False
[Document]  Set Variable  ${student_url}    ${url_student_view}
[Document]  Navigate To    ${student_url}
[Document]  Click Element  //*[@id="header.link.login"]
[Document]  Set Variable  ${student_username}    maroon
[Document]  Set Variable  ${student_password}    pass
[Document]  Input Text    //*[@id="loginPage.userNameInput"]    ${student_username}
[Document]  Key Down      ${KEY_TAB}
[Document]  Key Up        ${KEY_TAB}
[Document]  Input Text    //*[@id="loginPage.passwordInput"]    ${student_password}
[Document]  Key Down      ${KEY_ENTER}
[Document]  Key Up        ${KEY_ENTER}
[Document]  Sleep   3s
[Document]  Click Element  //*[@id="stu.menu.otherSubjects"]
[Document]  Click Element  //*[@id="stu.otherSubjects.table.enrollButton-10"]
[Document]  Click Element  //*[@id="stu.menu.mySubjects"]
[Document]  Wait Until Element Is Visible    //*[@id="stu.mySubjects.table.listOfSubjects"][1]//*[.="Software Quality Assurance"]/following-sibling::td[1]//*[.="Peter Strict"]
[Document]  Should Be    //*[@id="stu.mySubjects.table.listOfSubjects"][1]//*[.="Software Quality Assurance"]/following-sibling::td[1]//*[.="Peter Strict"]    Contains    Peter Strict

*** Test Case: Test teacher view (with delay)

[Document]  Set Viewport  1501   1104   1   False   False   False
[Document]  Set Variable  ${teacher_url}    ${url_teacher_view}
[Document]  Navigate To    ${teacher_url}
[Document]  Click Element  //*[@id="header.link.login"]
[Document]  Set Variable  ${teacher_username}    strict
[Document]  Set Variable  ${teacher_password}    pass
[Document]  Input Text    //*[@id="loginPage.userNameInput"]    ${teacher_username}
[Document]  Input Text    //*[@id="loginPage.passwordInput"]    ${teacher_password}
[Document]  Key Down      ${KEY_ENTER}
[Document]  Key Up        ${KEY_ENTER}
[Document]  Sleep   3s
[Document]  Click Element  //*[@id="tea.menu.mySubjects"]
[Document]  Click Element  //*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
[Document]  Should Contain  //*[@id="tea.mySubjects.table.listOfStudents"]//*[.="Students"]    Text    Students
[Document]  Should Contain  //*[@id="tea.mySubjects.table.listOfStudents"]//tr[3]/td[1]    Text    Willam Maroon