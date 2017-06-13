package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class PackDeleteRequest extends SocketRequestBase implements INetRequest{
		public function PackDeleteRequest(type:int , index:int , insId:String){
			super(0x40003);
			bytes.writeShort(type);
			bytes.writeShort(index);
			bytes.writeUTF(insId == null ?"" : insId);
		}
	}
}