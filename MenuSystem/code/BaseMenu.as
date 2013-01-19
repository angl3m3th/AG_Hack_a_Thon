package code
{
	import flash.display.MovieClip;
	import transitions.Tweener;
	import flash.display.Stage;
	import flash.events.Event;
 
	public class BaseMenu extends MovieClip
	{
 
		public var stageRef:Stage; //the stage
		public var loadNext:BaseMenu; //instance of next Menu to load
 
		public function BaseMenu()
		{
			alpha = 0;
			y = 400;
		}
 
		public function unload(loadMe:BaseMenu = null) : void
		{
			if (loadMe != null)
				loadNext = loadMe;
 
			Tweener.addTween(this, { alpha: 0, y:-400, time: 0.7, onComplete:remove } );
		}
 
		public function remove() : void
		{
			dispatchEvent(new Event("menuRemoved"));
			if (stageRef.contains(this))
				stageRef.removeChild(this);
 
			if (loadNext != null)
				loadNext.load();
		}
 
		public function load() : void
		{
			stageRef.addChild(this);
			Tweener.addTween(this, { alpha: 1, y:0, time: 0.7} );
		}
 
	}
 
}