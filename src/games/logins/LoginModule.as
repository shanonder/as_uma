package games.logins
{
	import com.icday.mvcs.IModule;
	import com.icday.mvcs.ModuleBase;
	import com.icday.utils.AsyncViewProxy;
	
	import flash.events.Event;
	
	import games.logins.proxys.LoginProxy;
	import games.logins.views.LoginView;

	public class LoginModule extends ModuleBase implements IModule
	{
		public function LoginModule()
		{
		}
		
		override public function startup():void
		{
			LoginProxy.instance.addEventListener(LoginProxy.LoginSuccess,onLoginSuccess);
		}
		
		protected function onLoginSuccess(event:Event):void
		{
			AsyncViewProxy.toggleDialog(LoginView,-1);
		}
		
	}
}