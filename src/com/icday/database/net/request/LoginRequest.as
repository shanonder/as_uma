package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class LoginRequest extends SocketRequestBase implements INetRequest{
		public function LoginRequest(platId:int , appkey:String , token:String){
			super(0x10001);
			bytes.writeShort(platId);
			bytes.writeUTF(appkey == null ?"" : appkey);
			bytes.writeUTF(token == null ?"" : token);
		}
	}
}