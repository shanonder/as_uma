package games.scenes
{
	import com.icday.database.net.responses.EnterWorldResponse;
	import com.icday.mvcs.Context;
	import com.icday.mvcs.ICommand;
	
	import flash.utils.ByteArray;
	
	import games.globals.ContextEvent;
	import games.models.PackModel;
	import games.models.RoleModel;
	
	public class EnterWorldCommand implements ICommand
	{
		public function EnterWorldCommand()
		{
		}
		
		public function excute(cmd:int, status:int, data:ByteArray):void
		{
//			var resp:EnterWorldResponse = new EnterWorldResponse(data);
//			RoleModel.instance.setData(resp.role);
//			PackModel.instance.setData(resp.packs);
//			Context.instance.dispatch(ContextEvent.ENTER_WORLD);
		}
	}
}