package games.scenes
{
	import com.icday.utils.Singleton;
	
	import flash.display.Sprite;
	
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import morn.core.components.Clip;

	public class World
	{
		
		public static function get instance():World{
			return Singleton.getInstance(World);
		}
		private var bWorld:b2World;
		
		private var view:Sprite;
		
		public function World()
		{
		}
		
		public function init(view:Sprite):void{
			var gravity:b2Vec2 = new b2Vec2(0.0, 10.0);
			bWorld = new b2World(gravity,true);
			this.view = view;
			
			var body:b2Body;
			var bodyDef:b2BodyDef;
			var boxShape:b2PolygonShape;
			var circleShape:b2CircleShape;
			
			
			
			// Add ground body
			bodyDef = new b2BodyDef();
			//bodyDef.position.Set(15, 19);
			bodyDef.position.Set(10, 12);
			//bodyDef.angle = 0.1;
			boxShape = new b2PolygonShape();
			boxShape.SetAsBox(30, 3);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = boxShape;
			fixtureDef.friction = 0.3;
			fixtureDef.density = 0; // static bodies require zero density
			// Add sprite to body userData
			bodyDef.userData = new Clip("assets/clips/mis.png",1,1);
			bodyDef.userData.width = 30 * 2 * 30; 
			bodyDef.userData.height = 30 * 2 * 3; 
			view.addChild(bodyDef.userData);
			bodyDef.userData.play();
			body = bWorld.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			
			// Add some objects
			for (var i:int = 1; i < 10; i++){
				bodyDef = new b2BodyDef();
				bodyDef.position.x = Math.random() * 15 + 5;
				bodyDef.position.y = Math.random() * 10;
				var rX:Number = Math.random() + 0.5;
				var rY:Number = Math.random() + 0.5;
				// Box
				if (Math.random() < 0.5){
					boxShape = new b2PolygonShape();
					boxShape.SetAsBox(rX, rY);
					fixtureDef.shape = boxShape;
					fixtureDef.density = 1.0;
					fixtureDef.friction = 0.5;
					fixtureDef.restitution = 0.2;
					bodyDef.userData = new Clip("assets/clips/mis.png",5,5);
					bodyDef.userData.clipX = 2;
					bodyDef.userData.width = rX * 2 * 30; 
					bodyDef.userData.height = rY * 2 * 30; 
					bodyDef.userData.play();
					body = bWorld.CreateBody(bodyDef);
					body.CreateFixture(fixtureDef);
				} 
					// Circle
				else {
					circleShape = new b2CircleShape(rX);
					fixtureDef.shape = circleShape;
					fixtureDef.density = 1.0;
					fixtureDef.friction = 0.5;
					fixtureDef.restitution = 0.2;
					bodyDef.userData = new Clip("assets/clips/mis.png",3,3);
					bodyDef.userData.width = rX * 2 * 30; 
					bodyDef.userData.height = rX * 2 * 30; 
					body = bWorld.CreateBody(bodyDef);
					body.CreateFixture(fixtureDef);
				}
				view.addChild(bodyDef.userData);
			}
		}
		
		public function awake():void{
//			App.timer.doLoop(20,render);
			App.timer.doFrameLoop(1,render);
		}
		
		public function sleep():void{
			App.timer.clearTimer(render);
		}
		
		private function render():void
		{
			bWorld.Step(.2,10,10);
			for (var bb:b2Body = bWorld.GetBodyList(); bb; bb = bb.GetNext()){
				if (bb.GetUserData() is Sprite){
					var sprite:Sprite = bb.GetUserData() as Sprite;
					sprite.x = bb.GetPosition().x * 50;
					sprite.y = bb.GetPosition().y * 50;
					sprite.rotation = bb.GetAngle() * (180/Math.PI);
				}
			}
		}
		

	}
}