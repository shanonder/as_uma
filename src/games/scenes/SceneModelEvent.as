package games.scenes
{
	import com.icday.mvcs.DataEvent;
	
	import flash.events.Event;
	
	public class SceneModelEvent extends DataEvent
	{
		
		public static const ENTER_SCENE:String = "enter_scene";
		public function SceneModelEvent(type:String, data:*=null)
		{
			super(type, data);
		}
		
		override public function clone():Event
		{
			return new SceneModelEvent(type,data);
		}
		
		
	}
}