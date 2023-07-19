*** Settings ***
Documentation  homepage
Library    SeleniumLibrary

*** Variables ***

# Header
${logo}    //a[@href="https://crypthub.vercel.app/"]
${login}    //*[@class="nav-end"]/button
${login_popup}    //*[@class="wrapper"]/div
${profile_icon}    //*[@class="nav-end"]/button/div

# Profile Dropdown
${logout_button}    //*[text()="Logout"]
${profile_button}    //*[text()="Profile"]

# Wallet
${wallet}    //*[@id="wallet"]
${deposit_dropdown}    //*[@role="listbox"]/button
${withdraw_dropdown}    //*[@role="listbox"]/button[2]
${wallet_input}    //input[@inputmode="numeric"]
${USD_opt}    //*[@role="listbox"]/li
${deposit_button}    //*[@class="deposit-form"]/button
${withdraw_button}    //*[@class="deposit-form"]/button

# Login Pop-up
${login_email}    //*[@name="email"]
${login_password}    //*[@name="password"]
${login_button}    //*[@class="mt-10 form"]/button

# Success Messages
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
${buy_toggle}    //*[@class="buy-sell-toggle"]/button
${sell_toggle}    //*[@class="buy-sell-toggle"]/button[2]
${amount_input}    //*[@class="amount"]/div/div/input
${buysell_button}    //*[@class="side-bar-input"]/button

#Transaction History Tab
${transaction_history_tab}    //*[@id="vertical-tab-0"]
${first_row_buy}    //td[2][text()="buy"]
${first_row_sell}    //td[2][text()="sell"]
${first_row_BTC}    //td[3][text()="BTC"]
${first_row_ETH}    //td[3][text()="ETH"]
${first_row_txn_amt}    //td[5][text()="10,000"]
${first_row_coin_amt}    //td[4][text()="0.1"]

# Wallet History Tab
${wallet_history_tab}    //*[@id="vertical-tab-1"]
${first_row_deposit}    //td[2][text()="deposit"]
${first_row_withdraw}    //td[2][text()="withdraw"]
${first_row_wallet_txn}     //td[5][text()="10,000"]

# Reset Password Tab
${reset_password_tab}    //*[@id="vertical-tab-3"]
${current_password}    //input[@name="old_password"]
${new_password}    //input[@name="password"]
${repeat_password}    //input[@name="new_password"]
${reset_button}    //button[@type="submit"]

# To Skip Tour
${skip_tour}    //button[text()="Skip"]


*** Keywords ***

Go To Website
    Open Browser    https://crypthub-app.vercel.app/   chrome
    Set Window Size    1280    1024

Login with first password
    Wait Until Page Contains Element    ${logo}
    Wait Until Element Is Visible    ${logo}
    Click Element    ${login}
    Wait Until Element Is Visible    ${login_popup}
    Input Text    ${login_email}    ikmal@besquare.com.my
    Input Password    ${login_password}    Ikmal12!
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${successful_login}
    Click Element    ${skip_tour}

Login with second password
    Wait Until Page Contains Element    ${logo}
    Wait Until Element Is Visible    ${logo}
    Click Element    ${login}
    Wait Until Element Is Visible    ${login_popup}
    Input Text    ${login_email}    ikmal@besquare.com.my
    Input Password    ${login_password}    Lamki12!
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${successful_login}
    Click Element    ${skip_tour}

Logout
    Wait Until Element Is Visible    ${profile_icon}
    Click Element    ${profile_icon}
    Wait Until Element Is Visible    ${logout_button}
    Click Element    ${logout_button}

To Profile Page
    Click Element    ${profile_icon}
    Wait Until Element Is Enabled    ${profile_button}
    Click Element    ${profile_button}

Deposit 10000 USD into Wallet
    Wait Until Element Is Visible    ${wallet}    10
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${deposit_dropdown}
    Click Element    ${deposit_dropdown}
    Wait Until Element Is Visible    ${wallet_input}
    Input Text    ${wallet_input}    10000
    Click Element    ${deposit_button}
    Wait Until Page Contains Element    ${successful_deposit}
    Wait Until Element Is Enabled    ${wallet}
    Click Element    ${USD_opt}

Withdraw 10000 USD out of Wallet
    Wait Until Element Is Visible    ${wallet}
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${withdraw_dropdown}
    Click Element    ${withdraw_dropdown}
    Wait Until Element Is Visible    ${wallet_input}
    Input Text    ${wallet_input}    10000
    Click Element    ${withdraw_button}
    Wait Until Element Is Visible    ${successful_withdraw}
    Wait Until Element Is Enabled    ${wallet}
    Click Element    ${USD_opt}

Buy 10000 USD worth of BTC
    Wait Until Page Contains Element    ${currency_dropdown}
    Click Element    ${currency_dropdown}
    Wait Until Element Is Visible    ${BTC_currency}
    Click Element    ${BTC_currency}
    Click Element    ${buy_toggle}
    Input Text    ${amount_input}    10000
    Sleep    4
    Wait Until Element Is Enabled    ${buysell_button}
    Click Element    ${buysell_button}
    Wait Until Element Is Visible    ${successful_buy}

Sell 0.1 BTC
    Wait Until Page Contains Element    ${currency_dropdown}
    Click Element    ${currency_dropdown}
    Wait Until Element Is Visible    ${BTC_currency}
    Click Element    ${BTC_currency}
    Click Element    ${sell_toggle}
    Input Text    ${amount_input}    0.1
    Sleep    4
    Wait Until Element Is Enabled    ${buysell_button}
    Click Element    ${buysell_button}
    Wait Until Element Is Visible    ${successful_sell}


*** Test Cases ***

Log In 
    Go To Website
    Login with first password
    Wait Until Element Is Visible    ${successful_login}
    Sleep    4

Log Out
    Go To Website
    Login with first password
    Logout
    Wait Until Element Is Visible    ${successful_logout}
    Sleep    4

Buy 10000 USD worth of BTC and Check Transaction History
    Go To Website
    Login with first password
    Deposit 10000 USD into Wallet
    Buy 10000 USD worth of BTC
    To Profile Page
    Wait Until Element Is Visible    ${transaction_history_tab}
    Click Element    ${transaction_history_tab}
    Wait Until Element Is Visible    ${first_row_buy}    10
    Wait Until Element Is Visible    ${first_row_BTC}    10
    Wait Until Element Is Visible    ${first_row_txn_amt}    10
    Sleep   4

Sell 0.1 BTC and Check Transaction History
    Go To Website
    Login with first password
    Deposit 10000 USD into Wallet
    Buy 10000 USD worth of BTC
    Sell 0.1 BTC
    To Profile Page
    Wait Until Element Is Visible    ${transaction_history_tab}
    Click Element    ${transaction_history_tab}
    Wait Until Element Is Visible    ${first_row_sell}    10
    Wait Until Element Is Visible    ${first_row_BTC}    10
    Wait Until Element Is Visible    ${first_row_coin_amt}    10
    Sleep   4


