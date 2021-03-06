package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class LoginGateRequest extends SocketRequestBase implements INetRequest{
		public function LoginGateRequest(uid:String , token:String , platform:String){
			super(0x10000);
			bytes.writeUTF(uid == null ?"" : uid);
			bytes.writeUTF(token == null ?"" : token);
			bytes.writeUTF(platform == null ?"" : platform);
		}
	}
}