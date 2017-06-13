package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class PackInitRequest extends SocketRequestBase implements INetRequest{
		public function PackInitRequest(type:int){
			super(0x40001);
			bytes.writeShort(type);
		}
	}
}