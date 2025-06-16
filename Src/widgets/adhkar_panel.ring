
class Adkhar_Panel from qScrollarea
	oLayout = new qvboxlayout() 

	func init pWidget,aAdhkarList
		super.init(pWidget)
		setLayout(oLayout)
		setStylesheet(cScrollWidgetStyle)
		if iswebassembly() # 'cpp function to handel scroll using phones'
			//MakeWidgetScrollAble_Bytouch(pObject)
		ok
		CreateAdhkarWidgets(pWidget,aAdhkarList)
		# 'Setting Alignment for qscrollArea'
			setAlignment(qt_AlignHCenter | qt_AlignVCenter)

		return self

	func CreateAdhkarWidgets pWidget,aAdhkarList
		oWidget = new qWidget()
		oLay = new qvboxlayout()
		if G_DhkerIndex != 0
			G_DhkerIndex = 0
		ok
		for nDhkerIndex=1 to len(aAdhkarList)
			G_DhkerIndex++
			oTempDhkerWidget = new AdkharWidget(ref(this),pWidget,aAdhkarList[nDhkerIndex][1],aAdhkarList[nDhkerIndex][2]){
			}
			oTempLayout = new qvboxlayout() {
				addWidget(oTempDhkerWidget)
			}
	
			oLay.addLayout(oTempLayout)
			oLay.addSpacing(20)
		next
			oWidget.setLayout(oLay)

		setWidget(oWidget)

