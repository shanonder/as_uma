package games.logins.views
{
	import games.logins.proxys.LoginProxy;
	
	import morn.core.handlers.Handler;
	
	import uis.user.loginUI;
	
	public class LoginView extends loginUI
	{
		public function LoginView()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			txtPassword.text = "111111";
			btnAction.clickHandler = new Handler(onLoginHander);
		}
		
		private function onLoginHander():void
		{
			LoginProxy.instance.login(txtUserName.text,txtPassword.text);
		}		
		
	}
}