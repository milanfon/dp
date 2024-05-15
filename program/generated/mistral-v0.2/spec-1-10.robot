*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Test Cases ***

Scenario 1
    [Document]                                         # JSON recording for Noah Brown
    [Set]                                              ${JSON_RE recording_1}
    ${JSON_EXTRACT}                                    ${JSON_RE recording_1} steps

    [Step]                                              Wait                                                   1s

    [Step]                                              ${ElementShouldNotExist}                                    id=header.link.login

    [Step]                                              ${ElementShouldContain}                                    id=header.title.userHome                                     text=Noah Brown

    [Step]                                              ${ElementShouldExist}                                     id=header.link.logout

    [Step]                                              ${ElementShouldExist}                                     #header.student-view-nav

    [Step]                                              ${ElementShouldContain}                                    id=stu.view.title                                             text=Student's View

    [Step]                                              ${ElementShouldExist}                                     id=overview.personalInfoForm

    Scenario 2
    [Document]                                         # JSON recording for John Lazy
    [Set]                                              ${JSON_RE recording_2}
    ${JSON_EXTRACT}                                    ${JSON_RE recording_2} steps

    [Step]                                              Wait                                                   1s

    [Step]                                              ${ElementShouldNotExist}                                    id=header.link.login

    [Step]                                              ${ElementShouldContain}                                    id=header.title.userHome                                     text=John Lazy

    [Step]                                              ${ElementShouldExist}                                     id=header.link.logout

    [Step]                                              ${ElementShouldExist}                                     #header.teacher-view-nav

    [Step]                                              ${ElementShouldContain}                                    id=tea.view.title                                              text=Teacher's View

    [Step]                                              ${ElementShouldExist}                                     id=overview.personalInfoForm

    [Step]                                              ${ElementShouldNotExist}                                    id=loginPage.errorAlert

    Scenario 3
    [Step]                                              ${ElementShouldNotExist}                                    id=header.link.login

    [Step]                                              ${ClickKeyboard}                                         [tab]

    [Step]                                              ${ElementShouldExist}                                     id=header.link.login

    [Step]                                              ${InputText}                                            id=header.link.login                                            text=bla

    [Step]                                              ${ElementShouldExist}                                     id=loginPage.passwordInput

    [Step]                                              ${InputText}                                            id=loginPage.passwordInput                                        text=pass

    [Step]                                              ${ElementShouldExist}                                     id=loginPage.loginFormSubmit

    [Step]                                              ${ClickElement}                                          id=loginPage.loginFormSubmit

    [Step]                                              ${ElementShouldBeVisible}                                 id=loginPage.errorAlert

    [Step]                                              ${ElementShouldNotExist}                                    id=loginPage.errorAlert

    [Step]                                              ${InputText}                                            id=header.link.login                                            text=lazy

    [Step]                                              ${ElementShouldExist}                                     id=loginPage.passwordInput

    [Step]                                              ${InputText}                                            id=loginPage.passwordInput                                        text=bla

    [Step]                                              ${ElementShouldExist}                                     id=loginPage.loginFormSubmit

    [Step]                                              ${ClickElement}                                          id=loginPage.loginFormSubmit

    [Step]                                              ${ElementShouldBeVisible}                                 id=loginPage.errorAlert

    [Step]                                              ${ElementShouldNotExist}                                    id=loginPage.errorAlert

*** Keywords ***

*** Variables ***

*** Custom Keywords ***

ElementShouldNotExist
    [Arguments]    ${locator}
    [Document]     SeleniumLibrary.ElementShouldNotExist

ElementShouldExist
    [Arguments]    ${locator}
    [Document]     SeleniumLibrary.ElementShouldExist

ElementShouldContain
    [Arguments]    ${locator}    ${text}
    [Document]     SeleniumLibrary.ElementShouldContain

ClickElement
    [Arguments]    ${locator}
    [Document]     SeleniumLibrary.ClickElement

ClickKeyboard
    [Arguments]    ${key}
    [Document]     SeleniumLibrary.ClickKeyboard

InputText
    [Arguments]    ${locator}    ${text}
    [Document]     SeleniumLibrary.InputText

TextShouldEqual
    [Arguments]    ${locator}    ${expected_text}
    [Document]     SeleniumLibrary.TextShouldEqual

TextShouldContain
    [Arguments]    ${locator}    ${text}
    [Document]     SeleniumLibrary.TextShouldContain

Wait
    [Arguments]    ${time}
    [Document]     SeleniumLibrary.Wait

*** Functions ***

JSON_EXTRACT
    [Arguments]    ${json}    ${path}
    [Document]     SeleniumLibrary.RunKeywordIf     ${json_length}    ${len}    ${json}
    [Document]     ${json_length}    ${len}    ${json}
    ${If}    ${len}    >    0
    ${json_extract}    ${json}    ${path}
    ${EndIf}

JSON_LENGTH
    [Arguments]    ${json}
    [Document]     JSON    ${json}    length

*** Keywords Library ***

SeleniumLibrary

*** Variables Library ***

*** Keywords File ***

*** Test Library ***

*** Suites ***

*** Cases ***

*** Run ***
    [Document]     Run Keywords    Scenario 1
    [Document]     Run Keywords    Scenario 2
    [Document]     Run Keywords    Scenario 3

*** Teardown ***
    [Document]     Close Browser

*** Copyright ***
    Copyright     2023    Intelligent Programming Assistant