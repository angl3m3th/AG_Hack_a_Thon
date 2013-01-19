package code {
	
	import flash.display.MovieClip;
	import fl.motion.Color;
	import flash.geom.ColorTransform;
	
	
	public class FallingObj extends MovieClip {
		
		
		public function FallingObj(xLoc:int, yLoc:int, c:ColorTransform) 
		{
			x = xLoc;
			y = yLoc;
			this.transform.colorTransform = c;
		}
		
		public function fall()
		{
			y += 5;
		}
	}
	
}
