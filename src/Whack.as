package
{

	import com.adobe.viewsource.ViewSource;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import net.hires.debug.Stats;
	
	import starling.core.Starling;

	[SWF(width="800", height="450", frameRate="60", backgroundColor="#333333")]
	public class Whack extends Sprite
	{

		private var _starling:Starling;
		private var _menus:Screens;

		public function Whack()
		{
			ViewSource.addMenuItem(this, "srcview/index.html"); 
			stage.scaleMode=StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			
			_menus=new Screens(); // Screens is in a SWC (don't worry about looking for the class files)
			_menus.addEventListener("newGame", startGame);

			var stats:Stats=new Stats();
			stats.x=730;
			
			addChild(_menus);
			addChild(stats);
			addChild(new NativeStageProxy());
		}

		/**
		 * The Screens object dispatches a "newGame" event that is used to start Starling
		 * @param e
		 */
		public function startGame(e:Event=null):void
		{
			Starling.multitouchEnabled=true;

			_starling=new Starling(Game, stage);
			_starling.simulateMultitouch=false;
			_starling.enableErrorChecking=false;
			_starling.start();
		}

	}
}