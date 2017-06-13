package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class PackSellRequest extends SocketRequestBase implements INetRequest{
		public function PackSellRequest(type:int , index:int , insId:String){
			super(0x40004);
			bytes.writeShort(type);
			bytes.writeShort(index);
			bytes.writeUTF(insId == null ?"" : insId);
		}
	}
}