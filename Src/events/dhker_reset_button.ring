func setClickEventForReSetDhkerButton pObject,nDhkerTimes ,pDhkerButton_pObject
/*
	In This Method We Have To Create Our Temp Object without init() method
		so : new qpushbutton , new qlabel ,new qimage etc...
	note that we canpass the button reset directly not to use :pObject
		But i choosed this method for educational purpose ...:D

*/
	obtn = new qpushbutton 
	obtn.pObject = pObject
	obtn.setClickevent('DoReSetDhker('+getpointer(pDhkerButton_pObject)+','+nDhkerTimes+')')

func DoReSetDhker pPointer,nDhkerTimes
	oBtn = new qpushbutton {
		pObject=nullpointer()
		setpointer(pObject,pPointer )
		setText(''+nDhkerTimes)
		setDisabled(0)
	}

