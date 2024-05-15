*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
${base_url}      http://localhost:4680/tbuis/

*** Test Cases ***
Verify_Teacher_Page

*** Tasks ***
Verify_Teacher_Page:
    [Documentation]    Verify presence of teachers and correct course names

    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False

    Open Browser    ${base_url}/index.jsp

    Login
    [Actions]    Set Text    //input[@id='loginPage.userNameInput']    lazy
    Set Text    //input[@id='loginPage.passwordInput']    pass
    Click Element    //button[@id='loginPage.loginFormSubmit']

    Click Element    //a[@aria='List of All Teachers']

    [Teachers Verification]
    ${teachers} =    Get Elements    //tr[@role='row']
    ${teacher_names} =    [    ]

    For    ${teacher} in ${teachers}
        ${teacher_name} =    Get Text    //td[@role='gridcell']    ${teacher}
        ${teacher_names} =    |Append|    ${teacher_names}    ${teacher_name}
    End

    [Check Teacher Names]
    ${names_to_check} =    [    "Julia Easyrider"    "Olivia Keen"    "John Lazy"    "Alice Pedant"    "Thomas Scatterbrained"    "Peter Strict"    ]

    Should Contain    ${teacher_names}    ${names_to_check}

    [Course Verification]
    ${course_names} =    [    ]

    For    ${index} in range(len(${teachers}))
        ${course} =    Get Text    //td[@role='gridcell'][${index}]/following-sibling::td[3]
        ${course_names} =    |Append|    ${course_names}    ${course}
    End

    [Check Course Names]
    ${course_names_to_check} =    [    "Numerical Methods"    "Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming"    ""    "Computer System Engineering, Database Systems, Operating Systems, Programming Techniques"    "Computation Structures"    "Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance"    ]

    Should Contain    ${course_names}    ${course_names_to_check}

    Close Browser

Login:
    [Actions]    Set Text    //input[@id='loginPage.userNameInput']    ${env:USER}
    Set Text    //input[@id='loginPage.passwordInput']    ${env:PASS}
    Click Element    //button[@id='loginPage.loginFormSubmit']