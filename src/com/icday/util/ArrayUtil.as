package com.icday.util
{
	import com.icday.database.net.DataHash;
	import com.icday.database.net.consts.DefaultTypeConst;
	
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	
	public class ArrayUtil
	{
		public function ArrayUtil()
		{
		}
		
		public static function write( bytes:ByteArray,  item : Array):void{
			if(item == null){
				bytes.writeShort(-1);
				return;
			}
			bytes.writeShort(item.size());
			for(var i:int = 0 , len:int = item.size() ; i<len ; i++){
				var ele:* = item[i];
				if(ele!=null){
					bytes.writeShort(i);
				}else{
					continue;
				}
				//				var clazz:Class = ele.getClass();
				var type:int = DataHash.Classname2Type.get(getQualifiedClassName(ele));
				bytes.writeShort(type);
				if(type == DefaultTypeConst.type_byte){
					bytes.writeByte(ele);
				}
				else if(type == DefaultTypeConst.type_boolean){
					bytes.writeBoolean(ele);
				}
				else if(type == DefaultTypeConst.type_int){
					bytes.writeInt(ele);
				}
				else if(type == DefaultTypeConst.type_number){
					bytes.writeDouble(ele);
				}
				else if(type == DefaultTypeConst.type_bigint){
					LongUtil.write(bytes , ele);
				}
				else if(type == DefaultTypeConst.type_string){
					bytes.writeUTF(ele);
				}else{
					DataHash.ClassName2Write[getQualifiedClassName(ele)](ele);
				}
			}
			bytes.writeShort(-1);
		}
		
		
		public static function read(bytes:ByteArray):Array{
			var length:int = bytes.readShort();
			if(length == -1){
				return null;
			}
			var item:Array = new Array(length);
			var index:int = 0;
			var i:int;
			while((index = bytes.readShort()) != -1)
			{
				while(( i = item.size()) < index){
					item.add(i, null);
				}
				var type:int = bytes.readShort();
				if(type > 0){
					item.add(index, DataHash.Type2Read[type](bytes));
				}
				else if(type == DefaultTypeConst.type_byte){
					item.add(index,bytes.readByte());
				}
				else if(type == DefaultTypeConst.type_boolean){
					item.add(index,bytes.readBoolean());
				}
				else if(type == DefaultTypeConst.type_short){
					item.add(index,bytes.readShort());
				}
				else if(type == DefaultTypeConst.type_int){
					item.add(index, bytes.readInt());
				}
				else if(type == DefaultTypeConst.type_bigint){
					item.add(index,LongUtil.read(bytes));
				}
				else if(type == DefaultTypeConst.type_string){
					item.add(index, bytes.readUTF());
				}
				else if(type == DefaultTypeConst.type_arraylist){
					item.add(index,read(bytes));
				}
			}
			while(( i = item.size()) < length){
				item.add(i, null);
			}
			return item;
		}
	}
}