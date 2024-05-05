 ```vbnet
*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***

*** Test Case ***
Check Students
    [Documentation]         Check if the page contains the names "Benjamin Green", "Mia Orange", "Charlotte Purple" and "Isabella Yellow"
    [Documentation]         and if the "No students" text is present

    [Setup]
    Set Up
    ${json} = JSON From String '{{ title: "spec 11", steps: [...'

    ${steps} = Evaluate '${json}["steps"]'

    [Teardown]
    Close Browser

    *** Step ***
    Set Up
    ${driver} = Create Webdriver
    ${driver}.Maximize_Window()
    ${driver}.Implicitly_Wait(30)

    *** Step ***
    Navigate To
    ${driver}.get('${steps[1]["url"]}')

    *** Step ***
    Click Element
    ${login_btn} = Element Should Be Visible In ${driver} *[id="header.link.login"]
    Click ${login_btn}

    *** Step ***
    Input Text
    ${username} = Input Text ${driver} *[id="loginPage.userNameInput"] "pedant"

    *** Step ***
    Input Text
    ${password} = Input Text ${driver} *[id="loginPage.passwordInput"] "pass"

    *** Step ***
    Click Element
    ${login_btn} = Element Should Be Visible In ${driver} *[id="loginPage.loginFormSubmit"]
    Click ${login_btn}

    *** Step ***
    Click Element
    ${subjects_btn} = Element Should Be Visible In ${driver} *[id="tea.menu.mySubjects"]
    Click ${subjects_btn}

    *** Step ***
    Click Element
    ${students_btn} = Element Should Be Visible In ${driver} *[id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click ${students_btn}

    *** Step ***
    Click Element
    ${cross_btn} = Element Should Be Visible In ${driver} *[id="closeModalButtonCross"]
    Click ${cross_btn}

    *** Step ***
    Click Element
    ${student_btn} = Element Should Be Visible In ${driver} *[id="tea.mySubjects.table.listOfStudentsButton-2"]
    Click ${student_btn}

    *** Step ***
    Element Should Contain
    ${no_students_text} = Get Text ${driver} *[tag_name="h2"][text="No students"]
    Should Contain ${no_students_text} "No students"

    *** Step ***
    Should Contain
    ${names} = Get Text ${driver} *[xpath="//tr[2]/td[2]/a"]
    Should Contain ${names} "Benjamin Green"
    Should Contain ${names} "Mia Orange"
    Should Contain ${names} "Charlotte Purple"
    Should Contain ${names} "Isabella Yellow"

    ${names2} = Get Text ${driver} *[xpath="//tr[3]/td[2]/a"]
    Should Contain ${names2} "Benjamin Green"
    Should Contain ${names2} "Mia Orange"
    Should Contain ${names2} "Charlotte Purple"
    Should Contain ${names2} "Isabella Yellow"

    ${names3} = Get Text ${driver} *[xpath="//tr[4]/td[2]/a"]
    Should Contain ${names3} "Benjamin Green"
    Should Contain ${names3} "Mia Orange"
    Should Contain ${names3} "Charlotte Purple"
    Should Contain ${names3} "Isabella Yellow"

    ${names4} = Get Text ${driver} *[xpath="//tr[5]/td[2]/a"]
    Should Contain ${names4} "Benjamin Green"
    Should Contain ${names4} "Mia Orange"
    Should Contain ${names4} "Charlotte Purple"
    Should Contain ${names4} "Isabella Yellow"

    ${names5} = Get Text ${driver} *[xpath="//tr[6]/td[2]/a"]
    Should Contain ${names5} "Benjamin Green"
    Should Contain ${names5} "Mia Orange"
    Should Contain ${names5} "Charlotte Purple"
    Should Contain ${names5} "Isabella Yellow"

    ${names6} = Get Text ${driver} *[xpath="//tr[7]/td[2]/a"]
    Should Contain ${names6} "Benjamin Green"
    Should Contain ${names6} "Mia Orange"
    Should Contain ${names6} "Charlotte Purple"
    Should Contain ${names6} "Isabella Yellow"

    ${names7} = Get Text ${driver} *[xpath="//tr[8]/td[2]/a"]
    Should Contain ${names7} "Benjamin Green"
    Should Contain ${names7} "Mia Orange"
    Should Contain ${names7} "Charlotte Purple"
    Should Contain ${names7} "Isabella Yellow"

    ${names8} = Get Text ${driver} *[xpath="//tr[9]/td[2]/a"]
    Should Contain ${names8} "Benjamin Green"
    Should Contain ${names8} "Mia Orange"
    Should Contain ${names8} "Charlotte Purple"
    Should Contain ${names8} "Isabella Yellow"

    ${names9} = Get Text ${driver} *[xpath="//tr[10]/td[2]/a"]
    Should Contain ${names9} "Benjamin Green"
    Should Contain ${names9} "Mia Orange"
    Should Contain ${names9} "Charlotte Purple"
    Should Contain ${names9} "Isabella Yellow"

    ${names10} = Get Text ${driver} *[xpath="//tr[11]/td[2]/a"]
    Should Contain ${names10} "Benjamin Green"
    Should Contain ${names10} "Mia Orange"
    Should Contain ${names10} "Charlotte Purple"
    Should Contain ${names10} "Isabella Yellow"

    ${names11} = Get Text ${driver} *[xpath="//tr[12]/td[2]/a"]
    Should Contain ${names11} "Benjamin Green"
    Should Contain ${names11} "Mia Orange"
    Should Contain ${names11} "Charlotte Purple"
    Should Contain ${names11} "Isabella Yellow"

    ${names12} = Get Text ${driver} *[xpath="//tr[13]/td[2]/a"]
    Should Contain ${names12} "Benjamin Green"
    Should Contain ${names12} "Mia Orange"
    Should Contain ${names12} "Charlotte Purple"
    Should Contain ${names12} "Isabella Yellow"

    ${names13} = Get Text ${driver} *[xpath="//tr[14]/td[2]/a"]
    Should Contain ${names13} "Benjamin Green"
    Should Contain ${names13} "Mia Orange"
    Should Contain ${names13} "Charlotte Purple"
    Should Contain ${names13} "Isabella Yellow"

    ${names14} = Get Text ${driver} *[xpath="//tr[15]/td[2]/a"]
    Should Contain ${names14} "Benjamin Green"
    Should Contain ${names14} "Mia Orange"
    Should Contain ${names14} "Charlotte Purple"
    Should Contain ${names14} "Isabella Yellow"

    ${names15} = Get Text ${driver} *[xpath="//tr[16]/td[2]/a"]
    Should Contain ${names15} "Benjamin Green"
    Should Contain ${names15} "Mia Orange"
    Should Contain ${names15} "Charlotte Purple"
    Should Contain ${names15} "Isabella Yellow"

    ${names16} = Get Text ${driver} *[xpath="//tr[17]/td[2]/a"]
    Should Contain ${names16} "Benjamin Green"
    Should Contain ${names16} "Mia Orange"
    Should Contain ${names16} "Charlotte Purple"
    Should Contain ${names16} "Isabella Yellow"

    ${names17} = Get Text ${driver} *[xpath="//tr[18]/td[2]/a"]
    Should Contain ${names17} "Benjamin Green"
    Should Contain ${names17} "Mia Orange"
    Should Contain ${names17} "Charlotte Purple"
    Should Contain ${names17} "Isabella Yellow"

    ${names18} = Get Text ${driver} *[xpath="//tr[19]/td[2]/a"]
    Should Contain ${names18} "Benjamin Green"
    Should Contain ${names18} "Mia Orange"
    Should Contain ${names18} "Charlotte Purple"
    Should Contain ${names18} "Isabella Yellow"

    ${names19} = Get Text ${driver} *[xpath="//tr[20]/td[2]/a"]
    Should Contain ${names19} "Benjamin Green"
    Should Contain ${names19} "Mia Orange"
    Should Contain ${names19} "Charlotte Purple"
    Should Contain ${names19} "Isabella Yellow"

    ${names20} = Get Text ${driver} *[xpath="//tr[21]/td[2]/a"]
    Should Contain ${names20} "Benjamin Green"
    Should Contain ${names20} "Mia Orange"
    Should Contain ${names20} "Charlotte Purple"
    Should Contain ${names20} "Isabella Yellow"

    ${names21} = Get Text ${driver} *[xpath="//tr[22]/td[2]/a"]
    Should Contain ${names21} "Benjamin Green"
    Should Contain ${names21} "Mia Orange"
    Should Contain ${names21} "Charlotte Purple"
    Should Contain ${names21} "Isabella Yellow"

    ${names22} = Get Text ${driver} *[xpath="//tr[23]/td[2]/a"]
    Should Contain ${names22} "Benjamin Green"
    Should Contain ${names22} "Mia Orange"
    Should Contain ${names22} "Charlotte Purple"
    Should Contain ${names22} "Isabella Yellow"

    ${names23} = Get Text ${driver} *[xpath="//tr[24]/td[2]/a"]
    Should Contain ${names23} "Benjamin Green"
    Should Contain ${names23} "Mia Orange"
    Should Contain ${names23} "Charlotte Purple"
    Should Contain ${names23} "Isabella Yellow"

    ${names24} = Get Text ${driver} *[xpath="//tr[25]/td[2]/a"]
    Should Contain ${names24} "Benjamin Green"
    Should Contain ${names24} "Mia Orange"
    Should Contain ${names24} "Charlotte Purple"
    Should Contain ${names24} "Isabella Yellow"

    ${names25} = Get Text ${driver} *[xpath="//tr[26]/td[2]/a"]
    Should Contain ${names25} "Benjamin Green"
    Should Contain ${names25} "Mia Orange"
    Should Contain ${names25} "Charlotte Purple"
    Should Contain ${names25} "Isabella Yellow"

    ${names26} = Get Text ${driver} *[xpath="