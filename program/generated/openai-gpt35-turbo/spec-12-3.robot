*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Accept Alert
    Open Browser  ${url}  chrome
    Set Viewport  1501  1104
    Click Element  xpath///*[@id="header.link.login"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  scatterbrained
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath///*[@id="tea.menu.myExamDates"]
    Click Element  xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]
    ${alert_text}=  Get Alert Text
    Confirm Alert
    Page Should Contain Element  xpath///*[@id="tea.myExamDates.successAlert"]
    Close Browser

Check No Records on Set Evaluation Page
    Open Browser  ${url}  chrome
    Set Viewport  1501  1104
    Click Element  xpath///*[@id="header.link.login"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  orange
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath///*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element  xpath///*[@id="tea.setEvaluation.form.noRecords"]
    Close Browser

Select Option on Evaluation Table Page and Verify Text
    Open Browser  ${url}  chrome
    Set Viewport  1501  1104
    Click Element  xpath///*[@id="header.link.login"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  orange
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath///*[@id="tea.menu.evaluationTable"]
    Select From List by Value  xpath///*[@id="tea.evalTable.filter.subjectSelect"]  1202
    Click Element  xpath///*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain Text  No exam dates for this subject
    Close Browser