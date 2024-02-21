*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://pultti.github.io/Web_Portfolio/
${BROWSER}        Chrome

*** Test Cases ***
Verify Page Title
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Information about me

Verify Navigation Bar is Visible
    Page Should Contain Element    css=nav

Verify Content Sections are Present
    Page Should Contain    Who am I?
    Page Should Contain    Hobbies
    Page Should Contain    Objectives
    Page Should Contain    Skills
    Page Should Contain    Contact me:

 Verify WhatsApp Link Is Present
    Page Should Contain Element    css=a[href*="whatsapp"]

Verify Email Link Is Present
    Page Should Contain Element    css=a[href^="mailto:"]

Verify LinkedIn Link Is Present
    Page Should Contain Element    css=a[href*="linkedin"]

Verify GitHub Link Is Present
    Page Should Contain Element    css=a[href*="github"]

*** Keywords ***
Open Browser To HomePage
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    css=nav
    Close Browser