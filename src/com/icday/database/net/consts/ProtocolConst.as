package com.icday.database.net.consts{

	/**
	 * 此类由CodeGenerateUtil自动生成
	 */
	public class ProtocolConst{
		/** 登录请求 */
		public static const LoginRequest : int = 0x10001;
		/** 登录返回 */
		public static const LoginResponse : int = 0x10001;
		/** 心跳包 */
		public static const HeapRequest : int = 0x20000;
		/** 心跳包 */
		public static const HeapResponse : int = 0x20000;
		/** 进入场景（初始化） */
		public static const EnterWorldResponse : int = 0x50001;
		/** 包裹初始化 */
		public static const PackInitRequest : int = 0x40001;
		/** 包裹初始化 */
		public static const PackInitResponse : int = 0x40001;
		/** 物品移动 */
		public static const PackMoveRequest : int = 0x40002;
		/** 物品移动 */
		public static const PackMoveResponse : int = 0x40002;
		/** 物品删除（丢弃） */
		public static const PackDeleteRequest : int = 0x40003;
		/** 物品删除（丢弃） */
		public static const PackDeleteResponse : int = 0x40003;
		/** 物品出售 */
		public static const PackSellRequest : int = 0x40004;
		/** 物品出售 */
		public static const PackSellResponse : int = 0x40004;
		/** 物品生成 */
		public static const PackAddResponse : int = 0x40005;
		/** 创建角色 */
		public static const RoleCreateRequest : int = 0x30001;
		/** 创建角色  {state:200,成功 201:姓名重复 ,202:包含不可用字} */
		public static const RoleCreateResponse : int = 0x30001;
		/** 进入场景 */
		public static const RoleEnterWorldResponse : int = 0x30002;

	}
}