package code
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.display.Sprite;
 
	public class PrerollSponsors extends Sprite
	{
 
		private var stageRef:Stage;
		private var prerollList:Array; //keeps up with our Movieclip prerolls
		private var currentPreroll:int = 0; //the current preroll we are on
 
		public function PrerollSponsors(stageRef:Stage)
		{
			this.stageRef = stageRef;
			prerollList = [new PrerollGameSponsor(),new PrerollGameTitle()];
		}
 
		public function preroll() : void
		{
			if (currentPreroll == prerollList.length)
				return prerollComplete();
 
			var clip:MovieClip = prerollList[currentPreroll];
			clip.x = (stageRef.stageWidth - clip.width) / 2;
			clip.y = (stageRef.stageHeight - clip.height) / 2;
			clip.gotoAndPlay(1);
			clip.addEventListener("finished", nextPreroll);
			stageRef.addChild(clip);
		}
 
		private function nextPreroll(e:Event) : void
		{
			e.currentTarget.removeEventListener("finished", nextPreroll);
			stageRef.removeChild(e.currentTarget as MovieClip);
			currentPreroll++;
			preroll();
		}
 
		private function prerollComplete() : void
		{
			dispatchEvent(new Event("prerollComplete"));
		}
 
	}
 
}