package games.models
{
	import com.icday.mvcs.ModelBase;
	import com.icday.utils.Singleton;
	
	public class PackModel extends ModelBase
	{
		public static function get instance():PackModel
		{
			return Singleton.getInstance(PackModel);
		}
		
		private var packs:Array;
		public function PackModel()
		{
			super();
		}
		
		public function setData(data:Array):void{
			packs = data;
		}
			
	}
}