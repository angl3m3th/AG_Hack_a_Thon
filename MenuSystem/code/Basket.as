package code{
	
	import flash.display.MovieClip;
	
	
	public class Basket extends MovieClip {
		
		var score:int;
		
		public function Basket()
		{
			x = 275;
			y = 365
			score = 0;
		}
		
		public function updateScore():void
		{
			score += 2;
		}
		
		public function getScore():int
		{
			return score;
		}
	}
	
}
