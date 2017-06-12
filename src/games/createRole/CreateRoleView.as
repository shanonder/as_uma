package games.createRole
{
	import com.icday.database.csvs.DtRole;
	import com.icday.database.net.request.CreateRoleRequest;
	
	import games.models.RoleModel;
	
	import lib.Lib;
	
	import morn.core.components.IResizebale;
	import morn.core.handlers.Handler;
	
	import uis.user.createRoleUI;
	
	public class CreateRoleView extends createRoleUI implements IResizebale
	{
		private var model:RoleModel;
		public function CreateRoleView()
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
			for each (var ele:DtRole in model.roleCfgList){
				dataArr.push("profession_" + ele.profession);
			}
			rgProf.dataSource = dataArr;
			rgProf.selectedIndex = 0;
		}
		
		private function createRequest():void
		{
			var dt:DtRole = model.roleCfgList[rgProf.selectedIndex];
			Lib.net.sendRequest(new CreateRoleRequest(txtName.text,int(dt.id)));
		}		
		
		public function onStageResize():void
		{
			this.x = (App.stage.stageWidth - this.width)>>1;
			this.y = (App.stage.stageHeight - this.height)>>1;
		}
	}
}