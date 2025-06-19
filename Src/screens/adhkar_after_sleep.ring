
class adhkar_after_sleep from qWidget


	oLayout oAdhkarPanel

	func init pWidget
		super.init()
		oAdhkarPanel = new Adkhar_Panel(pWidget,aZkar_AfterSleep)
		oLayout = new qvboxLayout() {
			addWidget(this.oAdhkarPanel)
		}

		setLayout(oLayout)
		return self
