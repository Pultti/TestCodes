*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary

*** Variables ***
${URL}            https://pultti.github.io/Web_Portfolio/StockTracker.html
${BROWSER}        Chrome
${API_URL}        https://www.alphavantage.com/stocks

*** Test Cases ***
Open Stock Tracker Page
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain    Investment Portfolio Tracker

Search For A Stock
    Input Text    id=stockSearch    AAPL
    Click Button    id=fetchPrice
    Wait Until Page Contains    Stock Price For AAPL

Add Investment
    Input Text    id=investmentName    Tesla
    Input Text    id=investmentAmount    5
    Click Button    id=addInvestment
    Page Should Contain    Tesla

Fetch Data From API
    Create Session    api    ${API_URL}
    ${response}=    Get Request    api    /data    params=${{'symbol': 'AAPL'}}
    Should Be Equal As Strings    ${response.status_code}    200
    ${content}=    To Json    ${response.content}
    Dictionary Should Contain Key    ${content}    price

*** Keywords ***
Wait Until Page Contains
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}    timeout=10s

To Json
    [Arguments]    ${content}
    ${json}=    Evaluate    json.loads("""${content}""")    json
    [Return]    ${json}