package classes.tnk.util
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import caurina.transitions.Tweener;
	

	public class ExTimer extends EventDispatcher
	{
		private var _target:Object;
		private var _delay:Number;
		private var _repeatCount:int;
		private var _currentCount:int;
		
		/// Constructs a new Timer object with the specified delay and repeatCount states.
		public function ExTimer(delay:Number, repeatCount:int = 0)
		{
			_delay = delay;
			_repeatCount = repeatCount;
			_target = new Object();
		}
		
		/// The total number of times the timer has fired since it started at zero.
		public function get currentCount():int
		{
			return _currentCount;
		}
		
		/// The delay, in milliseconds, between timer events.
		public function get delay():Number
		{
			return _delay;
		}
		public function set delay(value:Number):void
		{
			if (value < 0) {
				throw new RangeError("Error #2006: The Timer delay specified is out of range.", 2006);
				return;
			}
			_delay = value;
			if (running) {
				stop();
				start();
			}
		}
		
		/// The total number of times the timer is set to run.
		public function get repeatCount():int
		{
			return _repeatCount;
		}
		public function set repeatCount(value:int):void
		{
			_repeatCount = value;
			if (running) {
				stop();
				start();
			}
		}
		
		/// The timer's current state; true if the timer is running, otherwise false.
		public function get running():Boolean
		{
			return Tweener.isTweening(_target);
		}
		
		/// Starts the timer, if it is not already running.
		public function start():void
		{
			if (running) {
				trace("The Timer is running.");
				return;
			}
			var count:Number = (_repeatCount != 0) ? _repeatCount - _currentCount : uint.MAX_VALUE;
			if (count <= 0) {
				trace("repeatCount is set to a total that is the same or less than currentCount.");
				return;
			}
			Tweener.addCaller(_target, { time:_delay*count/1000, count:count, transition:"linear", onUpdate:countUp, onComplete:onComplete } );  
		}
		
		/// Stops the timer.
		public function stop():void
		{
			Tweener.removeTweens(_target);
		}
		
		/// Stops the timer, if it is running, and sets the currentCount property back to 0, like the reset button of a stopwatch.
		public function reset():void
		{
			stop();
			_currentCount = 0;
		}
		
		/// Pauses the timer.
		public function pause():void
		{
			Tweener.pauseTweens(_target);
			trace( "_target : " + _target );
		}
		
		/// Resumes the timer.
		public function resume():void
		{
			Tweener.resumeTweens(_target);
		}
		
		private function countUp()
		{
			_currentCount++;
			//trace( "_currentCount : " + _currentCount );
			dispatchEvent(new TimerEvent(TimerEvent.TIMER));
		}
		
		private function onComplete()
		{
			dispatchEvent(new TimerEvent(TimerEvent.TIMER_COMPLETE));
		}
	}
}