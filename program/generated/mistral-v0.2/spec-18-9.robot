*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
@{teachers_names}     Julia Easyrider     Olivia Keen     John Lazy     Alice Pedant     Thomas Scatterbrained     Peter Strict

*** Test Cases ***
Verify_Teachers_Page
    [Documentation]     Verify the presence of specific teachers' names and the content of certain teacher's rows

    Set     browser    ${{Create Selenium Driver}}
    Go To    ${{Get 'url' From JSON}}

    [Teachers' Names Verification]
    For     ${name}    In    @{teachers_names}
        ${title}    =    Get Title
        ${name_xpath}    =    //*[contains(.,'${name}')]
        ${name_elem}    =    Element Should Exist    ${name_xpath}
        Should Be True    ${name_elem}
        ${title}    =    Clear Global Variable    title

    [Content Verification]
    ${row_0_text}    =    Element Should Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    ${row_1_text}    =    Element Should Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Should Be False    Element Should Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    Text
    ${row_3_text}    =    Element Should Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    ${row_4_text}    =    Element Should Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    ${row_5_text}    =    Element Should Contain    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

    ${browser}    .quit()