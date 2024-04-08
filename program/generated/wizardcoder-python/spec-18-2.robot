*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Test
    Open Browser  http://localhost:4680/tbuis/login  chrome
    Input Text  id:loginPage.userNameInput  lazy
    Input Text  id:loginPage.passwordInput  pass
    Click Element  id:loginPage.loginFormSubmit
    Click Element  id:tea.menu.listOfAllTeachers
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[1]  # Check if names are present
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[1]  # Check if names are present
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[1]  # Check if names are present
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[1]  # Check if names are present
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[1]  # Check if names are present
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[1]  # Check if names are present
    ${text1}=  Get Text  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]  # Get the text of the first element
    ${text2}=  Get Text  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]  # Get the text of the second element
    ${text3}=  Get Text  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]  # Get the text of the fourth element
    ${text4}=  Get Text  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]  # Get the text of the fifth element
    ${text5}=  Get Text  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]  # Get the text of the sixth element
    Should Be Equal  ${text1}  Numerical Methods  # Check the text of the first element
    Should Be Equal  ${text2}  Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming  # Check the text of the second element
    Should Be Equal  ${text3}  ${EMPTY}  # Check the text of the third element
    Should Be Equal  ${text4}  Computer System Engineering, Database Systems, Operating Systems, Programming Techniques  # Check the text of the fifth element
    Should Be Equal  ${text5}  Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance  # Check the text of the sixth element
    Close Browser