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
${wallet_input}    (//input[@class="MuiInputBase-input MuiInput-input MuiInputBase-inputAdornedEnd css-1jhxu0"])[2]
${USD_opt}    //*[@role="listbox"]/li
${add_icon}    (//*[@class="deposit-input-box MuiBox-root css-0"]/button[2])[2]
${subtract_icon}    (//*[@class="deposit-input-box MuiBox-root css-0"]/button[1])[2]
${deposit_button}    //*[@class="deposit-form"]/button
${withdraw_button}    //*[@class="deposit-form"]/button
${error}    //p[text()="Amount must be a positive number"]

# Login Pop-up
${login_email}    //*[@name="email"]
${login_password}    //*[@name="password"]
${login_button}    //*[@class="mt-10 form"]/button

# Success Messages
${successful_login}    //div[text()="Welcome syurss"]
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

# Wallet History Tab
${wallet_history_tab}    //*[@id="vertical-tab-1"]
${first_row_deposit}    //td[2][text()="deposit"]
${first_row_withdraw}    //td[2][text()="withdraw"]
${first_row_wallet_txn}     //td[5][text()="10,000"]

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
    Input Text    ${login_email}    asyurajohane@gmail.com
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

Deposit Into Wallet
    Wait Until Element Is Visible    ${wallet}    10
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${deposit_dropdown}    10
    Click Element    ${deposit_dropdown}
    Wait Until Element Is Visible    ${wallet_input}    10
Withdraw From Wallet
    Wait Until Element Is Visible    ${wallet}    10
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${withdraw_dropdown}    10
    Click Element    ${withdraw_dropdown}
    Wait Until Element Is Visible    ${wallet_input}

Deposit 10000 USD into Wallet
    Wait Until Element Is Visible    ${wallet}    10
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${deposit_dropdown}    10
    Click Element    ${deposit_dropdown}
    Wait Until Element Is Visible    ${wallet_input}    10
    Input Text    ${wallet_input}    10000
    Click Element    ${deposit_button}
    Wait Until Page Contains Element    ${successful_deposit}    10
    Wait Until Element Is Enabled    ${wallet}    10
    Click Element    ${USD_opt}

Withdraw 10000 USD out of Wallet
    Wait Until Element Is Visible    ${wallet}    10
    Click Element    ${wallet}
    Wait Until Element Is Visible    ${withdraw_dropdown}    10
    Click Element    ${withdraw_dropdown}
    Wait Until Element Is Visible    ${wallet_input}    10
    Input Text    ${wallet_input}    10000
    Click Element    ${withdraw_button}
    Wait Until Element Is Visible    ${successful_withdraw}    10
    Wait Until Element Is Enabled    ${wallet}    10
    Click Element    ${USD_opt}


*** Test Cases ***

Deposit 10000 USD into Wallet and Check Wallet History
    Go To Website
    Login with first password
    Deposit 10000 USD into Wallet
    To Profile Page
    Wait Until Element Is Enabled   ${wallet_history_tab}    10
    Click Element    ${wallet_history_tab}
    Wait Until Element Is Visible    ${first_row_deposit}    10
    Wait Until Element Is Visible    ${first_row_wallet_txn}    10
    Sleep    4

Withdraw 10000 USD into Wallet and Check Wallet History
    Go To Website
    Login with first password
    Withdraw 10000 USD out of Wallet
    To Profile Page
    Wait Until Element Is Enabled    ${wallet_history_tab}    10
    Click Element    ${wallet_history_tab}
    Wait Until Element Is Visible    ${first_row_withdraw}    10
    Wait Until Element Is Visible    ${first_row_wallet_txn}    10
    Sleep    4

Verify if User is Prompted to Input a Positive Number when Depositing/Withdrawing
    Go To Website
    Login with first password
    Deposit Into Wallet
    Input Text    ${wallet_input}    0
    Click Element    ${deposit_button}
    Wait Until Page Contains Element    ${error}    10

Verify if Add and Subtract Icon Is Able Increase and Decrease Amount
    Go To Website
    Login with first password
    Deposit Into Wallet
    FOR    ${i}    IN RANGE    1    11
        Click Element    ${add_icon}
        Sleep    0.4
    END
    FOR    ${i}    IN RANGE    1    11
        Click Element    ${subtract_icon}
        Sleep    0.4
    END