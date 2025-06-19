
class adhkar_great from qWidget


	oLayout oAdhkarPanel

	func init pWidget
		super.init()
		oAdhkarPanel = new Adkhar_Panel(pWidget,great_adhkar)
		oLayout = new qvboxLayout() {
			addWidget(this.oAdhkarPanel)
		}

		setLayout(oLayout)
		return self
