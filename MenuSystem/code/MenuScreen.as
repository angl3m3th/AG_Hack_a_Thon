package code 
{
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Stage;
	import flash.events.TouchEvent;
	import flash.events.MouseEvent;
	//import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
 
	public class MenuScreen extends BaseMenu
	{
 
		public function MenuScreen(stageRef:Stage = null )
		{
			this.stageRef = stageRef;
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			btnBuddy.addEventListener(TouchEvent.TOUCH_BEGIN, buddy,  false, 0, true);
			btnMenu.addEventListener(TouchEvent.TOUCH_BEGIN, menu,  false, 0, true);		
			btnExercise.addEventListener(TouchEvent.TOUCH_BEGIN, exerciseLog,  false, 0, true);
			btnFood.addEventListener(TouchEvent.TOUCH_BEGIN, foodLog, false, 0, true);
			btnGames.addEventListener(TouchEvent.TOUCH_BEGIN, gameSelect, false, 0, true);
			btnCreds.addEventListener(TouchEvent.TOUCH_BEGIN, creds, false, 0, true);
		}
 
 		private function menu(e:TouchEvent):void
		{
			unload(new MenuScreen(stageRef));
		}
		
		private function creds(e:TouchEvent):void
		{
			unload(new Credits(stageRef));
		}
		
		private function gameSelect(e:TouchEvent):void
		{
			unload(new GameSelectionScreen(stageRef));
		}
		
		private function buddy(e:TouchEvent) : void
		{
			unload(new BuddyScreen(stageRef));
		}
		
		private function exerciseLog(e:TouchEvent) : void
		{
			unload(new ExerciseLog(stageRef));
		}
		
		private function foodLog(e:TouchEvent) : void
		{
			unload(new FoodLog(stageRef));
		}
		
		/*function onSwipes(e:TransformGestureEvent) : void
		{
			if(e.offsetY == 1)
			{
				unload(new BuddyScreen(stageRef));
			}
		}
 */
	}
 
}