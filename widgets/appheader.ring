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
	
	func init pWidget
		super.init()
		setParent(pWidget)
		hide()
		AppNameLabel = new qlabel(pWidget)
		setStylesheet(cAppHeaderStyle)
		setFixedHeight(80)
		ConfigureAppName()

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
			setStylesheet('QLabel{font-size:30px;}')
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
			setStyleSheet(cNavigatorListStyle)
			GoToHomeAction = new QAction(pWidget){
				setText('    '+
'الــرئــيـســيـــة')
				setClickEvent(method('pNavigateTo('+nMainScreen+')'))
			}
			GoToAdhkarSabahAction=new QAction(pWidget){
				setText(' '+cAdhkarSabahText)
				setClickEvent(method('pNavigateTo('+nAdhkarSabahScreem+')'))
			}
			GoToAdhkarMasaaAction=new QAction(pWidget){
				setText(cAdhkarMasaaText)
				setClickEvent(method('pNavigateTo('+nAdhkarMasaaScreen+')'))
			}
			addAction(GoToHomeAction)
			addSeparator()
			addAction(GoToAdhkarSabahAction)
			addAction(GoToAdhkarMasaaAction)
		}

		AppNavigationButton  {
			setStylesheet(cNavigatorStyle)
			setText('☰')
			setFixedsize(40,40)
			setPopupMode(2)
			setMenu(pMainMenu)
		}
