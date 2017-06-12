package games.createRole
{
	import com.icday.database.net.consts.ProtocolConst;
	import com.icday.mvcs.Context;
	import com.icday.mvcs.DataEvent;
	import com.icday.mvcs.IModule;
	import com.icday.mvcs.ModuleBase;
	import com.icday.utils.AsyncViewProxy;
	
	import flash.utils.ByteArray;
	
	import games.globals.ContextEvent;
	
	public class CreateRoleModule extends ModuleBase implements IModule
	{
		public function CreateRoleModule()
		{
		}
		
		override public function startup():void
		{
			AsyncViewProxy.regist(CreateRoleView,"assets/skins/comp.swf");
//			addClosure(ProtocolConst.CreateRole,onRoleCreate);
			Context.instance.addEventListener(ContextEvent.CREATE_ROLE,onRoleCreateHandler);
		}
		
		private function onRoleCreate(cmd:int,status:int,bytes:ByteArray):void
		{
			if(status == 200){
				AsyncViewProxy.toggleView(CreateRoleView,App.uiLayer,-1);
			}
		}
		
		protected function onRoleCreateHandler(event:DataEvent):void
		{
			AsyncViewProxy.toggleView(CreateRoleView,App.uiLayer);
		}
	}
}