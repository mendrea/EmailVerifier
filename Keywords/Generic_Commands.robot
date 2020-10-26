*** Settings ***

Resource	../Keywords/Settings.robot
Resource	../Keywords/Navigation.robot
Resource	../Keywords/Validations.robot
Resource	../Keywords/Context.robot

*** Variables ***
${IsAjaxComplete}    ${EMPTY}

*** Keywords ***
  
Open Browser And Go To Login Page
    SeleniumLibrary.Open Browser  ${ServerName}  ${Browser}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed  0
	
Login as [${USERNAME}] with password [${PASSWORD}]
	SeleniumLibrary.Input Text  ${Input_User}  ${USERNAME}
	SeleniumLibrary.Input Text  ${Input_Pass}  ${PASSWORD}
    SeleniumLibrary.Click Element  ${btn_Sign_in}
    Generic_Commands.Wait for Ajax
    
Type [${EMAIL_ADDRESS}] in the contactDomain input box
	SeleniumLibrary.Input Text  ${input_Enter_mail_Address_ID}  ${EMAIL_ADDRESS}
	
Click Verify 1 Credit buton
	Ensure that element is visible  //*[@id='btnFindEmail'][@class='btn btn-primary ladda-button']
	SeleniumLibrary.Click Element  //*[@id='btnFindEmail'][@class='btn btn-primary ladda-button']
	Wait for Ajax
	
Click Bulk Email Verifier buton
	Ensure that element is visible  //*[@id='btnFindEmail'][@class='btn btn-primary ladda-button bulk-finder-button']
	SeleniumLibrary.Click Element  //*[@id='btnFindEmail'][@class='btn btn-primary ladda-button bulk-finder-button']
	Wait for Ajax

Log out current User
	Ensure that element is visible  //div[@role='listbox']
	SeleniumLibrary.Click Element  //div[@role='listbox']
	Ensure that element is visible  //div[@role='listbox']//div[@role='option']//span[contains(.,'Log Out')]
	SeleniumLibrary.Click Element  //div[@role='listbox']//div[@role='option']//span[contains(.,'Log Out')]
	Generic_Commands.Wait for Ajax
	Validations.Pixyle Automatic Tagging landing page
	    
I click the button [${BTN}]
	Ensure that element is visible  //button[.='${BTN}']
	SeleniumLibrary.Click Element  //button[.='${BTN}']
	Generic_Commands.Wait for Ajax

Upload SoProIOCSV file
	Ensure that element is visible  //*[@id='file']
	Ensure that element is visible  //*[@id='UploadBulkEmails']//input[@type='file']
	SeleniumLibrary.Choose File  //input[@type='file']  ${SoProIOCSV}
	Wait for Ajax
	Ensure that element is visible  //*[@id='btnUploadDocument']
	SeleniumLibrary.Click Element  //*[@id='btnUploadDocument']

Close the dialog window
	SeleniumLibrary.Click Element  //i[@class='close icon']
	Wait for Ajax

Wait for Ajax
  	#: FOR    ${INDEX}    IN RANGE    1    5000
    #\    ${IsAjaxComplete}    Execute JavaScript    return window.jQuery!=undefined && jQuery.active==0
    #\    Log    ${INDEX}
    #\    Log    ${IsAjaxComplete}
    #\    Run Keyword If    ${IsAjaxComplete}==True    Exit For Loop
	SeleniumLibrary.Execute JavaScript  "return jQuery.active == 0"
	Sleep  0.5
    #Wait for Condition  return window.jQuery.active == 0;
    #Wait for Condition  return $(':animated').length == 0;