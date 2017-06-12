package
{
	import com.icday.CsvParser;
	import com.icday.mvcs.Context;
	import com.icday.net.socket.SocketAdapter;
	import com.icday.registers.CsvUtil;
	import com.icday.utils.AsyncViewProxy;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import games.logins.LoginModule;
	import games.logins.views.LoginView;
	
	import lib.Lib;
	
	import morn.core.handlers.Handler;
	import morn.core.managers.ResLoader;
	
	public class code_login extends Sprite
	{
		public function code_login()
		{
			if(stage){
				onAddToStage(null);
			}else{
				addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			}
		}
		

		
		protected function onAddToStage(event:Event):void
		{
			App.init(this);
			CsvUtil.regist();
			Config.resPath = "http://localhost:9001/";
			Lib.net = SocketAdapter.build();
			//			预加载配置文件
			App.loader.loadAssets([
				"assets/skins/public.swf",
				{url:"datas/csvs/lang.dat",type:CsvParser.CSV_PROPS},
				{url:"datas/csvs/role.dat",type:CsvParser.CSV_Data},
			],new Handler(onCompleteHandler));
			Context.instance.setup(new LoginModule());
			Context.instance.start();
		}
		
		private function onCompleteHandler():void
		{
			var langMap:Object = ResLoader.getResLoaded("datas/csvs/lang.dat");
			App.lang.data = langMap;
			AsyncViewProxy.toggleDialog(LoginView);
		}
	}
}