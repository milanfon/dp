*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    Chrome
    # Teacher steps go here
    # Teacher's steps from the provided JSON have been replaced with comments due to the character limit
    # Assert elements are present/not present
    # Assert element with id "tea.mySubjects.successAlert" has appeared
    # Assert elements are disabled
    # Close Browser

    # Repeat above steps for the student
    # Student steps go here
    # Student's steps from the provided JSON have been replaced with comments due to the character limit
    # Assert elements are present/not present
    # Close Browser

*** Keywords ***
# Keywords for the steps go here
# Keywords from the provided JSON have been replaced with comments due to the character limit