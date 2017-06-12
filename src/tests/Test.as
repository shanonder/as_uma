/**
 * RichTextField 2 Demo
 * @author Alex.li - www.riaidea.com
 * @homepage http://code.google.com/p/richtextfield/
 */

package tests
{
	import morn.core.plugins.ClipTextCell;
	import morn.core.components.RichTextField;
	import morn.core.plugins.RichTextFieldBuilder;
	import morn.core.plugins.ShortcutPlugin;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import morn.core.components.Button;
	import morn.core.components.Clip;
	import morn.core.components.ScrollBar;
	import morn.core.handlers.Handler;
	
	
	[SWF(width = "500", height = "500", frameRate = "24", backgroundColor = "0x333333")]
	public class Test extends Sprite 
	{
		private var _output:RichTextField;
		private var _input:RichTextField;
		private var _sendBtn:Button;
		private var _smileyContainer:Sprite;
		private var _outputBorder:Shape;
		private var _inputBorder:Shape;
		private var _outputScrollBar:ScrollBar;
		private var _inputScrollBar:ScrollBar;
		private var _timer:Timer;
		
		private var _smileys:Array = 
			["png.chat.skill_1"
			,"png.chat.skill_2"
			,"png.chat.skill_3"
			,"png.chat.skill_4"
			,"png.chat.skill_5"
			,"png.chat.skill_6"
			,"png.chat.skill_7"
			,"png.chat.skill_8"
			,"png.chat.skill_9"
			
			];
		
		public function Test():void 
		{
			Config.resPath = "http://localhost:9001/";
			App.init(this);
			var arr:Array = ["assets/skins/comp.swf","assets/skins/chat.swf"];
			App.loader.loadAssets(arr,new Handler(onCompleteHandler));
			
		}
		
		private function onCompleteHandler():void
		{
			init();			
		}
		
		private function init(e:Event = null):void 
		{
			stage.scaleMode = "noScale";
			stage.align = "topLeft";
			
			RichTextFieldBuilder.registCell(ClipTextCell.NAME,ClipTextCell);
			//text format
			var txtFormat:TextFormat = new TextFormat("Courier New", 12, 0xFF, false, false, false);	
			
			
			//output rtf
			_output = new RichTextField();
			_output.color = 0x0;
			_output.skin = "png.comp.textinput";
			_output.vScrollBarSkin = "png.comp.vscroll";
			_output.x = 10;
			_output.y = 120;
			_output.setSize(stage.stageWidth - 40, 200);			
			_output.format = txtFormat;
			_output.autoScroll = true;
			_output.name = "output";
			addChild(_output);
			
			//some text for demo
			_output.isHtml = true;	
			
			//input rtf			
			_input = new RichTextField();
			_input.skin = "png.comp.textinput";
			_input.x = 10;
			_input.y = 320;
			_input.color = 0x0;
			_input.setSize(stage.stageWidth - 40, 100);
			_input.isInput = true;
			_input.format = txtFormat;
			_input.name = "input";
			addChild(_input);
			//predefine text
			_input.isHtml = false;
//			_output.append("f是<font color = '#FFCCCC'>sdfs</font>dfsd按a/a时大大说",[{index:4, src:_smileys[0],type:"Clip"}]);

//			_input.append("你好，welcome", [ { index:2, src:_smileys[1] ,type:"Clip"}, { index:15, src:_smileys[5] ,type:"Clip"}, { src:_smileys[6] ,type:"Clip"} ]);	
//			_input.replace(4, 11, "欢迎", [ { src:_smileys[4] ,type:"Clip"} ]);
			_input.caretIndex = _input.contentLength;
			
			//input scrollbar
			_inputScrollBar = new ScrollBar;
			_inputScrollBar.target = _input.textfield;
			_inputScrollBar.x = _input.x + _input.width;
			_inputScrollBar.y = _input.y;
			_inputScrollBar.height = _input.viewHeight;
			addChild(_inputScrollBar);
			
			//add smileys
			_smileyContainer = new Sprite();
			addChild(_smileyContainer);
			_smileyContainer.x = 25;
			_smileyContainer.y = _input.y + _input.viewHeight + 20;
//			createSmileys();
			
			//send button
			_sendBtn = getButton();
			addChild(_sendBtn);
			_sendBtn.x = _input.x + _input.width - _sendBtn.width;
			_sendBtn.y = _smileyContainer.y;
			_sendBtn.label = "发送";
			_sendBtn.addEventListener(MouseEvent.CLICK, sendMessage);
			
			//correct focus
			stage.focus = _input.textfield;	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);					
			stage.addEventListener(Event.RESIZE, onResize);
			
			//shortcut plugin
			var splugin:ShortcutPlugin = new ShortcutPlugin();			
			var shortcuts:Array = [
				new ClipTextCell(0,"png.chat.skill_1",4,4,"/a"),
				new ClipTextCell(0,"png.chat.skill_2",4,4,"/b"),
				new ClipTextCell(0,"png.chat.skill_3",4,4,"/c"),
				new ClipTextCell(0,"png.chat.skill_4",4,4,"/d"),
				new ClipTextCell(0,"png.chat.skill_5",4,4,"/e"),
				new ClipTextCell(0,"png.chat.skill_6",4,4,"/f"),
				new ClipTextCell(0,"png.chat.skill_7",4,4,"/g"),
				new ClipTextCell(0,"png.chat.skill_8",4,4,"/h"),
				new ClipTextCell(0,"png.chat.skill_9",4,4,"/i")
				];
			splugin.addShortcut(shortcuts);
			_input.addPlugin(splugin);
			_input.text = "asdasdas/a";
			//startRobotMessage();
		}
		
		private function startRobotMessage():void
		{
			var timer:Timer = new Timer(3 * 1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			_timer = timer;
		}
		
		private function pauseRobotMessage():void
		{
			if (_timer.running) _timer.stop();
			else _timer.start();
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			sendMessage();
		}
		
		private function onResize(e:Event):void 
		{
			_output.setSize(stage.stageWidth - 40, 200);
			_input.setSize(stage.stageWidth - 40, 100);
		}
		
		private function onKeyDown(evt:KeyboardEvent):void
		{			
			if (evt.keyCode == Keyboard.ENTER && _input.contentLength > 0)
			{				
				//sendMessage();
			}
		}
		
		private function sendMessage(evt:MouseEvent = null):void
		{
//			_output.clear();
			_output.importXML(_input.exportXML());
//			_outputScrollBar.update();
		}
		
		private function insertSmiley(evt:MouseEvent):void
		{
			var smiley:Sprite = evt.currentTarget as Sprite;
			if(smiley is Clip){
				var clip :Clip = smiley as Clip;
				var clone:Clip = new Clip(clip.url,clip.clipX,clip.clipY);
				clone.play();
				_input.insertSprite(clone, _input.textfield.caretIndex);		
			}else{
				var smileyClass:Class = getDefinitionByName(getQualifiedClassName(smiley)) as Class;
				_input.insertSprite(smileyClass, _input.textfield.caretIndex);
			}
					
			if (_input.isSpriteAt(_input.caretIndex))
			{				
				_input.caretIndex++;
			}
		}
		
		private function createSmileys():void
		{
//			for (var i:int = 0; i < _smileys.length; i++)
//			{
//				var smiley:Clip = new Clip(_smileys[i],3,3);
//				smiley.play();
//				_smileyContainer.addChild(smiley);
//				smiley.x = (i % 9) * 40;
//				smiley.y = Math.floor(i / 9) * 40;
//				smiley.buttonMode = true;
//				smiley.addEventListener(MouseEvent.CLICK, insertSmiley);			
//			}
		}
		
		private function getButton():Button
		{
			var btn:Button = new Button();
			return btn;
		}
	}
}