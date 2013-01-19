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

	}

}