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

	public class BuddyScreen extends BaseMenu
	{

		public function BuddyScreen(stageRef:Stage = null )
		{
			this.stageRef = stageRef;
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			btnBuddy.addEventListener(TouchEvent.TOUCH_BEGIN, buddy,  false, 0, true);
			btnMenu.addEventListener(TouchEvent.TOUCH_BEGIN, menu,  false, 0, true);
			btnLaz.addEventListener(TouchEvent.TOUCH_BEGIN, fat,  false, 0, true);
			btnHealth.addEventListener(TouchEvent.TOUCH_BEGIN, jacked,  false, 0, true);
			btnNorm.addEventListener(TouchEvent.TOUCH_BEGIN, norm,  false, 0, true);
			
			btnBuddy.addEventListener(MouseEvent.MOUSE_DOWN, buddym,  false, 0, true);
			btnMenu.addEventListener(MouseEvent.MOUSE_DOWN, menum,  false, 0, true);
			btnLaz.addEventListener(MouseEvent.MOUSE_DOWN, fatm,  false, 0, true);
			btnHealth.addEventListener(MouseEvent.MOUSE_DOWN, jackedm,  false, 0, true);
			btnNorm.addEventListener(MouseEvent.MOUSE_DOWN, normm,  false, 0, true);
		}

		private function fat(e:TouchEvent):void
		{
			mcHowlsALot.gotoAndPlay("unhealthy");
		}
		
		private function jacked(e:TouchEvent):void
		{
			mcHowlsALot.gotoAndPlay("healthy");
		}
		
		private function norm(e:TouchEvent):void
		{
			mcHowlsALot.gotoAndPlay("normal");
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
		private function fatm(e:MouseEvent):void
		{
			mcHowlsALot.gotoAndPlay("unhealthy");
		}
		
		private function jackedm(e:MouseEvent):void
		{
			mcHowlsALot.gotoAndPlay("healthy");
		}
		
		private function normm(e:MouseEvent):void
		{
			mcHowlsALot.gotoAndPlay("normal");
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