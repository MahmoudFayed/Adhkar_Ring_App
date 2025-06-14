

class adhkar_sabah from qWidget
	oLayout oAdhkarPanel

	func init pWidget
		super.init()
		oAdhkarPanel = new Adkhar_Panel(pWidget,azkar_Sabah)
		oLayout = new qvboxLayout() {
			addWidget(this.oAdhkarPanel)
		}

		setLayout(oLayout)
		return self
