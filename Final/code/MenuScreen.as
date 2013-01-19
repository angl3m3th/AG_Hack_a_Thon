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
			
			btnBuddy.addEventListener(MouseEvent.MOUSE_DOWN, buddym,  false, 0, true);
			btnMenu.addEventListener(MouseEvent.MOUSE_DOWN, menum,  false, 0, true);		
			btnExercise.addEventListener(MouseEvent.MOUSE_DOWN, exerciseLogm,  false, 0, true);
			btnFood.addEventListener(MouseEvent.MOUSE_DOWN, foodLogm, false, 0, true);
			btnGames.addEventListener(MouseEvent.MOUSE_DOWN, gameSelectm, false, 0, true);
			btnCreds.addEventListener(MouseEvent.MOUSE_DOWN, credsm, false, 0, true);
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
		
		//Mouse Events, for testing on computer without emulator
		
		private function menum(e:MouseEvent):void
		{
			unload(new MenuScreen(stageRef));
		}
		
		private function credsm(e:MouseEvent):void
		{
			unload(new Credits(stageRef));
		}
		
		private function gameSelectm(e:MouseEvent):void
		{
			unload(new GameSelectionScreen(stageRef));
		}
		
		private function buddym(e:MouseEvent) : void
		{
			unload(new BuddyScreen(stageRef));
		}
		
		private function exerciseLogm(e:MouseEvent) : void
		{
			unload(new ExerciseLog(stageRef));
		}
		
		private function foodLogm(e:MouseEvent) : void
		{
			unload(new FoodLog(stageRef));
		}
		
	}
 
}