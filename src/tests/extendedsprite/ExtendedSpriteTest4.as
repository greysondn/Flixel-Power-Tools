package tests.extendedsprite 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import tests.controls.ControlTestScene1;
	import tests.TestsHeader;

	public class ExtendedSpriteTest4 extends FlxState
	{
		//	Common variables
		public static var title:String = "Sprite Drag 4";
		public static var description:String = "Direction Locked Dragging";
		private var instructions:String = "The arrows are direction drag-locked";
		private var header:TestsHeader;
		
		//	Test specific variables
		
		private var player:FlxExtendedSprite;
		private var ball:FlxSprite;
		private var scene:ControlTestScene1;
		
		public function ExtendedSpriteTest4() 
		{
		}
		
		override public function create():void
		{
			header = new TestsHeader(instructions);
			add(header);
			
			//	Test specific
			
			//	Enable the plugin - you only need do this once in your State (unless you destroy the plugin)
			if (FlxG.getPlugin(FlxMouseControl) == null)
			{
				FlxG.addPlugin(new FlxMouseControl);
			}
			
			player = new FlxExtendedSprite(64, 64, AssetsRegistry.ufoPNG);
			player.solid = true;
			player.allowCollisions = FlxObject.ANY;
			player.enableMouseDrag(false, true);
			
			ball = new FlxSprite(128, 128, AssetsRegistry.redPNG);
			ball.solid = true;
			ball.elasticity = 0.8;
			
			scene = new ControlTestScene1;
			
			add(scene);
			add(ball);
			add(player);
			
			//	Header overlay
			add(header.overlay);
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, scene.map);
			FlxG.collide(player, ball);
		}
		
		override public function destroy():void
		{
			//	Important! Clear out the plugin otherwise resources will get messed right up after a while
			FlxMouseControl.clear();
			
			super.destroy();
		}
		
	}

}