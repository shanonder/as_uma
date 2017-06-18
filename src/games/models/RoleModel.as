package games.models
{
	import com.icday.database.net.data.RoleData;
	import com.icday.database.net.request.RoleCreateRequest;
	import com.icday.mvcs.ModelBase;
	import com.icday.registers.CsvUtil;
	import com.icday.util.StringUtil;
	import com.icday.utils.Singleton;
	
	import lib.Lib;
	
	public class RoleModel extends ModelBase
	{
		
		public static function get instance():RoleModel
		{
			return Singleton.getInstance(RoleModel);
		}
		
		
		public var roleCfgMap:Object;
		public var roleCfgList:Array;
		private var roleData:RoleData;
		public function RoleModel()
		{
			super();
			roleCfgMap = CsvUtil.getObject("role.dat");
			roleCfgList = CsvUtil.getList("role.dat");
		}
		
		public function setData(role:RoleData):void
		{
			roleData = role;
		}
		
		public function request(name:String, profId:int):void
		{
			if(name == null || StringUtil.GetStringLength(name)< 6){
				trace("name to short");
				return;
			}
			Lib.net.sendRequest(new RoleCreateRequest(name,profId));
		}
	}
}