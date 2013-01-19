package code {
	
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class ThePreloader extends MovieClip
	{
		
		//width of preloader bar at 100%
		private var fullWidth:Number; 
		public var ldrInfo:LoaderInfo;
		import transitions.Tweener;
		
		public function ThePreloader(fullWidth:Number = 0, ldrInfo:LoaderInfo = null)
		{
			this.fullWidth = fullWidth;
			this.ldrInfo = ldrInfo;
			
			addEventListener(Event.ENTER_FRAME, checkLoad);
		}
		
		private function checkLoad (e:Event) : void
		{
			if(ldrInfo.bytesLoaded == ldrInfo.bytesTotal && ldrInfo.bytesTotal != 0)
			{
				//loading complete
				dispatchEvent(new Event("loadComplete"));
				phaseOut();
			}
			
			updateLoader(ldrInfo.bytesLoaded / ldrInfo.bytesTotal);
		}
		
		private function updateLoader(num:Number) : void
		{
			//num is a number between 0 and 1
			mcPreloaderBar.width = num * fullWidth;
		}
 
		private function phaseOut() : void
		{
			
			removeEventListener(Event.ENTER_FRAME, checkLoad);
			Tweener.addTween(this, { time: 1, alpha: 0, onComplete:phaseComplete } );
			//phaseComplete();
		}
 
		private function phaseComplete() : void
		{
			dispatchEvent(new Event("preloaderFinished"));
		}
	}
	
}
