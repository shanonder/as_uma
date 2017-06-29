package games.role.create
{
	import com.icday.database.csvs.DtRole;
	import com.icday.database.csvs.RoleCfg;
	
	import games.models.RoleModel;
	
	import morn.core.components.IResizebale;
	import morn.core.handlers.Handler;
	
	import uis.user.createRoleUI;
	
	public class RoleCreateView extends createRoleUI implements IResizebale
	{
		private var model:RoleModel;
		public function RoleCreateView()
		{
			model = RoleModel.instance;
			super();
		}
		
		override protected function createChildren():void
		{
			
			super.createChildren();
			btnCreate.clickHandler = new Handler(createRequest)
			onStageResize();
			var dataArr:Array = [];
			for each (var ele:RoleCfg in model.roleCfgList){
				dataArr.push("profession_" + ele.profession);
			}
			rgProf.dataSource = dataArr;
			rgProf.selectedIndex = 0;
		}
		
		private function createRequest():void
		{
			var dt:RoleCfg = model.roleCfgList[rgProf.selectedIndex];
			model.request(txtName.text,int(dt.id));
			
		}		
		
		public function onStageResize():void
		{
			this.x = (App.stage.stageWidth - this.width)>>1;
			this.y = (App.stage.stageHeight - this.height)>>1;
		}
	}
}