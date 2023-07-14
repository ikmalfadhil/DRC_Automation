*** Settings ***
Documentation  homepage
Library    SeleniumLibrary

*** Variables ***

# Header
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
${USD_opt}    //*[@id="menu-"]/div[3]/ul/li[1]

# Successful Messages
${successful_buy}    //*[@role="alert"]/div[2][text()="Buy order successful"]
${successful_sell}    //*[@role="alert"]/div[2][text()="Sell order successful"]
${successful_deposit}    //*[@role="alert"]/div[2][text()="Successfully deposited"]
${successful_withdraw}    //*[@role="alert"]/div[2][text()="Successfully withdrawn"]
${successful_reset}    //*[@role="alert"]/div[2][text()="Successfully reset password"]

# Homepage Sidebar
${currency_dropdown}    //*[@class="mobile-hide"]
${BTC_currency}    //*[@data-value="BTC"]
${ETH_currency}    //*[@data-value="ETH"]
${buy_toggle}    //*[@class="buy-sell-toggle"]/button
${sell_toggle}    //*[@class="buy-sell-toggle"]/button[2]
${amount_input}    //*[@class="amount"]/div/div/input

#Transaction History Tab
${transaction_history_tab}    //*[@id="vertical-tab-0"]
${most_recent_buy}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[2][text()="buy"]
${most_recent_sell}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[2][text()="sell"]
${most_recent_BTC}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[3][text()="BTC"]
${most_recent_ETH}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[3][text()="ETH"]
${most_recent_txn_amt}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[5][text()="10,000"]
${most_recent_coin_amt}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[4][text()="0.1"]

# Wallet History Tab
${wallet_history_tab}    //*[@id="vertical-tab-1"]
${most_recent_deposit}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[2][text()="deposit"]
${most_recent_withdraw}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[2][text()="withdraw"]
${most_recent_wallet_txn}    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[5][text()="10,000"]

# Reset Password Tab
${reset_password_tab}    //*[@id="vertical-tab-3"]
${current_password}    //*[@class="mt-10 reset-password-form"]/div[1]/div/div/input
${new_password}    //*[@class="mt-10 reset-password-form"]/div[2]/div/div/input
${repeat_password}    //*[@class="mt-10 reset-password-form"]/div[3]/div/div/input
${reset_button}    //*[@class="mt-10 reset-password-form"]/button

# Buttons
${login_button}    //*[@class="wrapper"]/div/div/div[2]/form/button
${logout_button}    //*[@class="MuiPopover-root MuiMenu-root MuiModal-root css-1sucic7"]/div[3]/ul/li[2]
${profile_button}    //*[@class="MuiPopover-root MuiMenu-root MuiModal-root css-1sucic7"]/div[3]/ul/li
${deposit_button}    //*[@class="deposit-form"]/button
${withdraw_button}    //*[@class="deposit-form"]/button
${buysell_button}    //*[@class="side-bar-input"]/button


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

Login with second password
    Wait Until Page Contains Element    ${logo}
    Wait Until Element Is Visible    ${logo}
    Click Element    ${login}
    Wait Until Element Is Visible    ${login_popup}
    Input Text    ${login_email}    ikmal@besquare.com.my
    Input Password    ${login_password}    Lamki12!
    Click Element    ${login_button}

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
    Wait Until Element Is Visible    ${wallet}
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

login 
    Go To Website
    Login with first password
    Sleep    4

logout
    Go To Website
    Login with first password
    Logout
    Sleep    4

Reset Password
    Go To Website
    Login with first password
    Sleep    3
    To Profile Page
    Wait Until Element Is Enabled    ${reset_password_tab}
    Click Element    ${reset_password_tab}
    Wait Until Page Contains Element    ${current_password}
    Input Text    ${current_password}    Ikmal12!
    Input Text    ${new_password}    Lamki12!
    Input Text    ${repeat_password}    Lamki12!
    Click Button    ${reset_button}
    Wait Until Element Is Visible    ${successful_reset}
    Sleep    3
    Logout
    Sleep    3
    Login with second password


Deposit 10000 USD into Wallet and Check Wallet History
    Go To Website
    Login with first password
    Deposit 10000 USD into Wallet
    To Profile Page
    Wait Until Element Is Enabled   ${wallet_history_tab}
    Click Element    ${wallet_history_tab}
    Wait Until Element Is Visible    ${most_recent_deposit}
    Wait Until Element Is Visible    ${most_recent_wallet_txn}
    Sleep    4

Withdraw 10000 USD into Wallet and Check Wallet History
    Go To Website
    Login with first password
    Withdraw 10000 USD out of Wallet
    To Profile Page
    Wait Until Element Is Enabled    ${wallet_history_tab}
    Click Element    ${wallet_history_tab}
    Wait Until Element Is Visible    ${most_recent_withdraw}    10
    Wait Until Element Is Visible    ${most_recent_wallet_txn}    10
    Sleep    4

Buy 10000 USD worth of BTC and Check Transaction History
    Go To Website
    Login with first password
    Deposit 10000 USD into Wallet
    Buy 10000 USD worth of BTC
    To Profile Page
    Wait Until Element Is Visible    ${transaction_history_tab}
    Click Element    ${transaction_history_tab}
    Wait Until Element Is Visible    ${most_recent_buy}    10
    Wait Until Element Is Visible    ${most_recent_BTC}    10
    Wait Until Element Is Visible    ${most_recent_txn_amt}    10
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
    Wait Until Element Is Visible    ${most_recent_sell}    10
    Wait Until Element Is Visible    ${most_recent_BTC}    10
    Wait Until Element Is Visible    ${most_recent_coin_amt}    10
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


