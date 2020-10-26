*** Keywords ***

Within the Medical Record Context Area
	${MEDREC} =  Set Variable  //div[contains(@class, 'x-grid-cell-inner')]
	Set Global Variable  ${MEDREC}
	