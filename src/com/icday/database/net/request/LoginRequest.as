package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class LoginRequest extends SocketRequestBase implements INetRequest{
		public function LoginRequest(platId:int , serverId:int , openId:String , token:String){
			super(0x10001);
			bytes.writeShort(platId);
			bytes.writeInt(serverId);
			bytes.writeUTF(openId == null ?"" : openId);
			bytes.writeUTF(token == null ?"" : token);
		}
	}
}