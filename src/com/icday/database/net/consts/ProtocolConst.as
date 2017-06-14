package com.icday.database.net.consts{

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	public class ProtocolConst{
		/** 登录请求 */
		public static const LoginRequest : int = 0x10001;
		/** 登录返回 */
		public static const LoginResponse : int = 0x10001;
		/** 登录请求 */
		public static const LoginGateRequest : int = 0x10000;
		/** 登录返回 */
		public static const LoginGateResponse : int = 0x10000;
		/** 心跳包 */
		public static const HeapRequest : int = 0x20000;
		/** 心跳包 */
		public static const HeapResponse : int = 0x20000;
		/** 进入场景（初始化） */
		public static const EnterWorldResponse : int = 0x30001;

	}
}