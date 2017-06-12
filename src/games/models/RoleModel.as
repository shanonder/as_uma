package games.models
{
	import com.icday.database.net.datas.RoleData;
	import com.icday.mvcs.ModelBase;
	import com.icday.registers.CsvUtil;
	import com.icday.utils.Singleton;
	
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
	}
}