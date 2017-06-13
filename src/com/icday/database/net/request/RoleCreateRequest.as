package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class RoleCreateRequest extends SocketRequestBase implements INetRequest{
		public function RoleCreateRequest(name:String , profId:int){
			super(0x30001);
			bytes.writeUTF(name == null ?"" : name);
			bytes.writeShort(profId);
		}
	}
}