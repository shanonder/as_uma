package com.icday.util
{
	import com.icday.util;
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
				if(type == "com.icday.util.BitInt")
				if(type == DefaultTypeConst.type_boolean){
					bytes.writeBoolean(ele);
				}
				else if(type == DefaultTypeConst.type_int){
					bytes.writeInt(ele);
				}
				else if(type == DefaultTypeConst.type_long){
					LongUtil.write(bytes , ele);
				}
				else if(type == DefaultTypeConst.type_string){
					bytes.writeUTF(ele);
				}else{
					
				}
			}
			bytes.writeShort(-1);
		}
		
		
		public static function read(DataInputStream input):Array{
			int length = input.readShort();
			if(length == -1){
				return null;
			}
			ArrayList item = new ArrayList<>(length);
			int index = 0;
			int i;
			while((index = input.readShort()) != -1)
			{
				while(( i = item.size()) < index){
					item.add(i, null);
				}
				int type = input.readShort();
				if(type > 0){
					String className = DataHash.Type2Class.get(type);
					Class threadClazz = Class.forName(className);
					Method method = threadClazz.getMethod("read", DataInputStream.class,threadClazz);
						Object ele = method.invoke(null, input , threadClazz.newInstance());
						item.add(index, ele);
						}
				else if(type == ClassTypeEnum.t_boolean.getType()){
					item.add(index,input.readBoolean());
				}
				else if(type == ClassTypeEnum.t_short.getType()){
					item.add(index,input.readShort());
				}
				else if(type == ClassTypeEnum.t_int.getType()){
					int value = input.readInt();
					item.add(index, value);
				}
				else if(type == ClassTypeEnum.t_long.getType()){
					item.add(index,input.readLong());
				}
				else if(type == ClassTypeEnum.t_string.getType()){
					item.add(index, input.readUTF());
				}
				else if(type == ClassTypeEnum.t_array.getType()){
					item.add(index,read(input));
				}
			}
			while(( i = item.size()) < length){
				item.add(i, null);
			}
			return item;
		}
	}
}