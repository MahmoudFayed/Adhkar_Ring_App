
class MainButtonsList from qScrollArea
	oLayout oWidget
	btnMainAzkarSabah
	btnMainAzkarMasaa
	btnMainAzkarSleep

	func init pWidget
		super.init(pWidget)
		oWidget = new qwidget() 
		oLayout = new qvboxlayout() 
		setStylesheet(cScrollWidgetStyle)
		setminimumheight(400)
		setMinimumwidth(400)
		btnMainAzkarSabah = new MainButton(pWidget) {
			setFont(oMainAppFont)
			setText('اذكار الصباح')
			setClickevent(method(:pGo_Sabah_adhkar))
		}
		btnMainAzkarMasaa = new MainButton(pWidget) {
			setFont(oMainAppFont)
			setText('اذكار المساء')
			setClickevent(method(:pGo_Masaa_adhkar))
		}

		btnMainAzkarSleep = new MainButton(pWidget) {
			setFont(oMainAppFont)
			setText('اذكار النوم')
			//setClickevent(method(:pGo_Masaa_adhkar))
			hide()
		}


		oLayout{
			addWidget(this.btnMainAzkarSabah)
			addWidget(this.btnMainAzkarMasaa)
			addWidget(this.btnMainAzkarSleep)
		}
		oWidget.setLayout(oLayout)
		setWidget(oWidget)
		return self

class MainScreen From QWidget
	Adhkar_label 
	oScrollArea
	oMainScreen_Layout

	func init pWidget
		super.init()
		ConfigureScreen(pWidget)
		setLayout(oMainScreen_Layout)

		return self

	func ConfigureScreen pWidget

		Adhkar_label = new qLabel(pWidget) {
			setFont(oMainAppFont)

			setText(cAppTitle)
			ConfLbl(this.Adhkar_label)
			setStylesheet('QLabel{font-size:50px;background:none;}')
			setAlignment(qt_alignHcenter | qt_alignVcenter)
		}
		oScrollArea = new MainButtonsList(pWidget){}
		
		oMainScreen_Layout = new qvboxlayout() {
			addwidget(this.Adhkar_label)
			setAlignment(this.Adhkar_label, qt_aligntop)

			addWidget(this.oScrollArea)
			setAlignment(this.oScrollArea, qt_alignBottom | qt_AlignVCenter)

			//addWidget(this.btnMainAzkarSabah)
			//addWidget(this.btnMainAzkarMasaa)
			//setAlignment(this.btnMainAzkarSabah, qt_aligntop | qt_AlignVCenter)
			//setAlignment(this.btnMainAzkarMasaa, qt_aligntop | qt_AlignVCenter)
		}
