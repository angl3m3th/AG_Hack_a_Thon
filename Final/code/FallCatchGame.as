package  code{
	
	import flash.display.MovieClip;
		import flash.events.TouchEvent;
	import flash.events.MouseEvent;
	//import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.Event;
	
	
	import flash.geom.ColorTransform;

	import flash.display.Sprite;

	
	public class FallCatchGame extends MovieClip 
	{
		Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		
		var falling:Array;
		var obj1:FallingObj;
		var obj2:FallingObj;
		var obj3:FallingObj;
		
		var basket:Basket;
		
		var counter:int;
		var numPass:int;
		var respawner:int;
		
		var leftArrow:Arrow;
		var rightArrow:Arrow;
		
		var leftDown:Boolean;
		var rightDown:Boolean;
	
		var gameOver:Boolean;
		
		public var objLayer:Sprite = new Sprite();
		
		public function FallCatchGame()
		{
			addChild(objLayer);
			counter = 0;
			numPass = 0;
			respawner = 50;
			
			leftArrow = new Arrow(40, 340, "left");
			leftArrow.rotation = 180;
			rightArrow = new Arrow(510, 340, "right");
			
			var myColor:ColorTransform = this.transform.colorTransform;
			myColor.color = Math.random() * 0xFFFFFF;
			obj1 = new FallingObj(100, 0, myColor);
			
			var xLoc:int = (Math.random() * (550 - obj1.width)) + obj1.width;
			
			falling = new Array();
			
			
			basket = new Basket();
			
			falling.push(obj1);
			
			objLayer.addChild(obj1);
			
			
			addChild(basket);
			
			leftArrow.scaleX = .75;
			leftArrow.scaleY = .75;
			leftArrow.scaleZ = .75;
			
			rightArrow.scaleX = .75;
			rightArrow.scaleY = .75;
			rightArrow.scaleZ = .75;
			
			addChild(leftArrow);
			addChild(rightArrow);
			
			leftDown = false;
			rightDown = false;
			gameOver = false;
			
			
			leftArrow.addEventListener(TouchEvent.TOUCH_BEGIN , onHold);
			rightArrow.addEventListener(TouchEvent.TOUCH_BEGIN, onHold);
			
			leftArrow.addEventListener(TouchEvent.TOUCH_END , onUp);
			rightArrow.addEventListener(TouchEvent.TOUCH_END, onUp);
			
			leftArrow.addEventListener(MouseEvent.MOUSE_DOWN , onHoldm);
			rightArrow.addEventListener(MouseEvent.MOUSE_DOWN, onHoldm);
			
			leftArrow.addEventListener(MouseEvent.MOUSE_UP , onUpm);
			rightArrow.addEventListener(MouseEvent.MOUSE_UP , onUpm);
			
			addEventListener(Event.ENTER_FRAME, onUpdate);
		}
		
		function onUpdate(e:Event)
		{
			if(!gameOver)
			{
				if(leftDown)
				{
					if(basket.x >= basket.width/2)
						basket.x -= 5
				}
				if(rightDown)
				{
					if(basket.x <= 550 - basket.width/2)
						basket.x +=5;
				}
				
				counter++;
				
				for(var i:int = 0; i < falling.length; i++)
				{
					var fallObj:FallingObj = falling[i] as FallingObj;
					fallObj.fall();
					
					if(fallObj.hitTestObject(basket))
					{
						objLayer.removeChild(fallObj);
						falling.splice(i,1);
						trace("HIT!");
						basket.updateScore();
					}
					if(fallObj.y > (400 - fallObj.height/2))
					{
						falling.splice(i,1);
						objLayer.removeChild(fallObj);
						numPass++;
					}
				}
				
				if(counter % respawner == 0)
				{
					var xLoc:int = (Math.random() * (550 - obj1.width)) + obj1.width;
					var myColor:ColorTransform = this.transform.colorTransform;
					myColor.color = Math.random() * 0xFFFFFF;
					var newFall:FallingObj = new FallingObj(xLoc, 0, myColor); 
					
					falling.push(newFall);
					objLayer.addChild(newFall);
					
					if (counter % 100 == 0)
						if(respawner > 20)
						respawner -= 5;
					
				}
				
				//trace("respawner: " + respawner);
				
				if(numPass >= 12)
					endGame();
			}
			
		}
		
		function onHold(evtObj:TouchEvent)
		{
			//trace("what? " + evtObj.target.getDirection() );
			
			if(evtObj.target.getDirection() == "left")
			{
				leftDown = true;
			}
			else
			{
				rightDown = true;
			}
			
		}
		
		function onUp(evtObj:TouchEvent)
		{
			//trace("what? " + evtObj.target.getDirection() );
			
			if(evtObj.target.getDirection() == "left")
			{
				leftDown = false;
			}
			else
			{
				rightDown = false;
			}
			
		}
		
		//Extra for the mice, 2 percent for looking in the mirror twice
		function onHoldm(evtObj:MouseEvent)
		{
			//trace("what? " + evtObj.target.getDirection() );
			
			if(evtObj.target.getDirection() == "left")
			{
				leftDown = true;
			}
			else
			{
				rightDown = true;
			}
			
		}
		
		function onUpm(evtObj:MouseEvent)
		{
			//trace("what? " + evtObj.target.getDirection() );
			
			if(evtObj.target.getDirection() == "left")
			{
				leftDown = false;
			}
			else
			{
				rightDown = false;
			}
			
		}
		
		function endGame():void
		{
			removeChild(objLayer);
			gameOver = true;
			//removeEventListener(Event.ENTER_FRAME, onUpdate);
			
		}

	}
	
}
