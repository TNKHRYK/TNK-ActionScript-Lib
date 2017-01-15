package classes.tnk.mc 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class MovieClipUtil
	{
		/**
		 * <span lang="ja">指定された関数を 1 フレーム経過後に実行します。</span>
		 * <span lang="en">Execute the specified function, 1 frame later.</span>
		 * 
		 * @param scope
		 * <span lang="ja">関数が実行される際のスコープです。</span>
		 * <span lang="en">The scope when the function executes.</span>
		 * @param callBack
		 * <span lang="ja">実行したい関数です。</span>
		 * <span lang="en">The function to execute.</span>
		 * @param args
		 * <span lang="ja">関数の実行時の引数です。</span>
		 * <span lang="en">The argument of the function when executes.</span>
		 * 
		 * @example <listing version="3.0">
		 * </listing>
		 */
		public static function doLater( scope:*, callBack:Function, ... args:Array ):void {
			var timer:Timer = new Timer( 100, 1 );
			timer.addEventListener( TimerEvent.TIMER_COMPLETE, function( e:TimerEvent ):void {
				// イベントリスナーを解除する
				Timer( e.target ).removeEventListener( e.type, arguments.callee );
				
				// コールバック関数を実行する
				callBack.apply( scope, args );
			} );
			timer.start();
		}
		
		
		public function MovieClipUtil() 
		{}
		
	}

}