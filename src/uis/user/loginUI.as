/**Created by the Morn,do not modify.*/
package uis.user {
	import morn.core.components.*;
	public class loginUI extends Dialog {
		public var txtUserName:TextInput = null;
		public var txtPassword:TextInput = null;
		public var btnAction:Button = null;
		protected static var uiXML:XML =
			<Dialog width="600" height="400">
			  <Label text="username:" x="152" y="93" width="83" height="22"/>
			  <Label text="password:" x="155" y="126" width="69" height="22" isHtml="true"/>
			  <TextInput skin="png.public.textinput" x="239" y="91" var="txtUserName"/>
			  <TextInput skin="png.public.textinput" x="239" y="125" var="txtPassword" asPassword="true"/>
			  <Button label="longin" skin="png.public.btn_common" x="228" y="193" var="btnAction"/>
			</Dialog>;
		public function loginUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}