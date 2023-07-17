*** Settings ***
Documentation       Testing for login, create and delete api token

Library             SeleniumLibrary


*** Variables ***
${logo}                 //*[@id="dark"]/header/div/div/a/h6
${login}                //*[@class="nav-end"]/button
${login_popup}          //*[@class="wrapper"]/div
${login_email}          //*[@class="wrapper"]/div/div/div[2]/form/div/div/div/input
${login_password}       //*[@class="wrapper"]/div/div/div[2]/form/div[2]/div/div/input
${login_button}         //*[@class="wrapper"]/div/div/div[2]/form/button
${profile_icon}         //*[@id="profile-button"]

${p2p_link}             //*[@id="dark"]/header/div/div/div[1]/a[2]
${btc_filter}           //*[@id="dark"]/div[1]/div[1]/div/div/label[2]/span[1]/input
${contract_card}        //*[@id="dark"]/div[1]/div[2]/div[2]/div[1]/div
${buy_btn}              //button[contains(@class, 'MuiButton-textPrimary') and not(@disabled) and text() = 'BUY']
${alert_box}            //*[@class="MuiCardContent-root css-1qw96cp"]
${yes_btn}              //*[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedSuccess MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedSuccess MuiButton-sizeMedium MuiButton-containedSizeMedium css-1wb4k3q"]
${buy_success}          //*[@class="Toastify__toast Toastify__toast-theme--dark Toastify__toast--success"]
${close_btn}            (//button[contains(@class, 'Toastify__close-button--dark')])
${skip_btn}             //button[text()='Skip']
${profile_tab}          //p[text()='Profile']
${trans_table}          //*[@class="tab-box MuiBox-root css-19kzrtu"]
${p2p_hist}             (//*[@class="MuiButtonBase-root MuiTab-root MuiTab-textColorPrimary css-a0ytsc"])[2]

${sell_btn}             //*[@class="market-sell-box MuiBox-root css-0"]
${contract_form}        //*[@class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root card css-ehomwu"]
${currency_dropdown}    //*[@id="wallet-currency-select"]
${loading_price}        //div[contains(@style, 'fill: white; height: 20px; width: 20px;')]    
${coin_input}           (//*[@class="MuiInputBase-input MuiInput-input MuiInputBase-inputAdornedEnd css-1jhxu0"])[1]
${price_input}          (//*[@class="MuiInputBase-input MuiInput-input MuiInputBase-inputAdornedEnd css-1jhxu0"])[2]
${sell_btn_2}           //button[text()='SELL']

${ongoing_btn}          //button[text()='On Going']
${eth_filter}           //*[@id="dark"]/div[1]/div[1]/div/div/label[1]
${btc_contract}         //div[contains(@class, 'MuiCard-root') and contains(@class, 'market-card')]//div[text()='BTC']
${withdraw_btn}         (//button[text()='WITHDRAW'])[1]



*** Keywords ***
Login
    Open Browser    https://crypthub-app.vercel.app/    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    ${logo}
    Wait Until Element Is Visible    ${logo}
    Click Element    ${login}
    Wait Until Element Is Visible    ${login_popup}
    Input Text    ${login_email}    farhana@besquare.com.my
    Input Password    ${login_password}    Test1234@
    Click Element    ${login_button}
    Wait Until Page Contains Element    ${close_btn}
    Click Element    ${skip_btn}

Navigate to P2P Page 
    Page Should Contain    P2P Trader
    Click Element    ${p2p_link}

Buy an ETH Contract
    Click Element    ${btc_filter}
    Wait Until Page Contains Element    ${contract_card}    5
    Click Element    ${buy_btn}
    Wait Until Page Contains Element    ${alert_box}    5
    Click Element    ${yes_btn}
    Wait Until Page Contains Element    ${buy_success}    5
    Click Element    ${close_btn}

Navigate to P2P Transaction History 
    Wait Until Page Contains Element    ${profile_icon}    5
    Click Element    ${profile_icon}
    Wait Until Page Contains Element    ${profile_tab}    5
    Click Element    ${profile_tab}
    Wait Until Page Contains Element    ${trans_table}    5
    Click Element    ${p2p_hist}

Sell 3 BTC contract for 10000
    Click Element    ${sell_btn}
    Wait Until Page Contains Element    ${contract_form}
    Click Element    ${currency_dropdown}
    Click Element    //*[@data-value="BTC"]
    Wait Until Page Does Not Contain Element    ${loading_price}    10
    Click Element    ${coin_input}
    Press Keys    ${coin_input}    CTRL+a+BACKSPACE
    Input Text    ${coin_input}    3
    Click Element    ${price_input}
    Press Keys    ${price_input}    CTRL+a+BACKSPACE
    Input Text    ${price_input}    10000
    Click Element    ${sell_btn_2}
    Wait Until Page Contains Element    //div[text()='Contract added sucessfully']    5

Navigate to Ongoing page 
    Page Should Contain    P2P Trader
    Click Element    ${p2p_link}
    Wait Until Page Contains Element    ${ongoing_btn}
    Click Element    ${ongoing_btn}

Withdraw BTC contract
    Click Element    ${eth_filter}
    Wait Until Page Contains Element    ${btc_contract}    5
    Click Element    ${withdraw_btn}
    Wait Until Page Contains Element    ${alert_box}    5
    Click Element    ${yes_btn}
    Wait Until Page Contains Element    //div[text()='Contract withdraw sucessfully']    5

*** Test Cases ***

Buy ETH Contract
    Login
    Navigate to P2P Page
    Buy an ETH Contract
    Navigate to P2P Transaction History
    Wait Until Page Contains Element    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[2][text()="bought"] | //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[3][text()="ETH"]
    Sleep    5

Sell BTC Contract 
    Login
    Navigate to P2P Page
    Sell 3 BTC contract for 10000
    Navigate to Ongoing page
    Withdraw BTC contract
    Navigate to P2P Transaction History
    Wait Until Page Contains Element    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[2][text()="sold"] | //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[3][text()="BTC"]
    Sleep    5

Withdraw BTC Contract
    Login
    Navigate to P2P Page
    Navigate to Ongoing page
    Withdraw BTC contract
    Navigate to P2P Transaction History
    Wait Until Page Contains Element    //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[2][text()="delete"] | //*[@class="MuiTableBody-root css-1xnox0e"]/tr[1]/td[3][text()="BTC"]
    Sleep    5

