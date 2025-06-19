cAppHeaderStyle='QWidget{
	background:none;
	background: qlineargradient(
	    angle: 357,
	    stop: 0.02 rgba(31, 76, 92, 255),
	    stop: 0.2 rgba(20, 54, 69, 255),
	    stop: 0.46 rgba(26, 59, 36, 255),
	    stop: 1.0 rgba(36, 35, 19, 255)
	);
	border-radius:24px;
}'


class AppHeader from qWidget
	AppNameLabel
	AppIconLabel
	AppNavigationButton	
	l_isLargeText = 0	
	aActionsTexts = ['الــرئــيـســيـــة',
cAdhkarSabahText,
cAdhkarMasaaText,
cAdhkarSleepText,
cAdhkarAfterSleep
]

	func init pWidget
		super.init()
		setParent(pWidget)
		hide()
		AppNameLabel = new qlabel(pWidget)
		setStylesheet(cAppHeaderStyle)
		setFixedHeight(80)
		//ConfigureAppName()

		AppIconLabel = new qlabel(pWidget)
		configureAppIcon() 
		
		AppNavigationButton = new QToolButton(pWidget) 
		configureAppNavigator(pWidget)
		setLayout(new  qhboxlayout() {
			addSpacing(5)
			addWidget(this.AppNavigationButton)
			addstretch(20)
			addWidget(this.AppNameLabel)
			addstretch(20)
			addWidget(this.AppIconLabel)
			addSpacing(5)

			setAlignment(this.AppNavigationButton,Qt_alignLeft | Qt_alignVCenter)
			setAlignment(this.AppNameLabel,Qt_alignHCenter | Qt_alignVCenter)
			setAlignment(this.AppIconLabel,Qt_alignRight | Qt_alignVCenter)
		})
		return self

	func ConfigureAppName
		AppNameLabel{
			setText(cAppTitle)
			//setText('<a href="https://google.com">'+cAppTitle+'</a>')
			setFont(oMainAppFont)
			setTextFormat(2)
			setOpenexternallinks(1)
			ConfLbl(this.AppNameLabel)
			if this.l_isLargeText=0
				setStylesheet('QLabel{font-size:30px;}')
			else
				setStylesheet('QLabel{font-size:20px;}')
			ok
			# 'use left because we did not modified layout direction !'
			setAlignment(Qt_alignLeft | Qt_alignVCenter )
		}


	func configureAppIcon
		oLogoTemp = new qPixmap(AppFile('images/logo.png')) 
		oLogo = oLogoTemp.scaled(60,60,1,1)
		
		AppIconLabel{
			setPixmap(oLogo)
			setAlignment(Qt_alignHCenter | Qt_alignVCenter )

		}

	func configureAppNavigator pWidget 
		pMainMenu  = new QMenu(pWidget){
			setMaximumwidth(pWidget.maximumwidth()-20)
			setFixedwidth(pWidget.maximumwidth()-40)
			if iswebassembly() 
				animatemenupopup(pObject)
			ok
			
			setStyleSheet(cNavigatorListStyle)
			GoToHomeAction = new QAction(pWidget){
				setText(this.getDahes(this.aActionsTexts[1]))
				setClickEvent(method('pNavigateTo('+nMainScreen+')'))
			}
			GoToAdhkarSabahAction=new QAction(pWidget){
				setText(this.getDahes(this.aActionsTexts[2]))
				setClickEvent(method('pNavigateTo('+nAdhkarSabahScreem+')'))
			}
			GoToAdhkarMasaaAction=new QAction(pWidget){
				setText(this.getDahes(this.aActionsTexts[3]))
				setClickEvent(method('pNavigateTo('+nAdhkarMasaaScreen+')'))
			}


			GoToAdhkarSleepAction=new QAction(pWidget){
				setText(this.getDahes(this.aActionsTexts[4]))
				setClickEvent(method('pNavigateTo('+nAdhkarSleepScreen+')'))
			}

			GoToAdhkarAfterSleepAction=new QAction(pWidget){
				setText(this.getDahes(this.aActionsTexts[5]))
				setClickEvent(method('pNavigateTo('+ndhkarAfterSleepScreen+')'))
			}



	
			addAction(GoToHomeAction)
			addSeparator()
			addAction(GoToAdhkarSabahAction)
			addAction(GoToAdhkarMasaaAction)
			addSeparator()
			addAction(GoToAdhkarSleepAction)
			addAction(GoToAdhkarAfterSleepAction)
			addSeparator()
		}

		AppNavigationButton  {
			setStylesheet(cNavigatorStyle)
			setText('☰')
			setFixedsize(40,40)
			setPopupMode(2)
			setMenu(pMainMenu)
		}

	func setl_isLargeText n
		this.l_isLargeText = n
		ConfigureAppName()

	func getBiggestText 
		nBiggest = 0
		for x=1 to len(aActionsTexts)
			if len(aActionsTexts[x]) > nBiggest
				nBiggest = len(aActionsTexts[x])
			ok
		next
		return nBiggest

	func getDahes cText
		cText = substr(cText ,'ـ','') 
		nTextLen = len(cText) + 2
		nBiggestTextLength = getBiggestText()
		return copy(' ', (nBiggestTextLength-nTextLen)/2 )+cText
