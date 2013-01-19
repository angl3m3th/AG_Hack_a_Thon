package code {
	
	import flash.display.MovieClip;
	import flash.events.TouchEvent;
	import flash.events.MouseEvent;
	//import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.Event;
	
	
	public class RunningGame extends MovieClip {
		
		var track:Track;
		var leftArrow:Arrow;
		var rightArrow:Arrow;
		var player:Player;
		
		var prevArrow:String = "";
		
		Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		
		public function RunningGame() 
		{
			track = new Track();
			
			leftArrow = new Arrow(57, 340, "left");
			leftArrow.rotation = 180;
			rightArrow = new Arrow(493, 340, "right");
			
			player = new Player();
			
			addChild(track);
			trace(track);
			trace(track.x);
			trace(track.y);
			addChild(leftArrow);
			addChild(rightArrow);
			addChild(player);
			
			leftArrow.addEventListener(TouchEvent.TOUCH_TAP, onClick);
			rightArrow.addEventListener(TouchEvent.TOUCH_TAP, onClick);
			
			leftArrow.addEventListener(MouseEvent.MOUSE_DOWN, onClickm);
			rightArrow.addEventListener(MouseEvent.MOUSE_DOWN, onClickm);
			
			addEventListener(Event.ENTER_FRAME, onUpdate);
		}
		
		function onClick(evtObj:TouchEvent)
		{
			//trace("what? " + evtObj.target.getDirection() );
			
			if(evtObj.target.getDirection() != prevArrow)
			{
				var pSpeed:Number = player.getSpeed();
				pSpeed += 3;
				player.setSpeed(pSpeed);
				prevArrow = evtObj.target.getDirection();
			}
			
		}
		
		function onClickm(evtObj:MouseEvent)
		{
			//trace("what? " + evtObj.target.getDirection() );
			
			if(evtObj.target.getDirection() != prevArrow)
			{
				var pSpeed:Number = player.getSpeed();
				pSpeed += 3;
				player.setSpeed(pSpeed);
				prevArrow = evtObj.target.getDirection();
			}
			
		}
		
		function onUpdate(e:Event)
		{
			var pSpeed:Number = player.getSpeed();
			pSpeed -= .5;
			if(pSpeed < 0)
				pSpeed = 0;
				
			//trace("pSpeed: " + pSpeed);
			player.setSpeed(pSpeed);
			
			if(track.x > 610 - track.width)
				track.x -= player.getRealSpeed();
			

		}
	}
	
}
