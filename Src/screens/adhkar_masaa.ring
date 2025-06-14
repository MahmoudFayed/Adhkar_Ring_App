

class adhkar_masaa from qWidget


	oLayout oAdhkarPanel

	func init pWidget
		super.init()
		oAdhkarPanel = new Adkhar_Panel(pWidget,azkar_masa)
		oLayout = new qvboxLayout() {
			addWidget(this.oAdhkarPanel)
		}

		setLayout(oLayout)
		return self
