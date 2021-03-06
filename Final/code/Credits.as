﻿package code {
	

	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Stage;
	import flash.events.TouchEvent;
	import flash.events.MouseEvent;
	//import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	public class Credits extends BaseMenu
	{

		public function Credits(stageRef:Stage = null )
		{
			this.stageRef = stageRef;
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			btnBuddy.addEventListener(TouchEvent.TOUCH_BEGIN, buddy,  false, 0, true);
			btnMenu.addEventListener(TouchEvent.TOUCH_BEGIN, menu,  false, 0, true);	
			
			btnBuddy.addEventListener(MouseEvent.MOUSE_DOWN, buddym,  false, 0, true);
			btnMenu.addEventListener(MouseEvent.MOUSE_DOWN, menum,  false, 0, true);
		}

		
		private function menu(e:TouchEvent):void
		{
			unload(new MenuScreen(stageRef));
		}
		
		private function buddy(e:TouchEvent):void
		{
			unload(new BuddyScreen(stageRef));
		}
		
		//
		
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