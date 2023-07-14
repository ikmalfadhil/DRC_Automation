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
${buy_toggle}    //*[@class="buy-sell-toggle"]/button
${sell_toggle}    //*[@class="buy-sell-toggle"]/button[2]
${amount_input}    //*[@class="amount"]/div/div/input
${buysell_button}    //*[@class="side-bar-input"]/button

#Transaction History Tab
${transaction_history_tab}    //*[@id="vertical-tab-0"]
${most_recent_buy}    //td[2][text()="buy"]
${most_recent_sell}    //td[2][text()="sell"]
${most_recent_BTC}    //td[3][text()="BTC"]
${most_recent_ETH}    //td[3][text()="ETH"]
${most_recent_txn_amt}    //td[5][text()="10,000"]
${most_recent_coin_amt}    //td[4][text()="0.1"]

# Wallet History Tab
${wallet_history_tab}    //*[@id="vertical-tab-1"]
${most_recent_deposit}    //td[2][text()="deposit"]
${most_recent_withdraw}    //td[2][text()="withdraw"]
${most_recent_wallet_txn}     //td[5][text()="10,000"]

# Reset Password Tab
${reset_password_tab}    //*[@id="vertical-tab-3"]
${current_password}    //input[@name="old_password"]
${new_password}    //input[@name="password"]
${repeat_password}    //input[@name="new_password"]
${reset_button}    //button[@type="submit"]


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


*** Test Cases ***

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