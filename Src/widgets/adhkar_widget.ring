
class AdkharWidget from QWidget
	# 'Static Info'
		nTimesToSay=0
		cDhkerText='' 

	oLayout = new qvboxlayout()	
	oScrollParent = ''
	oShareToWhatsAppBtn = ''
	oDhkerIndexLable= ''
	oDhkerLabel = ''
	oDhkerTimesButton = ''
	oDhkerLabelTimesToSay = ''
	oDhkerReSetButton = ''

	func init oScroll,pWidget,cDhkerText,nTimesToSay
		this.cDhkerText = cDhkerText
		this.nTimesToSay = nTimesToSay
		super.init()
		oScrollParent = ref(oScroll)
		setStylesheet('QWidget{background-color:#222;border:2px solid #1F4C5C;border-radius:20; }')

		oDhkerIndexLable = new qLabel(pWidget) {
			setText(''+G_DhkerIndex)
			setfixedsize(36,36)
			setAlignment(qt_alignHcenter | qt_alignVcenter)
			setStylesheet(cDhkerIndexLabelStyle)
		}
		oShareToWhatsAppBtn = new qpushbutton(pWidget){
			setFixedsize(40,40) 
			setStylesheet(cDhkerReSetButtonStyle)
			
			addAttribute(self , 'oParentClass')
			self.oParentClass= this

			setShareToWhatsAppBtnClick(self)
			oTempMap = new qpixmap(appFile("images/whatsapp.png")) 
			oPixMap = oTempMap.scaled(40,40,1,1)
			setIconSize(new qsize(36,36))
			setIcon( new qicon(oPixMap) )

			oTempMap.delete()
			oPixMap.delete()
		}
		oTopLayout = new qhboxlayout() {
			addWidget(this.oShareToWhatsAppBtn)
				addStretch(40)
			addWidget(this.oDhkerIndexLable)

			setAlignment(this.oDhkerIndexLable,qt_alignRight | qt_alignVCenter  )
			setAlignment(this.oShareToWhatsAppBtn,qt_alignLeft | qt_alignVCenter  )

		}

		oDhkerLabel = new qLabel(pWidget) {
			setText(cDhkerText)
			setTextFormat(2)
			setWordWrap(1)
			setfixedwidth(250)
			setAlignment(qt_alignHcenter | qt_alignVcenter)
			setStylesheet('QLabel{ background:none;padding:5px; font-size : 24px; }')
		}
		oDhkerLabelTimesToSay =new qLabel(pWidget) {
			setText(''+nTimesToSay)
			setFixedsize(44,44) 
			setStylesheet(cDhkerTimesLabelStyle)
			setAlignment(qt_alignHcenter | qt_alignVcenter)
			//hide()
			setDisabled(1)
		}
/*
	Using Thie Method By adding attribute of parent to be accessed later then
	passing the object of button to function then Handels Pointers as in file : core/functions.ring 
*/
		oDhkerTimesButton = new qpushbutton(pWidget) {
			setText(''+nTimesToSay)
			addAttribute(self , 'oParentClass')
			self.oParentClass= this
			setClickEventForDhkerButton(self)
			setStylesheet(cDhkerTimesButtonStyle)
			setFixedsize(100,100) 
		}
/*
	in ReSet Button We have another method as we can use the first method :D..
		in This method we have a function that take the pObject (the Pointer attribute Name in All RingQt Classes)
		So it take the pObject of Reset Button,
		and the number of times to be reset,
		and the button of times to say to change the text of it :D...
			Now See : core/functions.ring
*/
		oDhkerReSetButton = new qpushbutton(pWidget) {
			setClickEventForReSetDhkerButton(pObject,nTimesToSay ,this.oDhkerTimesButton.pObject )
			setStylesheet(cDhkerReSetButtonStyle)
			setFixedsize(40,40) 
			setIconsize(new qsize(33,33))
			oTempMap = new qpixmap(appFile("images/reset.png")) 
			oPixMap = oTempMap.scaled(40,40,1,1)
			setIcon( new qicon(oPixMap) )

			oTempMap.delete()
			oPixMap.delete()
		}

		oDhkerLayout= new qHboxlayout() {

			addWidget(this.oDhkerReSetButton)
			addWidget(this.oDhkerTimesButton)
			addWidget(this.oDhkerLabelTimesToSay)
			setAlignment(this.oDhkerReSetButton,qt_alignLeft | qt_alignVCenter )
			setAlignment(this.oDhkerTimesButton,qt_alignHCenter | qt_alignVCenter )
			setAlignment(this.oDhkerLabelTimesToSay,qt_alignRight | qt_alignVCenter )

		}

		oLayout{
			//addWidget(this.oDhkerIndexLable)
			addLayout(oTopLayout)
			addWidget(this.oDhkerLabel)
			addLayout(oDhkerLayout)
			//setAlignment(this.oDhkerIndexLable,qt_alignHCenter | qt_alignVCenter  )
			setAlignment(this.oDhkerLabel,qt_alignLeft )
		}

		setLayout(oLayout)
		return self
