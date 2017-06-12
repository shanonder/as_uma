package tests
{
	import com.icday.database.net.data.ItemData;
	
	import flash.display.Sprite;
	import flash.utils.getQualifiedClassName;
	
	public class ArrayTest extends Sprite
	{
		public function ArrayTest()
		{
			super();
			var type:Boolean = false;
			var num:Number = 1.01;
			trace(getQualifiedClassName(new ItemData));
			trace(getQualifiedClassName(type));
			trace(getQualifiedClassName(num));
			trace(getQualifiedClassName("asdas"));
		}
	}
}