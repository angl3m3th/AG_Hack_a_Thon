package code {
	
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
 
	public class Engine extends MovieClip
	{
 
		private var preloader:ThePreloader;
 
		public function Engine()
		{
			preloader = new ThePreloader(482, this.loaderInfo);
			stage.addChild(preloader);
			preloader.addEventListener("loadComplete", loadAssets);
			preloader.addEventListener("preloaderFinished", showSponsors);
		}
 
		private function loadAssets(e:Event) : void
		{
			this.play();
		}
 
		private function showSponsors(e:Event) : void
		{
			stage.removeChild(preloader);
			var ps:PrerollSponsors = new PrerollSponsors(stage);
			ps.addEventListener("prerollComplete", showMenu);
			ps.preroll();
		}
		
		private function showMenu(e:Event) : void
		{
			new BuddyScreen(stage).load();
		}
 
	}
 
}

