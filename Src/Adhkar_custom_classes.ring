G_DhkerIndex = 0

class MainButton from qpushbutton
	nFontSize = 40
	

	func init pWidget
		super.init(pWidget)
		setFixedSize(300,150)
		setStylesheet(customStyleSheet())
		return self
	func setBigText cText
		nFontSize = 20
		setStylesheet(customStyleSheet())
		setText(cText)

	func customStyleSheet
		return  ' /* "#Start Of Style" */ 
GPushButton{
	padding:40px;
	font-size:'+nFontSize+'px;
	background-color:#111;
	background: qradialgradient(cx: 0.5, cy: 0.5, radius: 0.7,
	    stop: 0.02 rgba(31, 76, 92, 1),
	    stop: 0.2 rgba(20, 54, 69, 1),
	    stop: 0.46 rgba(26, 59, 36, 1),
      	stop: 1.0 rgba(36, 35, 19, 1)
    );
	border-radius:20;
}
GPushButton:hover{
	border: 2px solid #fff;
	
}
GPushButton:pressed{
	border: 2px solid yellow;
    background: qradialgradient(cx: 0.5, cy: 0.5, radius: 0.7,
        stop: 0.02 rgba(15, 38, 46, 1),
        stop: 0.2 rgba(10, 27, 34, 1),
        stop: 0.46 rgba(13, 29, 18, 1),
        stop: 1.0 rgba(18, 17, 9, 1)
    );
}

/* "End Of Style" */ 
'
		

