package
{
	import com.icday.database.net.DataRegister;
	import com.icday.database.net.request.LoginRequest;
	import com.icday.model.PlatModel;
	import com.icday.mvcs.Context;
	import com.icday.net.socket.SocketAdapter;
	import com.icday.registers.CsvUtil;
	import com.icday.utils.AsyncViewProxy;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import games.role.create.RoleCreateModule;
	import games.globals.Global;
	import games.auth.AuthModule;
	import games.auth.model.AuthModel;
	import games.logins.views.LoginView;
	import games.scenes.SceneModule;
	
	import lib.Lib;
	
	import morn.core.components.RichTextField;
	import morn.core.components.View;
	import morn.core.handlers.Handler;
	import morn.core.managers.ResLoader;
	
	import utils.csvs.Csv;

	[SWF (width="800" ,height="600",backgroundColor = "0x333333")]
	public class code_client extends Sprite
	{

		private var csv:Csv;
		public function code_client()
		{
			if(stage){
				onAddToStage(null);
			}else{
				addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			}
		}
		
		private function onCompleteHandler():void
		{
			var langMap:Object = ResLoader.getResLoaded(Global.DATA_PATH + "lang.dat");
			App.lang.data = langMap;
			AuthModel.instance.login();
		}
		
		protected function onAddToStage(event:Event):void
		{
			DataRegister.regist();
			View.registerComponent("RichTextField",RichTextField);
			App.init(this);
			PlatModel.instance.initUrl();
			Config.resPath = "http://localhost:9001/";
			CsvUtil.regist();
			Lib.net = SocketAdapter.build();
			
			//			预加载配置文件
			var arr:Array = ["assets/skins/public.swf"].concat(CsvUtil.URLS)
			App.loader.loadAssets(arr,new Handler(onCompleteHandler));
			Context.instance.setup(new AuthModule());
			Context.instance.setup(new RoleCreateModule());
			Context.instance.setup(new SceneModule());
//			Context.instance.setup(new ChatModule());
			Context.instance.start();
			
		}
	}
}