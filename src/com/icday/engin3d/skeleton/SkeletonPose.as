package com.icday.engin3d.skeleton
{
	import com.icday.engin3d.AssetType;
	
	
	public class SkeletonPose
	{
		/**
		 * A flat list of pose objects that comprise the skeleton pose. The pose indices correspond to the target skeleton's joint indices.
		 *
		 * @see away3d.animators.data.Skeleton#joints
		 */
		public var jointPoses:Vector.<JointPose>;
		
		/**
		 * The total number of joint poses in the skeleton pose.
		 */
		public function get numJointPoses():uint
		{
			return jointPoses.length;
		}
		
		/**
		 * Creates a new <code>SkeletonPose</code> object.
		 */
		public function SkeletonPose()
		{
			jointPoses = new Vector.<JointPose>();
		}
		
		/**
		 * @inheritDoc
		 */
		public function get assetType():String
		{
			return AssetType.SKELETON_POSE;
		}
		
		public function jointPoseFromName(jointName:String):JointPose
		{
			var jointPoseIndex:int = jointPoseIndexFromName(jointName);
			if (jointPoseIndex != -1)
				return jointPoses[jointPoseIndex];
			else
				return null;
		}
		
		public function jointPoseIndexFromName(jointName:String):int
		{
			var jointPoseIndex:int;
			for each (var jointPose:JointPose in jointPoses) {
				if (jointPose.name == jointName)
					return jointPoseIndex;
				jointPoseIndex++;
			}
			
			return -1;
		}
		
		public function clone():SkeletonPose
		{
			var clone:SkeletonPose = new SkeletonPose();
			var numJointPoses:uint = this.jointPoses.length;
			for (var i:uint = 0; i < numJointPoses; i++) {
				var cloneJointPose:JointPose = new JointPose();
				var thisJointPose:JointPose = this.jointPoses[i];
				cloneJointPose.name = thisJointPose.name;
				cloneJointPose.copyFrom(thisJointPose);
				clone.jointPoses[i] = cloneJointPose;
			}
			return clone;
		}
		
		public function dispose():void
		{
			jointPoses.length = 0;
		}
	}
}
