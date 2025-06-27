G_aDhkerButtonsList = []

func setClickEventForDhkerButton oButton
/*
	we adding the button parent object to G_aDhkerButtonsList (Global Variable)
	then set the click event to send the index of the button in the list
*/
	G_aDhkerButtonsList + ref(oButton.oParentClass)
	oButton.setClickevent('DoDhker('+ len(G_aDhkerButtonsList) +')')

func DoDhker nIndex
/*
	we getting the nIndex from the click event string 
	then get the object using the list
*/ 
	oDhkerClassObject = G_aDhkerButtonsList[nIndex]

	oBtn = oDhkerClassObject.odhkertimesbutton
	oLbl = oDhkerClassObject
	nDhkerTimes = oDhkerClassObject.ntimestosay
	nTimes = 0+oBtn.text()


	if nTimes=nDhkerTimes
		oDhkerClassObject.oDhkerLabelTimesToSay {
			setDisabled(0)  		
		}
	ok

	if nTimes != 0
		nTimes--
		obtn.setText(''+nTimes)
		if nTimes = 0
			oBtn.setDisabled(1)
			oScroll = oDhkerClassObject.oScrollParent 
			

			yDiretion = oBtn.mapTo(oScroll.widget(), new QPoint(){ setX(0) setY(0) }).y()+oBtn.height()+40

			if ismobile()
				yDiretion -= 12
			ok
			oScroll.verticalScrollBar().setValue(yDiretion)

		ok
	ok

