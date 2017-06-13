package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class PackMoveRequest extends SocketRequestBase implements INetRequest{
		public function PackMoveRequest(type0:int , index0:int , insId0:String , type1:int , index1:int , insId1:String){
			super(0x40002);
			bytes.writeShort(type0);
			bytes.writeShort(index0);
			bytes.writeUTF(insId0 == null ?"" : insId0);
			bytes.writeShort(type1);
			bytes.writeShort(index1);
			bytes.writeUTF(insId1 == null ?"" : insId1);
		}
	}
}