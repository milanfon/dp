*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Case ***
Open Page
    [Document]    ${url}
    [Set Variable]    url= http://localhost:4680/tbuis/index.jsp

Login
    [Click]    //*[@id="header.link.login"]
    [Set Variable]    ${username}= lazy
    [Set Variable]    ${password}= pass
    [Input]    #loginPage.userNameInput    ${username}
    [Input]    #loginPage.passwordInput    ${password}
    [Click]    #loginPage.loginFormSubmit
    [Wait]    ${title}    Contains    University information system

Check Teachers
    [Table]    | Teacher Name             | Expected Text                                                                                             |
    |-------------|-------------------------------------------------------------------------------------------------------------|
    | Julia Easyrider | Is                                                                                                        |
    | Olivia Keen | Is                                                                                                         |
    | John Lazy | Is                                                                                                         |
    | Alice Pedant | Is                                                                                                        |
    | Thomas Scatterbrained | Is                                                                                                        |
    | Peter Strict | Is                                                                                                        |

    [Table]    | Teacher Name             | Expected Text                                                                                             |
    |-------------|-------------------------------------------------------------------------------------------------------------|
    | Julia Easyrider | ${julia_easyrider_row}                                                                                      |
    | Olivia Keen | ${olivia_keen_row}                                                                                         |
    | John Lazy | ${john_lazy_row}                                                                                           |
    | Alice Pedant | ${alice_pedant_row}                                                                                       |
    | Thomas Scatterbrained | ${thomas_scatterbrained_row}                                                                               |
    | Peter Strict | ${peter_strict_row}                                                                                       |

    [Set Variable]    julia_easyrider_row= //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]
    [Set Variable]    olivia_keen_row= //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]
    [Set Variable]    john_lazy_row= //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]
    [Set Variable]    alice_pedant_row= //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]
    [Set Variable]    thomas_scatterbrained_row= //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]
    [Set Variable]    peter_strict_row= //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]

    [Table]    | Teacher Name             | Check Text                                                                                              |
    |-------------|-------------------------------------------------------------------------------------------------------------|
    | Julia Easyrider | Should Contain    Julia Easyrider                                                                         |
    |             | Should Contain Text Element    ${julia_easyrider_row}/td[2]    Contains    Julia Easyrider         |
    | Olivia Keen | Should Contain Text Element    ${olivia_keen_row}/td[2]    Contains    Olivia Keen                     |
    |             | Should Contain    Olivia Keen                                                                             |
    | John Lazy | Should Contain Text Element    ${john_lazy_row}/td[2]    Should Be Empty                                     |
    | Alice Pedant | Should Contain Text Element    ${alice_pedant_row}/td[2]    Contains    Alice Pedant                    |
    |             | Should Contain    Alice Pedant                                                                            |
    | Thomas Scatterbrained | Should Contain Text Element    ${thomas_scatterbrained_row}/td[2]    Contains    Thomas Scatterbrained |
    |             | Should Contain    Thomas Scatterbrained                                                                   |
    | Peter Strict | Should Contain Text Element    ${peter_strict_row}/td[2]    Contains    Peter Strict                    |
    |             | Should Contain    Peter Strict                                                                           |

    [Table]    | Teacher Name             | Check Text                                                                                              |
    |-------------|-------------------------------------------------------------------------------------------------------------|
    | Julia Easyrider | [Element]    ${julia_easyrider_row}/td[3]    Should Contain    Numerical Methods                             |
    | Olivia Keen | [Element]    ${olivia_keen_row}/td[3]    Should Contain    Numerical Methods, Database Systems, Fundamentals |
    |             |                             of Computer Networks, Introduction to Algorithms, Mobile Applications,          |
    |             |                             Web Programming                                                             |
    | John Lazy | [Element]    ${john_lazy_row}/td[3]    Should Be Empty                                                     |
    | Alice Pedant | [Element]    ${alice_pedant_row}/td[3]    Should Contain    Computer System Engineering, Database Systems,    |
    |             |                             Operating Systems, Programming Techniques                                    |
    | Thomas Scatterbrained | [Element]    ${thomas_scatterbrained_row}/td[3]    Should Contain    Computation Structures             |
    | Peter Strict | [Element]    ${peter_strict_row}/td[3]    Should Contain    Operating Systems, Programming in Java,         |
    |             |                             Software Engineering, Software Quality Assurance                             |

[Teardown]
    [Close Browser]