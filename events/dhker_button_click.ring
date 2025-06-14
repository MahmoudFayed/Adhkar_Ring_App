
func setClickEventForDhkerButton oButton
/*
	First Step is to get the pointer of Parent using ref function
	if we did not use ref the app will crash and stop.

	Two Ways Are Incorrect to use in this case (if we remove ref function):
		1 - we have to use return at the end of function 
			to avoid delete the pointers by Ring VM
		2 - after using return you will expect to app to run correctly but,
			the function pointer2object() will return an empty list,
			that means the Ring VM used ref counting , So we will have empty list.

		Tip/Notes Text From Documentation:

			Before using Pointer2Object() to create a reference, 
			Be sure that the Pointer is valid (Doesn’t point to deallocated memory,
			i.e. deleted list/object)
			
			'So We Use Return in function'

			After using Pointer2Object() to create a reference, 
			and if the original List/Object is deleted, 
			Ring will uses reference counting and will keep 
			the List/Object until the latest reference is removed.


*/
	pPointer = object2pointer(ref(oButton.oParentClass))
	oButton.setClickevent('DoDhker('+ getpointer(pPointer) +')')

func DoDhker pPointer
/*
	oTempObj :  is global temp object created to avoid using 
		varptr() and then setpointer()
*/
	oTempPointer = object2pointer(oTempObj)
	setPointer(oTempPointer , pPointer)
	oDhkerClassObject = pointer2object(oTempPointer)

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
			oScroll.verticalScrollBar().setValue(yDiretion)

		ok
	ok

