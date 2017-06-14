package games.role.create
{
	import com.icday.database.net.consts.ProtocolConst;
	import com.icday.mvcs.Context;
	import com.icday.mvcs.DataEvent;
	import com.icday.mvcs.IModule;
	import com.icday.mvcs.ModuleBase;
	import com.icday.utils.AsyncViewProxy;
	
	import flash.utils.ByteArray;
	
	import games.globals.ContextEvent;
	
	public class RoleCreateModule extends ModuleBase implements IModule
	{
		public function RoleCreateModule()
		{
		}
		
		override public function startup():void
		{
			AsyncViewProxy.regist(RoleCreateView,"assets/skins/comp.swf");
			addClosure(ProtocolConst.RoleCreateResponse,onRoleCreate);
			Context.instance.addEventListener(ContextEvent.CREATE_ROLE,onRoleCreateHandler);
		}
		
		private function onRoleCreate(cmd:int,status:int,bytes:ByteArray):void
		{
			trace(status);
			if(status == 200){
				AsyncViewProxy.toggleView(RoleCreateView,App.uiLayer,-1);
			}
		}
		
		protected function onRoleCreateHandler(event:DataEvent):void
		{
			AsyncViewProxy.toggleView(RoleCreateView,App.uiLayer,1);
		}
	}
}