package  code{
	
	import flash.display.MovieClip;
	
	
	public class Player extends MovieClip {
		
		var speed:Number;
		var weightMultiplier:Number;
		var points:int;
		
		
		
		public function Player() 
		{
			speed = 0;
			weightMultiplier = 1;
			points = 0;
			x = 275;
			y = 315;
		}
		
		function getRealSpeed():Number
		{
			return speed * weightMultiplier;
		}
		
		function getSpeed():Number
		{
			return speed;
		}
		
		function getWeightMultiplier():Number
		{
			return weightMultiplier;
		}
		
		function setSpeed(s:Number):void
		{
			speed = s;
		}
		
		function setWeightMultiplier(w:Number):void
		{
			weightMultiplier = w;
		}
	}
	
}
