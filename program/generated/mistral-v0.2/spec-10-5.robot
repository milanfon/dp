*** Settings ***
Library           SeleniumLibrary
Browser           Chrome

*** Variables ***
URL = http://localhost:4680/tbuis/index.jsp

*** Test Case: Teacher Scenario ***

@Setup
@Tags     teacher
@Preparation
Set UpBrowser
Set Viewport 1501 1104

[Teaser] Teacher Scenario

*** Test Steps ***

# Open page
Navigate To ${URL}

# Login
Input Text    #loginPage.userNameInput    user
Input Text    #loginPage.passwordInput    pass
Click Button  #loginPage.loginFormSubmit

# Go to My Subjects page
Click Button    #tea.menu.mySubjects

# Check if "Remove" buttons are disabled before clicking "Remove"
[Condition]    ${disabled_buttons} = ${Count Elements|//div[@class='table-actions']//button[@disabled='disabled'] and text()='Remove'}
    ${disabled_buttons} > 0
    [Log]    |INFO| Disabled "Remove" buttons: ${disabled_buttons}

# Click "Remove" and check if success alert appears
Click Button    #tea.mySubjects.table.unregisterSubjectButton-0
Wait Until Page Contains    tea.mySubjects.successAlert

# Go to My Exam Dates page
Click Button    #tea.menu.myExamDates

# Check if "Operating Systems" <th> is not present
[Condition]    ${th_present} = ${Count Elements|//th[.='Operating Systems']}
    ${th_present} == 0

# Check if "Operating Systems" <option> is not present in New Exam Dates
[Condition]    ${option_present} = ${Count Elements|//option[.='Operating Systems']|#newExamDates}
    ${option_present} == 0

# Go to Set Evaluation page
Click Button    #tea.menu.setEvaluation

# Check if "Operating Systems" <option> is not present
[Condition]    ${option_present} = ${Count Elements|//option[.|='Operating Systems']|#evaluationForm}
    ${option_present} == 0

# Go to Evaluation Table page
Click Button    #tea.menu.evaluationTable

# Check if "Operating Systems" <option> is not present
[Condition]    ${option_present} = ${Count Elements|//option[.|='Operating Systems']|#evaluationTable}
    ${option_present} == 0

# Go to Others' Subjects page
Click Button    #tea.menu.otherSubjects

# Check if "Operating Systems" <td> is present
[Condition]    ${td_present} = ${Count Elements|//td[.='Operating Systems']}
    ${td_present} > 0

# Go to List of All Teachers page
Click Button    #tea.menu.listOfAllTeachers

# Check if "Operating Systems" is not present in the same <tr> as "Operating Systems" in List of All Teachers
[Condition]    ${no_peter_strict} = ${Not Element Exist|//tr[.//td[.='Operating Systems']]/td[.='Peter Strict']}
    ${no_peter_strict}

# Close browser
Close Browser

# Logout
Click Button    #header.link.logout

*** Test Case: Student Scenario ***

@Setup
@Tags     student
@Preparation
Set UpBrowser
Set Viewport 1501 1104

[Teaser] Student Scenario

*** Test Steps ***

# Open page
Navigate To ${URL}

# Login
Input Text    #loginPage.userNameInput    student
Input Text    #loginPage.passwordInput    student_password
Click Button  #loginPage.loginFormSubmit

# Go to Other Subjects page
Click Button    #stu.menu.otherSubjects

# Check if "Peter Strict" is not present in the same <tr> as "Operating Systems"
[Condition]    ${no_peter_strict} = ${Not Element Exist|//tr[.//td[.='Operating Systems']]/td[.='Peter Strict']}
    ${no_peter_strict}

# Close browser
Close Browser

# Logout
Click Button    #header.link.logout