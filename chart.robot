*** Settings ***
Documentation  homepage
Library    SeleniumLibrary

*** Variables ***

${chart}    //*[@class="highcharts-series-group"]

# Header
${logo}    //a[@href="https://crypthub.vercel.app/"]
${login}    //*[@class="nav-end"]/button
${login_popup}    //*[@class="wrapper"]/div
${profile_icon}    //*[@class="nav-end"]/button/div

# Login Pop-up
${login_email}    //*[@name="email"]
${login_password}    //*[@name="password"]
${login_button}    //*[@class="mt-10 form"]/button

# Successful Messages
${successful_login}    //div[text()="Welcome ikmal"]
${successful_logout}    //div[text()="Successfully Logout"]
${successful_buy}    //div[text()="Buy order successful"]
${successful_sell}    //div[text()="Sell order successful"]
${successful_deposit}    //div[text()="Successfully deposited"]
${successful_withdraw}    //div[text()="Successfully withdrawn"]
${successful_reset}    //div[text()="Successfully reset password"]

# Homepage Sidebar
${currency_dropdown}    //*[@class="mobile-hide"]
${BTC_currency}    //*[@data-value="BTC"]
${ETH_currency}    //*[@data-value="ETH"]
${line}    //button[text()="Line"]
${candle}    //button[text()="Candle"]
${1_tick}    //button[text()="1 tick"]
${1_min}    //button[text()="1 minute"]
${30_min}    //button[text()="30 minute"]
${1_hr}    //button[text()="1 hour"]
${1_day}    //button[text()="1 day"]
${buy_toggle}    //*[@class="buy-sell-toggle"]/button
${sell_toggle}    //*[@class="buy-sell-toggle"]/button[2]
${amount_input}    //*[@class="amount"]/div/div/input
${buysell_button}    //*[@class="side-bar-input"]/button

# To Skip Tour
${skip_tour}    //button[text()="Skip"]


*** Keywords ***

Go To Website
    Open Browser    https://crypthub-app.vercel.app/   chrome
    Set Window Size    1280    1024

Change Currency to BTC
    Wait Until Page Contains Element    ${currency_dropdown}
    Click Element    ${currency_dropdown}
    Wait Until Page Contains Element    ${BTC_currency}
    Click Element    ${BTC_currency}
    Wait Until Element Is Visible    ${chart}    20

Change Currency to ETH
    Wait Until Page Contains Element    ${currency_dropdown}    20
    Click Element    ${currency_dropdown}
    Wait Until Page Contains Element    ${ETH_currency}
    Click Element    ${ETH_currency}
    Wait Until Element Is Visible    ${chart}    20

Change Chart to Line 
    Wait Until Page Contains Element    ${line}
    Click Element    ${line}
    Wait Until Element Is Visible    ${chart}    20

Change Chart to Candle 
    Wait Until Page Contains Element    ${1_min}
    Click Element    ${1_min}
    Wait Until Page Contains Element    ${candle}
    Click Element    ${candle}
    Wait Until Element Is Visible    ${chart}    20

Change to 1 Tick
    Wait Until Page Contains Element    ${1_tick}
    Click Element    ${1_tick}
    Wait Until Element Is Visible    ${chart}    20

Change to 1 Minute
    Wait Until Page Contains Element    ${1_min}
    Click Element    ${1_min}
    Wait Until Element Is Visible    ${chart}    20

Change to 30 Minute
    Wait Until Page Contains Element    ${30_min}
    Click Element    ${30_min}
    Wait Until Element Is Visible    ${chart}    20

Change to 1 Hour
    Wait Until Page Contains Element    ${1_hr}
    Click Element    ${1_hr}
    Wait Until Element Is Visible    ${chart}    20

Change to 1 Day
    Wait Until Page Contains Element    ${1_day}
    Click Element    ${1_day}
    Wait Until Element Is Visible    ${chart}    20

*** Test Cases ***
Check Chart for BTC Line For All Intervals
    Go To Website
    Change Currency to BTC
    Change Chart to Line
    Change to 1 Tick
    Sleep    2
    Change to 1 Minute
    Sleep    2
    Change to 30 Minute
    Sleep    2
    Change to 1 Hour
    Sleep    2
    Change to 1 Day
    Sleep    2


Check Chart for BTC Candlestick For All Intervals
    Go To Website
    Change Currency to BTC
    Change Chart to Candle
    Change to 1 Minute
    Sleep    2
    Change to 30 Minute
    Sleep    2
    Change to 1 Hour
    Sleep    2
    Change to 1 Day
    Sleep    2

Check Chart for ETH Line For All Intervals
    Go To Website
    Change Currency to ETH
    Change Chart to Line
    Change to 1 Tick
    Sleep    2
    Change to 1 Minute
    Sleep    2
    Change to 30 Minute
    Sleep    2
    Change to 1 Hour
    Sleep    2
    Change to 1 Day
    Sleep    2
Check Chart for ETH Candlestick For All Intervals
    Go To Website
    Change Currency to ETH
    Change Chart to Candle
    Change to 1 Minute
    Sleep    2
    Change to 30 Minute
    Sleep    2
    Change to 1 Hour
    Sleep    2
    Change to 1 Day
    Sleep    2


