package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class CreateRoleRequest extends SocketRequestBase implements INetRequest{
		public function CreateRoleRequest(name:String , profession:int){
			super(0x2001);
			bytes.writeUTF(name == null ?"" : name);
			bytes.writeInt(profession);
		}
	}
}