*** Settings ***
Library		SeleniumLibrary	timeout=60 s

*** Variables ***

#Landing Page

${H1_Email_Verifier}  				//h1[@class='awesomeness-title'][.='Email Verifier']
${input_Enter_mail_Address_ID}  	//*[@id='contactDomain']
${input_Enter_mail_Address_text}  	//input[@placeholder='Enter mail Address']
${btn_Verify_1_credit}				//*[@id='btnFindEmail']//span[contains(.,'Verify (1 Credit)')]
${btn_Bulk_email_verifier}			//*[@id='btnFindEmail']//span[contains(.,'Bulk email verifier')]

#Left Menu Items - LMI
${LMI_Dashboard}  				//*[@id='side-menu']//span[@class='nav-label'][.='Dashboard']
${LMI_Toolset}  				//*[@id='side-menu']//span[@class='nav-label'][.='Toolset']
${LMI_Email_finder}  			//*[@id='side-menu']//span[@class='nav-label'][.='Email finder']
${LMI_Email_deliverability} 	//*[@id='side-menu']//span[@class='nav-label'][.='Email deliverability']
${LMI_Awesomeness_checker}  	//*[@id='side-menu']//span[@class='nav-label'][.='Awesomeness checker']
${LMI_Market_mapper}  			//*[@id='side-menu']//span[@class='nav-label'][.='Market mapper']
${LMI_Campaign_Forecaster}  	//*[@id='side-menu']//span[@class='nav-label'][.='Campaign Forecaster']

#Login form
${H3_B2B_Prospecting_Toolset}  	//h3[@class='content-group'][.='Welcome to your B2B Prospecting Toolset']
${Input_User}					//*[@id='Email']	
${Input_Pass}					//*[@id='Password']
${btn_Sign_in}					//button[@type='submit'][contains(.,'Sign in')]
${btn_Google}					//button[@type='submit'][contains(.,'Google')]
${btn_Linkedin}					//button[@type='submit'][contains(.,'LinkedIn')]
                    