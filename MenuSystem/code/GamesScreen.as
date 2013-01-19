package  code{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	
	
	public class GamesScreen extends BaseMenu {
		
		var runGame:RunningGame;
		var fallGame:FallCatchGame;
		
		public function GamesScreen(game:int) 
		{
			
			if(game == 0)
			{
				runGame = new RunningGame();
			
				addChild(runGame);
			}
			if(game == 1)
			{
				fallGame = new FallCatchGame();
			
				addChild(fallGame);
			
			}
		}
		
		
	}
	
}
