package com.icday.database.net.request {

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	import com.icday.net.socket.SocketRequestBase;
	import com.icday.net.interfaces.INetRequest;
	public class HeapRequest extends SocketRequestBase implements INetRequest{
		public function HeapRequest(){
			super(0x20000);
		}
	}
}