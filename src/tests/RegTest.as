package tests
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import morn.core.components.Image;
	
	public class RegTest extends Sprite
	{
		private const map:Object = {
			"?:1/":"测试",
			"?:2/":"测试测试"
		};
		public function RegTest()
		{
			super();
			var textf:TextField = new TextField();
			textf.width = 200;
			addChild(textf);
			var text:String = "3333?:1/?:3/?:1/wwerw中国erwerw?:2/weweewe";
			var reg:RegExp = /(\?:[0-9]*\/)/g;
			var arr:Array = text.split(reg);
			if(arr.length){
				for each (var ele:String in arr){
					var index:int = text.indexOf(ele);
					var sp:Shape = new Shape();
					sp.graphics.beginFill(0xFF0000);
					sp.graphics.drawRect(0,0,24,24);
					sp.graphics.endFill();
					addChild(sp);
					sp.x = index*12;
					var str:String = "  ";
					text = text.replace(ele,map[ele]);
				}
			}
			textf.text = text;
			
		}
	}
}