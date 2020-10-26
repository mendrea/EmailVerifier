*** Settings ***

Resource	../PO/PO.robot
Resource	../Keywords/Settings.robot

*** Keywords ***

Ensure that element is visible
	[Arguments]  ${elementXpathIdentifier}
	SeleniumLibrary.Wait Until Element Is Visible  ${elementXpathIdentifier}
	
Ensure that the element is not visible
	[Arguments]  ${elementXpathIdentifier}
	SeleniumLibrary.Page Should Not Contain Element  ${elementXpathIdentifier}
    
Ensure that the User has landed on SoPro Email Verifier page
	#h1 with text Email Verifier
	Ensure that element is visible  ${H1_Email_Verifier}
	#input box with text Enter mail Address
	Ensure that element is visible  //*[@id='contactDomain']
	Ensure that element is visible  ${input_Enter_mail_Address_text}
	#button with text Verify (1 Credit) is available
	Ensure that element is visible  ${btn_Verify_1_credit}
	Ensure that element is visible  ${btn_Bulk_email_verifier}
	
Ensure that the User has landed on SoPro Email Verifier Login page
	#h3 Welcome to your B2B Prospecting Toolset
	Ensure that element is visible  ${H3_B2B_Prospecting_Toolset}
	#input Username
	Ensure that element is visible  ${Input_User}
	#input Password
	Ensure that element is visible  ${Input_Pass}
	#btn Google
	Ensure that element is visible  ${btn_Google}
	#btn Linkedin
	Ensure that element is visible  ${btn_Linkedin}
	
Ensure that the User [${CURRENTUSER}] has loggedin successfully
	Ensure that element is visible  //a[@role='button'][contains(.,'${CURRENTUSER}')]
    
Left menu items are available
	Ensure that element is visible  ${LMI_Dashboard}
    Ensure that element is visible  ${LMI_Toolset}
    Ensure that element is visible  ${LMI_Email_finder}
    Ensure that element is visible  ${LMI_Email_deliverability}
    Ensure that element is visible  ${LMI_Awesomeness_checker}
    Ensure that element is visible  ${LMI_Market_mapper}
    Ensure that element is visible  ${LMI_Campaign_Forecaster}
    
Ensure Login button is available
	Ensure that element is visible  //ul[@class='nav navbar-nav navbar-right']//a[.='Login']
	
Verify the current number of credits
	${BROJ} =  Get Text  //*[@id='currentCredits']
	${BROJ_INT}=  Convert To Integer  ${BROJ}
	Set Test Variable  ${BROJ_INT}
	Log  ${BROJ_INT}
	
Ensure that correct number of credits is shown
	Ensure that element is visible  //*[@id='currentCredits']
	${NUM_CRED} =  Get Text  //*[@id='currentCredits']
	${NUM_CRED_INT}=  Convert To Integer  ${NUM_CRED}
	Set Test Variable  ${NUM_CRED_INT}
	Log  ${NUM_CRED_INT}
	${SUMA} =  Convert To Integer  ${NUM_CRED_INT+1}
	Log  ${SUMA}
	Should Be Equal As Numbers  ${BROJ_INT}  ${SUMA}  
    
Ensure High Risk Toolset score value is [${TSS_SCORE}] with message [${TSS_MSG}]
	Ensure that element is visible  //h3[.='Toolset trust score']/..//h2[@class='highRisk changeTextColor'][.='${TSS_SCORE}']
	Ensure that element is visible  //h3[.='Toolset trust score']/..//h3[.='${TSS_MSG}']
	
Ensure High Risk Mail Send advice value is [${MS_SCORE}] with message [${MS_MSG}]
	Ensure that element is visible  //h3[.='Mail Send advice']/..//h2[@class='highRisk changeTextColor'][.='${MS_SCORE}']
	Ensure that element is visible  //h3[.='Mail Send advice']/..//h3[.='${MS_MSG}']
	
Ensure High Risk Overall risk score value is [${ORS_SCORE}] with message [${ORS_MSG}]
	Ensure that element is visible  //h3[.='Overall risk score ']/..//h2[.=' ${ORS_SCORE}']
	Ensure that element is visible  //h3[.='Overall risk score ']/..//h3[.='${ORS_MSG} ']
	
Ensure Low Risk Toolset score value is [${TSS_SCORE}] with message [${TSS_MSG}]
	Ensure that element is visible  //h3[.='Toolset trust score']/..//h2[@class='lowRisk changeTextColor'][.='${TSS_SCORE}']
	Ensure that element is visible  //h3[.='Toolset trust score']/..//h3[.='${TSS_MSG}']
	
Ensure Low Risk Mail Send advice value is [${MS_SCORE}] with message [${MS_MSG}]
	Ensure that element is visible  //h3[.='Mail Send advice']/..//h2[@class='lowRisk changeTextColor'][.='${MS_SCORE}']
	Ensure that element is visible  //h3[.='Mail Send advice']/..//h3[.='${MS_MSG}']
	
Ensure Low Risk Overall risk score value is [${ORS_SCORE}] with message [${ORS_MSG}]
	Ensure that element is visible  //h3[.='Overall risk score ']/..//h2[.=' ${ORS_SCORE}']
	Ensure that element is visible  //h3[.='Overall risk score ']/..//h3[.='${ORS_MSG} ']

Move mouse over the results section and verify the successful verification
	Mouse Over  //*[@id='emailVerifyResultWrap']
	Ensure that element is visible  //div[@class='popupVerify']//p[.='Successful verification.']
	
Move mouse over the results section and verify that there are no mail servers defined for this domain
	Mouse Over  //*[@id='emailVerifyResultWrap']
	Ensure that element is visible  //div[@class='popupVerify']//p[.='There are no mail servers defined for this domain, according to DNS.']

OK Adivce - Safe To Send message in green appears
	Ensure that element is visible  //*[@id='emailVerifyResultWrap']//div[@class='boxVerifyResult col-lg-8 col-lg-push-2 lowRisk']//h1[.='Ok']
	Ensure that element is visible  //*[@id='emailVerifyResultWrap']//div[@class='boxVerifyResult col-lg-8 col-lg-push-2 lowRisk']//p[.='Advice: Safe To Send']	
		
Bad Advice - do not send message in red appears
	Ensure that element is visible  //*[@id='emailVerifyResultWrap']//div[@class='boxVerifyResult col-lg-8 col-lg-push-2 highRisk']//h1[.='Bad']
	Ensure that element is visible  //*[@id='emailVerifyResultWrap']//div[@class='boxVerifyResult col-lg-8 col-lg-push-2 highRisk']//p[.='Advice: Do Not Send']	
	
    