package games.chats
{
	import flash.events.Event;
	import flash.text.TextFormat;
	
	import morn.core.handlers.Handler;
	import morn.core.plugins.ClipTextCell;
	import morn.core.plugins.ShortcutPlugin;
	
	import uis.chat.ChatViewUI;
	
	public class ChatMainView extends ChatViewUI
	{
		public function ChatMainView()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			// TODO Auto Generated method stub
			super.createChildren();
			rtfOutput.isHtml = true;
			rtfOutput.isInput = false;
			rtfOutput.selectable = true;
			var splugin:ShortcutPlugin = new ShortcutPlugin();	
			var shortcuts:Array = [ 
				new ClipTextCell(0,"png.chat.skill_1",6,6,"/a/"),
				new ClipTextCell(0,"png.chat.skill_2",5,6,"/b/"),
				new ClipTextCell(0,"png.chat.skill_3",4,6,"/c/"),
				new ClipTextCell(0,"png.chat.skill_4",4,6,"/d/"),
				new ClipTextCell(0,"png.chat.skill_5",4,6,"/e/"),
				new ClipTextCell(0,"png.chat.skill_6",4,6,"/f/"),
				new ClipTextCell(0,"png.chat.skill_7",4,6,"/g/"),
				new ClipTextCell(0,"png.chat.skill_8",4,6,"/h/"),
				new ClipTextCell(0,"png.chat.skill_9",4,6,"/i/")
			];
			splugin.addShortcut(shortcuts);
			rtfInput.addPlugin(splugin);
			rtfInput.isHtml = true;
//			rtfInput.multiline = false;
//			rtfInput.wordWrap = false;
			rtfInput.size = rtfOutput.size = 14;
			rtfInput.leading = rtfOutput.leading = 8;
			btnAction.clickHandler = new Handler(onSendHandler)
			addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
			
		}
		
		private function onSendHandler():void
		{
			rtfOutput.importXML(rtfInput.exportXML());
			rtfInput.clear();
			
		}
		
		protected function onAddToStage(event:Event):void
		{
			App.stage.addEventListener(Event.RESIZE,onStageResize);
			onStageResize(null);
		}
		protected function onRemoveFromStage(event:Event):void
		{
			App.stage.removeEventListener(Event.RESIZE,onStageResize);	
		}
		protected function onStageResize(event:Event):void
		{
			this.y = App.stage.stageHeight - this.height;
		}
		
	}
}