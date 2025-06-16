
class adhkar_sleep from qWidget


	oLayout oAdhkarPanel

	func init pWidget
		super.init()
		oAdhkarPanel = new Adkhar_Panel(pWidget,Adhkar_sleep)
		oLayout = new qvboxLayout() {
			addWidget(this.oAdhkarPanel)
		}

		setLayout(oLayout)
		return self
