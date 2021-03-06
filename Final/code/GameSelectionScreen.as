﻿package code {
	
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Stage;
	import flash.events.TouchEvent;
	import flash.events.MouseEvent;
	//import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	public class GameSelectionScreen extends BaseMenu
	{

		var runGame:RunningGame;
		var fallGame:FallCatchGame;
		
		public function GameSelectionScreen(stageRef:Stage = null )
		{
			this.stageRef = stageRef;
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			btnBuddy.addEventListener(TouchEvent.TOUCH_BEGIN, buddy,  false, 0, true);
			btnMenu.addEventListener(TouchEvent.TOUCH_BEGIN, menu,  false, 0, true);
			btnRun.addEventListener(TouchEvent.TOUCH_BEGIN, runtGame,  false, 0, true);
			btnCatch.addEventListener(TouchEvent.TOUCH_BEGIN, catchGame,  false, 0, true);
			
			btnBuddy.addEventListener(MouseEvent.MOUSE_DOWN, buddym,  false, 0, true);
			btnMenu.addEventListener(MouseEvent.MOUSE_DOWN, menum,  false, 0, true);
			btnRun.addEventListener(MouseEvent.MOUSE_DOWN, runtGamem,  false, 0, true);
			btnCatch.addEventListener(MouseEvent.MOUSE_DOWN, catchGamem,  false, 0, true);
		}
		
		private function runtGame(e:TouchEvent):void
		{
			remove();
			runGame = new RunningGame();
			
				stageRef.addChild(runGame);
				
		}
		
		private function catchGame(e:TouchEvent):void
		{
			remove();
			fallGame = new FallCatchGame();
			
				stageRef.addChild(fallGame);
		}

		private function menu(e:TouchEvent):void
		{
			unload(new MenuScreen(stageRef));
		}
		
		private function buddy(e:TouchEvent):void
		{
			unload(new BuddyScreen(stageRef));
		}
		
		//mouse evnets
		private function runtGamem(e:MouseEvent):void
		{
			remove();
			runGame = new RunningGame();
			
				stageRef.addChild(runGame);
				
		}
		
		private function catchGamem(e:MouseEvent):void
		{
			remove();
			fallGame = new FallCatchGame();
			
				stageRef.addChild(fallGame);
		}

		private function menum(e:MouseEvent):void
		{
			unload(new MenuScreen(stageRef));
		}
		
		private function buddym(e:MouseEvent):void
		{
			unload(new BuddyScreen(stageRef));
		}

		

	}

}
