# libs
Load "stdlibcore.ring"
Load "lightguilib.ring"
# static
	load 'Adhkar_List.ring'
	load 'core/styles.ring'
	load 'core/version_notes.ring'

	load 'core/functions.ring'
# Classes
	load 'Adhkar_custom_classes.ring'
# Widgets
	load 'widgets/appheader.ring'
	load 'widgets/adhkar_widget.ring'
	load 'widgets/adhkar_panel.ring'
	load 'widgets/version_notes.ring'
# Events
	load 'events/dhker_button_click.ring'
	load 'events/dhker_reset_button.ring'
	load 'events/dhker_share_button.ring'
# screens
	load 'screens/splashscreen.ring'
	load 'screens/main_screen.ring'
	load 'screens/adhkar_sabah.ring'
	load 'screens/adhkar_masaa.ring'
	load 'screens/adhkar_sleep.ring'
	load 'screens/adhkar_after_sleep.ring'
	load 'screens/adhkar_great.ring'

oMainAppFont = new qfont("",0,0,0) 
	# 'IOS 15 Heavy' is Main Font Found in fonts/appfont.ttf
oMainAppFont.fromstring("IOS 15 Heavy,22,-1,5,50,0,0,0,0,0,Regular")

import System.GUI

if IsMainSourceFile() {
	ring_state_main('AdhkarMain.ring')
}

class adhkarView from WindowsViewParent
	nAppWidth = 360
	nAppHeight = 700
	cAppName = 'تطبيق الاذكار للغة البرمجة رينج'
	l_isMobile = ismobile()

	if this.l_isMobile
		oDesktop = new qdesktopwidget() 
		nAppWidth = oDesktop.width()-25
		nAppHeight = oDesktop.height()
	ok
	mainwin = new qWidget(){
		move(300,100)
		resize(nAppWidth,nAppHeight)
		setWindowTitle(cAppName)

		setstylesheet(cWindowStyle) 
	}

    oFilter = new qallevents(mainwin)
    oFilter.setKeyPressEvent(method(:pButtonClicked))
    mainwin.installeventfilter(oFilter)


	win = new qWidget() { 
		
		setfixedsize(nAppWidth+10,nAppHeight)
		setMaximumHeight(nAppHeight)
		setObjectname('Win')
		setstylesheet(cWindowStyle) 
	}
	# 'App Header'	
		oAppHeader = new AppHeader(win){
			setMinimumwidth(nAppWidth-10)
		}
		
	# 'Screens Widgets'

		oMainScreen_widget = new MainScreen(win){
			setMaximumWidth(nAppWidth)
		}

		oAdhkar_sabah_widget = new adhkar_sabah(win){
			setMaximumWidth(nAppWidth)

		}

		oAdhkar_massa_widget = new adhkar_masaa(win){
			setMaximumWidth(nAppWidth)
		}

		oAdhkar_sleep_widget = new adhkar_sleep(win){
			setMaximumWidth(nAppWidth)
		}

		oAdhkar_after_sleep_widget = new adhkar_after_sleep(win){
			setMaximumWidth(nAppWidth)
		}

		oAdhkar_great_widget = new adhkar_great(win){
			setMaximumWidth(nAppWidth)
		}
		

	oMainStackWidget = new QStackedWidget(win){
		setcurrentChangedEvent(method(:pScreenChanged))

		addWidget(oMainScreen_widget)
		addWidget(oAdhkar_sabah_widget)
		addWidget(oAdhkar_massa_widget)
		addwidget(oAdhkar_sleep_widget)
		addWidget(oAdhkar_after_sleep_widget)
		addWidget(oAdhkar_great_widget)

		setMaximumWidth(nAppWidth)
		setMaximumHeight(nAppHeight-10)
		setMinimumwidth(nAppWidth-10)

	}


	pMainLayout = new qVboxlayout() {
		addWidget(oAppHeader)
		addWidget(oMainStackWidget)
		setAlignment(oAppHeader, qt_AlignTop | qt_AlignHCenter )
		setAlignment(oMainStackWidget, qt_AlignHCenter )
	}
	win.setLayout(pMainLayout)
	mainwin{
		setLayout(		
			new qhboxlayout(){
				addwidget(this.win)
				if ismobile()
					addSpacing(10)
					setAlignment(this.win, qt_Alignleft | qt_AlignVCenter )
				else
					setAlignment(this.win, qt_AlignHCenter | qt_AlignVCenter )
				ok
			}
		)
		show()
	}

