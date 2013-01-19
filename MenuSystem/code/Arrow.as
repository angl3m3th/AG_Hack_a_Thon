package code {
	
	import flash.display.SimpleButton;
	
	
	public class Arrow extends SimpleButton {
		
		var dir:String;
		
		/*public function Arrow() 
		{
			
		}*/
		
		public function Arrow(xLoc:int, yLoc:int, d:String) 
		{
			x = xLoc;
			y = yLoc;
			dir = d;
		}
		
		public function getDirection():String
		{
			return dir;
		}
	}
	
}
