package com.icday.engin3d.skeleton
{
	
	public class SkeletonJoint
	{
		public var parentIndex:int = -1;
		
		public var name:String; // intention is that this should be used only at load time, not in the main loop
		
		public var inverseBindPose:Vector.<Number>;
		
		public function SkeletonJoint()
		{
		}
	}
}
