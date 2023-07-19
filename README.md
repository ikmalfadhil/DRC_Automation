# CRYPTHUB Automation Testing

This repository contains automation scripts for Crypthub, a cryptocurrency trading platform for Besquare’s Developer’s Readiness Challenge (DRC) 2023. The link to the website is as follows: [Crypthub Website](https://crypthub-app.vercel.app/).

This repository utilizes Robot Framework with Selenium Library.

## Robot Framework

Robot Framework is a generic open source automation framework. It can be used for test automation and robotic process automation (RPA). The Robot Framework is adaptable and open. Virtually any other tool can be combined with Robot Framework to create robust and adaptable automation systems. Robot Framework does not require any license fees to be used.

Robot Framework uses keywords that are easy to understand and has a simple syntax. Libraries created using Python, Java, or many other programming languages might increase their functionalities. A robust ecosystem that includes libraries and tools created as different projects surrounds Robot Framework.

## Selenium Library

SeleniumLibrary is a web testing library for Robot Framework. SeleniumLibrary uses the Selenium WebDriver modules internally to control a web browser.

## Installation

### Step 1: Install pip

Before proceeding, we need to update all repositories on our system first:

```bash
sudo apt update
sudo apt install python3-pip
```

Check pip version
```bash
pip3 --version
```

### Step 2: Install Robot Framework
To install Robot Framework, run the following command in the terminal:

```bash
pip3 install robotframework
```

Add the location where Robot Framework is installed to your system's PATH:

```bash
vi .bashrc
export PATH="$PATH:<location>" # add the following line into .bashrc
```
Example: export PATH="$PATH:/home/qa/.local/bin"

Check Robot Framework version:

```bash
robot --version
```

### Step 3: Install Selenium Library
To install Selenium Library, run the following command in the terminal:

```bash
pip3 install robotframework-seleniumlibrary
```

To check the version of robotframework-seleniumlibrary:

```bash
pip3 freeze | grep selenium
```

### Step 4: Install VS Code
Before proceeding, we need to install Visual Studio Code (VS Code):

https://code.visualstudio.com/download

Then, install an extension called "Robot Code". It can be found under View > Extensions.

Search for "Robot Code" in the search box and install the extension. Select the correct Python interpreter when asked upon extension installation completion.

When a pop-up window appears as above, click on "Select Python Interpreter". Then, from the dropdown, select the recommended Python version. Recommended: 3.11 and above.

### Step 5: Install chromedriver
1.  Go to https://chromedriver.chromium.org/downloads
2.  Download the corresponding chromedriver version.
3.  Choose the Linux version (e.g., If your Chrome version is 114.***, then download the chromedriver version 114. **).
4.  Unzip the downloaded file.
5.  Move the chromedriver file to /usr/bin/chromedriver (sudo mv chromedriver /usr/bin/chromedriver).
6.  Configure the chromedriver on your system by running the following commands in the terminal:

```bash
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
chromedriver
```

### Run Test
To run a file with an automation script, use the following command:

```bash
robot <filename.robot>
```

### RF Documentation Resources
- https://robotframework.org/robotframework/latest/libraries/BuiltIn.html (e.g., Convert to number, Get length)
- https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html (e.g., Click button, Open browser)
- https://robotframework.org/


































