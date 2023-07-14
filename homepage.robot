*** Settings ***
Documentation  homepage
Library    SeleniumLibrary

*** Variables ***
${logo}    //*[@id="dark"]/header/div/div/a/h6
${login}    //*[@class="nav-end"]/button
${login_popup}    //*[@class="wrapper"]/div
${login_email}    //*[@class="wrapper"]/div/div/div[2]/form/div/div/div/input
${login_password}    //*[@class="wrapper"]/div/div/div[2]/form/div[2]/div/div/input
${profile_icon}    //*[@class="nav-end"]/button/div
${wallet}    //*[@id="wallet"]
${deposit_dropdown}    //*[@role="listbox"]/button
${withdraw_dropdown}    //*[@role="listbox"]/button[2]
${wallet_input}    //*[@class="wrapper"]/div/div/form/div/div/div/input
${successful_message}    //*[@role="alert"]/div[2]
${currency_dropdown}    //*[@class="mobile-hide"]
${BTC_currency}    //*[@data-value="BTC"]
${buy_toggle}    //*[@class="buy-sell-toggle"]/button
${amount_input}    //*[@class="amount"]/div/div/input
${transaction_history_tab}    //*[@id="vertical-tab-0"]
${most_recent_buy}    //td[.//text()="buy"]
${most_recent_BTC}    //td[.//text()="BTC"]

${login_button}    //*[@class="wrapper"]/div/div/div[2]/form/button
${logout_button}    //*[@class="MuiPopover-root MuiMenu-root MuiModal-root css-1sucic7"]/div[3]/ul/li[2]
${profile_button}    //*[@class="MuiPopover-root MuiMenu-root MuiModal-root css-1sucic7"]/div[3]/ul/li
${deposit_button}    //*[@class="deposit-form"]/button
${withdraw_button}    //*[@class="deposit-form"]/button
${buysell_button}    //*[@class="side-bar-input"]/button

${USD_opt}    //*[@id="menu-"]/div[3]/ul/li[1]

*** Keywords ***

Go To Website
    Open Browser    https://crypthub-app.vercel.app/   chrome
    Set Window Size    1280    1024

Login
    Wait Until Page Contains Element    ${logo}
    Wait Until Element Is Visible    ${logo}
    Click Element    ${login}
    Wait Until Element Is Visible    ${login_popup}
    Input Text    ${login_email}    ikmal@besquare.com.my
    Input Password    ${login_password}    Ikmal12!
    Click Element    ${login_button}

Logout
    Wait Until Element Is Visible    ${profile_icon}
    Click Element    ${profile_icon}
    Wait Until Element Is Visible    ${logout_button}
    Click Element    ${logout_button}

Deposit 1000 USD into Wallet
    Wait Until Element Is Visible    ${wallet}
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${deposit_dropdown}
    Click Element    ${deposit_dropdown}
    Wait Until Element Is Visible    ${wallet_input}
    Input Text    ${wallet_input}    1000
    Click Element    ${deposit_button}
    Wait Until Page Contains Element    ${successful_message}
    Wait Until Element Is Enabled    ${wallet}
    Click Element    ${USD_opt}
    

*** Test Cases ***

login 
    Go To Website
    Login
    Sleep    4

logout
    Go To Website
    Login
    Logout
    Sleep    4

Deposit 10000 USD into Wallet and Check Wallet History
    Go To Website
    Login
    Wait Until Element Is Visible    ${wallet}
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${deposit_dropdown}
    Click Element    ${deposit_dropdown}
    Wait Until Element Is Visible    ${wallet_input}
    Input Text    ${wallet_input}    10000
    Click Element    ${deposit_button}
    Wait Until Page Contains Element    ${successful_message}
    Click Element    ${profile_icon}
    Wait Until Element Is Enabled    ${profile_button}
    Click Element    ${profile_button}
    Wait Until Element Is Visible    ${transaction_history_tab}
    Click Element    ${transaction_history_tab}
    Sleep    4

Withdraw 10000 USD into Wallet
    Go To Website
    Login
    Wait Until Element Is Visible    ${wallet}
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${withdraw_dropdown}
    Click Element    ${withdraw_dropdown}
    Wait Until Element Is Visible    ${wallet_input}
    Input Text    ${wallet_input}    10000
    Click Element    ${withdraw_button}
    Wait Until Element Is Visible    ${successful_message}
    Sleep    4

Buy 1000 USD worth of BTC and Check Transaction History
    Go To Website
    Login
    Deposit 1000 USD into Wallet
    Wait Until Page Contains Element    ${currency_dropdown}
    Click Element    ${currency_dropdown}
    Wait Until Element Is Visible    ${BTC_currency}
    Click Element    ${BTC_currency}
    Click Element    ${buy_toggle}
    Input Text    ${amount_input}    1000
    Wait Until Element Is Enabled    ${buysell_button}
    Click Element    ${buysell_button}
    Wait Until Element Is Visible    ${successful_message}
    Click Element    ${profile_icon}
    Wait Until Element Is Enabled    ${profile_button}
    Click Element    ${profile_button}
    Wait Until Element Is Visible    ${transaction_history_tab}
    Click Element    ${transaction_history_tab}
    Wait Until Element Is Visible    ${most_recent_buy}
    Wait Until Element Is Visible    ${most_recent_BTC}
    Sleep   4

# Test 1
#     Go To Website
#     Login
#     Wait Until Element Is Visible    ${wallet}
#     Click Element    ${wallet}
#     Wait Until Element Is Visible    ${deposit_dropdown}
#     Click Element    ${deposit_dropdown}
#     Wait Until Element Is Visible    ${wallet_input}
#     Input Text    ${wallet_input}    1000
#     Click Element    ${deposit_button}
#     Wait Until Page Contains Element    ${successful_message}
#     Wait Until Element Is Enabled    ${wallet}
#     Click Element    ${USD_opt}
#     Click Element    ${currency_dropdown}
#     Wait Until Element Is Visible    ${BTC_currency}


