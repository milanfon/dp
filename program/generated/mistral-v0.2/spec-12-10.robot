 ```python
*** Settings ***
Library                SeleniumLibrary
Browser                Chrome

*** Test Cases ***

Test My Exam Dates - Teacher
    [Documentation]    Test My Exam Dates functionality as a teacher

    [Preparation]      Open browser

    Open Page
        **Url**      http://localhost:4680/tbuis/index.jsp

    [Login]
    Login
        **Username**      scatterbrained
        **Password**      pass

    [Navigation]
    Go To
        **Url**      http://localhost:4680/tbuis/teacher-view/myExamDates

    [Actions]
    Click Button
        **Name**      X
        **Target**     //button[@id='tea.myExamDates.table.cancelButton-0-0']

    [Verification]
    Expected Alert Text
        **Text**      (Alert text when the button is clicked)

    [Verification]
    Title Contains
        **Title**      My Exam Dates

    [Verification]
    Element Is Visible
        **Element**      //div[@id='tea.myExamDates.successAlert']

    [Navigation]
    Go To
        **Url**      http://localhost:4680/tbuis/teacher-view/setEvaluation

    [Verification]
    Element Is Visible
        **Element**      //div[@id='tea.setEvaluation.form.noRecords']

    [Navigation]
    Go To
        **Url**      http://localhost:4680/tbuis/teacher-view/evaluationTable

    [Actions]
    Select From List
        **Select**      //option[@value='-1']
        **Target**      //select[@id='tea.evalTable.filter.subjectSelect']

    [Actions]
    Click Button
        **Name**      Filter
        **Target**     //button[@id='tea.evalTable.filter.submitButton']

    [Verification]
    Text Should Be
        **Find Text**      //div[@class='tea-evalTable-filter-results']
        **Value**      No exam dates for this subject

    [Teardown]
    Close Browser

Test My Exam Dates - Student
    [Documentation]    Test My Exam Dates functionality as a student

    [Preparation]      Open browser

    Open Page
        **Url**      http://localhost:4680/tbuis/index.jsp

    [Login]
    Login
        **Username**      orange
        **Password**      pass

    [Navigation]
    Go To
        **Url**      http://localhost:4680/tbuis/student-view/myExamDates

    [Verification]
    Text Should Not Be Present
        **Find Text**      //div[@class='tea-evalTable-filter-results']
        **Value**      Computation Structures

    [Teardown]
    Close Browser

*** Keywords ***

Login
    [Arguments]    {
        **"Username":**    "",
        **"Password":**    "",
    }
    [Return]    None
    [Documentation]    Logs in to the application

    [Actions]
    Input Text
        **Find By**      aria/Username
        **Value**      **{Username}**

    [Actions]
    Input Text
        **Find By**      aria/Password
        **Value**      **{Password}**

    [Actions]
    Click Button
        **Find By**      aria/Login[role="button"]

Click Button
    [Arguments]    {
        **"Name":**      "",
        **"Target":**    "",
    }
    [Return]    None
    [Documentation]    Clicks a button

    [Actions]
    Click Element
        **Target**      **{Target}**

Go To
    [Arguments]    {
        **"Url":**      "",
    }
    [Return]    None
    [Documentation]    Navigates to a URL

    [Actions]
    Go To
        **Url**      **{Url}**

Text Should Not Be Present
    [Arguments]    {
        **"Find Text":**    "",
        **"Value":**    "",
    }
    [Return]    None
    [Documentation]    Verifies that a specific text is not present

    [Verification]
    [Condition]    ${{Find Text}} == None

Text Should Be
    [Arguments]    {
        **"Find Text":**    "",
        **"Value":**    "",
    }
    [Return]    None
    [Documentation]    Verifies that a specific text is present

    [Verification]
    [Condition]    ${{Find Text}} == **{Value}**

Element Is Visible
    [Arguments]    {
        **"Element":**    "",
    }
    [Return]    None
    [Documentation]    Verifies that an element is visible

    [Verification]
    [Condition]    ${{Element Is Visible}}

Title Contains
    [Arguments]    {
        **"Title":**    "",
    }
    [Return]    None
    [Documentation]    Verifies that a page title contains a specific text

    [Verification]
    [Condition]    ${{Get Title}}.find('{Title}') != None

Close Browser
    [Return]    None
    [Documentation]    Closes the currently open browser

Input Text
    [Arguments]    {
        **"Find By":**    "",
        **"Value":**    "",
    }
    [Return]    None
    [Documentation]    Sets the value of an input field

    [Actions]
    [Modify]    ${{Value}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('"', '\\"')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\n', '\\n')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\r', '\\r')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\t', '\\t')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\b', '\\b')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\f', '\\f')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\v', '\\v')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\x08', '\\x08')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\x03', '\\x03')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\x02', '\\x02')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\x01', '\\x01')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\x00', '\\x00')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0000', '\\u0000')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0001', '\\u0001')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0002', '\\u0002')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0003', '\\u0003')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0004', '\\u0004')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0005', '\\u0005')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0006', '\\u0006')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0007', '\\u0007')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u000E', '\\u000E')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u000F', '\\u000F')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0010', '\\u0010')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0011', '\\u0011')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0012', '\\u0012')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0013', '\\u0013')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0014', '\\u0014')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0015', '\\u0015')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0016', '\\u0016')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0017', '\\u0017')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0018', '\\u0018')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u0019', '\\u0019')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u001A', '\\u001A')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u001B', '\\u001B')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u001C', '\\u001C')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u001D', '\\u001D')}}

    [Actions]
    [Modify]    ${{Value}}
        ${{Value}} = ${{Value.replace('\u001E', '\\u001E')}}

    [Actions]
    [Modify]    ${{Value