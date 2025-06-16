
class version_notes_widget from qdialog
	oCloseBtn
	oLayout
	oDescLabel
	oScroll
	

	func init pWidget

		super.init(pWidget)
		nWidth = pWidget.width()-50
		nHeight = 400
		resize(nWidth,nHeight)
		if iswebassembly()
			move( ((pWidget.width()-nWidth)/2),(pWidget.height()-nHeight)/2 )
		ok
		setWindowFlags( Qt_SplashScreen | Qt_WindowStaysOnTopHint )

		oCloseBtn=new qpushbutton(pWidget) {
			setText('X')
			setStyleSheet(`GPushButton{font-size:24px;padding:2px;background-color:red;color:#fff;border-radius:20px;}`)
			setClickevent('this.donedialog(0)')
			setFixedSize(40,40)
		}	

		oDescLabel = new qLabel(pWidget) {
			setStyleSheet('QLabel{ 
			background:none;font-size:20px;
				 }')
			setTextformat(2)
			setText(cVersion_note_detailes)
			setwordwrap(1)
			setFixedWidth(this.width()-30 )
		} 
		oScroll = new qScrollarea(pWidget) {
			if iswebassembly() # 'cpp function to handel scroll using phones'
				MakeWidgetScrollAble_Bytouch(pObject)
			ok
			setStyleSheet('QWidget{ background:transparent; }')
			setWidget(this.oDescLabel)
			setFixedWidth(this.width()-5 )
			setFixedHeight(this.height()-20 )
		}
		
		oLayout = new qvboxlayout() {
			addWidget(this.oCloseBtn)
			addWidget(this.oScroll)
			setAlignment(this.oCloseBtn, qt_alignTop | qt_alignRight )
			setAlignment(this.oScroll, qt_alignHcenter | qt_alignVcenter)
		}
		setLayout(oLayout)
		exec()
		return self
