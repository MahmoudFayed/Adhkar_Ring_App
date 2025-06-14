
func setShareToWhatsAppBtnClick oButton
	pPointer = object2pointer(ref(oButton.oParentClass))
	oButton.setClickevent('Do_SendToWhatsApp('+ getpointer(pPointer) +')')

func Do_SendToWhatsApp pPointer
	oTempPointer = object2pointer(oTempObj)
	setPointer(oTempPointer , pPointer)
	oDhkerClassObject = pointer2object(oTempPointer)
	
	cText = oDhkerClassObject.cDhkerText
	oTextEdit = new QTextEdit(new qwidget()){
		setDisabled(1)
		setHtml(cText)
		cText = toPlainText()
	}

	cUrl  = 'https://api.whatsapp.com/send'
	QUrl = new qUrl(cUrl){
		setQuery('text='+cText,0)
	}

	new QDesktopServices {
		openurl(QUrl)
	}
	
