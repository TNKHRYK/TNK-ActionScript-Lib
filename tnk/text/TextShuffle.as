package classes.Util
{
	/**
	 * ...
	 * @author HiroyukiTanaka
	 */
	import flash.display.*;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.*;
	import flash.utils.Timer;

	public class TextShuffle
	{
		public var txt:TextField;						//処理を行うTextField
		public var displayText:String;					//最終的に表示する文字列
		public var charSet:String = "0123456789";		//shuffleに使用する文字
		public var speed:Number;						//スピード(0 < speed < 1);
		
		private var temp_speed:Number;
		private var step:Number;
		 

		//コンストラクタ
		public function TextShuffle(_txt:TextField, _displayText:String, _speed:Number = 0 , _delay:Number = 0):void {
			txt = _txt;
			displayText = _displayText;
			temp_speed = _speed;
			
			var timer:Timer = new Timer(_delay, 1);
			timer.addEventListener(TimerEvent.TIMER, setSpeed);
			timer.start();
			shuffle();
		}

		public function shuffle():void {
			step  = 0;
			speed = 0;
			txt.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function setSpeed(e:TimerEvent):void {
			
			speed = temp_speed;
		}

		private function enterFrameHandler(e:Event):void {
			
			step += speed;

			var stepN = Math.floor(step);
			for(var i:uint = stepN; i < displayText.length; i++) {
				var rndChar:String = charSet.charAt(Math.floor(Math.random() * charSet.length));
				txt.replaceText(i, i + 1, rndChar);
			}
			txt.replaceText(stepN - 1, stepN, displayText.charAt(stepN - 1));
			if(step > displayText.length) {
				step = 0;
				txt.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
		}
	}
}