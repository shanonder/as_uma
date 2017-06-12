/**Created by the Morn,do not modify.*/
package uis.user {
	import morn.core.components.*;
	public class createRoleUI extends View {
		public var rgProf:RadioGroup = null;
		public var txtName:TextInput = null;
		public var btnCreate:Button = null;
		protected static var uiXML:XML =
			<View width="600" height="400">
			  <RadioGroup labels="1,2,3" skin="png.comp.radiogroup" x="210" y="169" var="rgProf"/>
			  <TextInput skin="png.public.textinput" x="244" y="197" var="txtName"/>
			  <Label text="roleName:" x="172" y="197"/>
			  <Button label="Create" skin="png.public.btn_common" x="230" y="247" var="btnCreate"/>
			</View>;
		public function createRoleUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}