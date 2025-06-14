cAppTitle = 'تطبيــق الأذكــار'
cAdhkarSabahText = 'أذكـــار الصــبــــاح'
cAdhkarMasaaText = 'أذكـــار الـــمــســـاء'

nSplashScreen = 0
nMainScreen = 0
nAdhkarSabahScreem = 1
nAdhkarMasaaScreen = 2

load "adhkarView.ring"

import System.GUI

if IsMainSourceFile() {
	oApp = new App {
		StyleFusionblack()
		openWindow(:adhkarController)
		
		if iswebassembly()
				hidekeyboard(pObject) # 'ring function defiened in cpp to hide keyboard in mobile'
		else
			exec()
		ok
	}
}

class adhkarController from windowsControllerParent
? ' ------------------------------------------
|           Ring Adhkar Application        |
|  Made By : Ph.T & Dev. Mohannad Alayash  |
|  Contact : mohannadazazalayash@gmail.com |
|             Date : 14/06/2025            |
|__________________________________________|
'
	

	l_isInitState = 1
	oView = new adhkarView
	

	func pGo_Sabah_adhkar
		oView.oMainStackWidget.setCurrentindex(nAdhkarSabahScreem)

	func pGo_Masaa_adhkar
		oView.oMainStackWidget.setCurrentindex(nAdhkarMasaaScreen)
	func pNavigateTo nScreenId
		oView.oMainStackWidget.setCurrentindex(nScreenId)



	func pScreenChanged
		if this.l_isInitState = 1 
			this.l_isInitState=0
			return 
		ok
		nCurrentScreen = oView.oMainStackWidget.currentindex()
		UpdatePageTitle( nCurrentScreen)
		oView.oAppHeader{ 
			sethidden( nCurrentScreen = nMainScreen )
		}
		
	func UpdatePageTitle nScreenid
		cText = ''
		switch nScreenid
			on nAdhkarSabahScreem
				cText = substr(cAdhkarSabahText,'ـ','')
			on nAdhkarMasaaScreen
				cText = substr(cAdhkarMasaaText,'ـ','')
		other
			cText = substr(cAppTitle,'ـ','')
		off
		oView.oAppHeader.AppNameLabel.setText(cText)
