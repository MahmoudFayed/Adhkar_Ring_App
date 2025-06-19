cAppTitle = 'تطبيــق الأذكــار'
cAdhkarSabahText = 'أذكـــار الصــبــــاح'
cAdhkarMasaaText = 'أذكـــار الـمـســـاء'
cAdhkarSleepText = 'أذكـــار الـنــوم'
cAdhkarAfterSleep = 'أذكار الاستيقاظ من النوم'
cAdhkarGreat = 'أذكــــار عظيــمـــة'

nSplashScreen = 0
nMainScreen = 0
nAdhkarSabahScreem = 1
nAdhkarMasaaScreen = 2
nAdhkarSleepScreen = 3
ndhkarAfterSleepScreen = 4
ndhkargreatScreen = 5

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
	func pGo_Sleep_adhkar
		oView.oMainStackWidget.setCurrentindex(nAdhkarSleepScreen)
	func pGo_after_Sleep_adhkar
		oView.oMainStackWidget.setCurrentindex(ndhkarAfterSleepScreen)
	func pGo_great_adhkar
		oView.oMainStackWidget.setCurrentindex(ndhkargreatScreen)



	func pNavigateTo nScreenId
		oView.oMainStackWidget.setCurrentindex(nScreenId)

	func pShowVersion_note
		new version_notes_widget(oView.win)

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
				oView.oAppHeader.l_isLargeText=0
				cText = substr(cAdhkarSabahText,'ـ','')
			on nAdhkarMasaaScreen
				oView.oAppHeader.l_isLargeText=0
				cText = substr(cAdhkarMasaaText,'ـ','')
			on nAdhkarSleepScreen
				oView.oAppHeader.l_isLargeText=0
				cText = substr(cAdhkarSleepText,'ـ','')
			on ndhkarAfterSleepScreen
				oView.oAppHeader.l_isLargeText=1
				cText = substr(cAdhkarAfterSleep,'ـ','')
			on ndhkargreatScreen
				oView.oAppHeader.l_isLargeText=0
				cText = substr(cAdhkarGreat,'ـ','')

		other
			cText = substr(cAppTitle,'ـ','')
		off
		oView.oAppHeader.AppNameLabel.setText(cText)
