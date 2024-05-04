*** Settings ***
Library    SeleniumLibrary   
Library    Collections

*** Variables ***
${BROWSER}    Chrome
${DELAY}     0
${URL}    http://localhost:4680

*** Keywords ***
Open Chrome
    Open Browser    ${URL}    browser=${BROWSER}
    Maximize Browser Window

*** Test Cases ***
Teacher's View
    Open Chrome
    Login
    Open My Subjects
    Open My Exam Dates
    Open New Exam Dates
    Open Set Evaluation
    Open Evaluation Table
    Open Other's Subjects
    Open List of All Teachers
    [Teardown]    Close Browser

Student's View
    Open Chrome
    Login as Student
    Open Other Subjects
    [Teardown]    Close Browser

*** Keywords ***
Login
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit

Login as Student
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit

Open My Subjects
    Click Link    My Subjects
    Click Element    id:tea.mySubjects.table.unregisterSubjectButton-0
    Sleep    ${DELAY}
    Element Should Be Disabled    xpath://*[contains(@class,'disabled')]
    Click Element    xpath://*[contains(@class,'disabled')
    Sleep    ${DELAY}
    Element Should Be Visible    id:tea.mySubjects.successAlert
    Element Should Be Visible    id:tea.mySubjects.successAlert

Open My Exam Dates
    Click Link    My Exam Dates
    Element Should Not Be Visible    xpath://th[.='Operating Systems']

Open New Exam Dates
    Click Link    New Exam Dates
    Element Should Not Be Visible    xpath://option[.='Operating Systems']

Open Set Evaluation
    Click Link    Set Evaluation
    Element Should Not Be Visible    xpath://option[.='Operating Systems']

Open Evaluation Table
    Click Link    Evaluation Table
    Element Should Not Be Visible    xpath://option[.='Operating Systems']

Open Other's Subjects
    Click Link    Others' Subjects
    Element Should Not Be Visible    xpath://option[.='Operating Systems']

Open List of All Teachers
    Click Link    List of All Teachers
    Element Should Not Be Visible    xpath://td[.='Operating Systems']

Open Other Subjects
    Click Link    Other Subjects
    Element Should Not Be Visible    xpath://td[.='Operating Systems']
    Element Should Not Contain    xpath://tr[contains(.,'Peter Strict')]    Operating Systems


*** Test Teardown ***
    Close Browser

*** Test Teardown ***
    Close Browser   

```

Note: This scenario assumes that you have installed SeleniumLibrary and have Chrome installed and set as your default browser. 


Please install SeleniumLibrary: `pip install robotframework-seleniumlibrary`


To run the scenario: `robot -d output -v browser:chrome -v url:http://localhost:4680/ -v delay:0.5 -v username:strict -v password:pass -v username_student:orange -v password_student:pass spec_10.robot`


Replace `-v` parameters with your desired values. 

`browser` - your desired browser
`url` - your desired URL
`delay` - desired delay between steps
`username` - your desired username
`password` - your desired password
`username_student` - your desired username for student
`password_student` - your desired password for student



This scenario will open the website, perform the steps for both the teacher and the student, and perform the checks for each scenario. The checks will be done using the `Element Should` and `Element Should Not` keywords. The `Sleep` keyword will be used to add the desired delay between steps. 


You can adjust the delay to your desired value. 