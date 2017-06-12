/**Created by the Morn,do not modify.*/
package uis.chat {
	import morn.core.components.*;
	public class ChatViewUI extends View {
		public var btnAction:Button = null;
		public var btnChannel:Button = null;
		public var rtfInput:RichTextField = null;
		public var rtfOutput:RichTextField = null;
		protected static var uiXML:XML =
			<View width="360" height="200">
			  <Button skin="png.public.btn_common" x="324" width="34" height="28" bottom="5" var="btnAction" label="chat_send" y="159"/>
			  <Button label="channel_world" skin="png.public.btn_common" x="5" y="159" width="60" height="28" var="btnChannel" bottom="5"/>
			  <RichTextField x="72" y="158" width="243" height="28" skin="png.comp.textinput" bottom="5" var="rtfInput" isInput="true" size="12"/>
			  <RichTextField x="1" y="2" width="356" height="151" skin="png.comp.textinput" vScrollBarSkin="png.comp.vscroll" var="rtfOutput" size="12" bottom="38"/>
			</View>;
		public function ChatViewUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}