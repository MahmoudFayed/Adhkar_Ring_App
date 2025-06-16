cWindowStyle = `QWidget{
background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,
    stop: 0.02 rgba(31, 76, 92, 1),
    stop: 0.2 rgba(20, 54, 69, 1),
    stop: 0.46 rgba(26, 59, 36, 1),
    stop: 1.0 rgba(36, 35, 19, 1)
);
border-radius:24px;	
}`

cVersion_notes_btn_style = `GPushButton{
	padding:20px;
	font-size:24px;
	background:none;
}
GPushButton:hover{}
GPushButton:pressed{ background:none; }
`

cScrollWidgetStyle_withoutBar=``
cScrollWidgetStyle = `
QScrollArea QScrollBar {
    background-color: transparent ;
    margin: 0px;
    width: 40px; 
}

QScrollArea QScrollBar::handle:vertical {
    background-color: #111;
    min-height: 20px;
    border-radius: 8px;
    width: 40px; 
}

QScrollArea QScrollBar::handle:hover {
    background-color: #505050;
}

QScrollArea QScrollBar::handle:pressed {
    background-color: #6a6a6a;
}

QScrollArea QScrollBar::add-line, QScrollArea QScrollBar::sub-line {
    background-color: #2e2e2e;
    width: 40px;
    height: 12px;
}

QScrollArea QScrollBar::add-page, QScrollArea QScrollBar::sub-page {
    background-color: transparent;
}`
cDhkerTimesButtonStyle = '
GPushButton:disabled{
	background-color:#222;
}
GPushButton{
	font-size:36px;
	border:1px solid #fff;
	border-radius:50;
	background-color:#1A3B24;
}
GPushButton:hover{
	border:1px solid yellow;
	color:yellow;
}
GPushButton:pressed{
	border:1px solid black;
	background-color:red;
	font-size:44px;
}'

cDhkerReSetButtonStyle = 'GPushButton{
	font-size:22px;
	border:1px solid #fff;
	border-radius:20;
	background-color:#1F4C5C;
}
GPushButton:hover{
	border:1px solid red;
	color:yellow;
}
GPushButton:pressed{
	border:1px solid black;
	background-color:darkred;
	font-size:30px;
}'

cDhkerTimesLabelStyle = `QLabel{
	font-size:22px;
	border-radius:22;
	background-color:#1A3B24;
}
QLabel:disabled {
	background:none;
	color: transparent ;
	border:none;
}
`

cDhkerIndexLabelStyle='QLabel{
	background-color:#111;
	border:1px solid #fff;
	border-radius:18;
	font-size : 24px;
}'

cNavigatorStyle = 'GToolButton{
	background:none;
	font-size:34px;
	border:1px solid rgba(58, 45, 52, 0.28);
	border-radius:10px;
	text-align:center;
}
GToolButton::menu-indicator { image:none; }

GToolButton:hover{
	background-color:rgba(58, 45, 52, 0.96);
	border-color:#1f4b5b;
	color:#1f4b5b;
}
GToolButton:focus{}
GToolButton:pressed{}
'
cNavigatorListStyle=' QMenu {
        font-size: 34px; 
        border: 1px solid #ccc;
		border-radius:20px;
        padding: 5px;
    }

    QMenu::item {
        background-color: transparent;
        border: none; 
		padding:15px;
    }

    QMenu:item:selected {
        border: 1px solid #fff;
        border-radius: 20px;
        background-color: #1f4b5b;
    }
'
