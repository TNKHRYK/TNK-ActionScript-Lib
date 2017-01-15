package classes.tnk.image 
{
	import classes.tnk.number.NumberUtil;
	import classes.tnk.pv3d.ObjectDragRotation;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import org.libspark.betweenas3.BetweenAS3;
	import org.libspark.betweenas3.easing.*;
	import org.libspark.betweenas3.tweens.ITween;
	import org.libspark.betweenas3.events.TweenEvent;
	
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 * スライドショークラス
	 */
	public class Slideshow
	{
		private var _photoNum:int = 1;
		private var _target:MovieClip;
		private var _time:int;
		private var _slideTotal:int;
		private var _slideTimer:Timer;
		private var _fadeTime:Number;
		
		private const CHANGE_TIME:Number = 0.4;
		
		private var _t1:ITween;
		private var _t2:ITween;
		private var _t3:ITween;
		private var _t4:ITween;
		private var _st:ITween;
		
		
		/**
		* MCのフレームを使ったスライドショー 
		* <p/>
		* @param	target		用意したMC
		* <p/>
		* @param	time		スライド一枚の時間（フェード時間含まず）
		* <p/>
		* @param	slideTotal	スライドの数
		* <p/>
		* @param	fadeTime	フェードインフェードアウトの秒数
		* <p/>
		*/
		public function Slideshow(target:MovieClip,time:int,slideTotal:int,fadeTime:Number) 
		{			
			_target = target;
			_time = time * 1000;
			_slideTotal = slideTotal;
			_fadeTime = fadeTime;
			
			
			_t1 = BetweenAS3.tween( _target , { alpha:0 },  null , _fadeTime, Cubic.easeOut);
			_t2 = BetweenAS3.tween( _target , { alpha:1 },  null , _fadeTime, Cubic.easeOut);
			
			//強制切り替え用
			_t3 = BetweenAS3.tween( _target , { alpha:0 },  null , CHANGE_TIME, Cubic.easeOut);
			_t4 = BetweenAS3.tween( _target , { alpha:1 },  null , CHANGE_TIME, Cubic.easeOut);
		}
		
		public function slideStart():void {
			
			_slideTimer = new Timer( _time , 0 );
			_slideTimer.addEventListener("timer", timerHandler);
			_slideTimer.start();

		}
		
		
		private function timerHandler(e:Event):void {
			
			if (_st != null)_st.stop();
			
			_st = BetweenAS3.serial(
				_t1,
				BetweenAS3.func(imageChange),
				_t2
			);
			
			_st.play();
		}
		
		
		private function imageChange( num:int = 0):void {
			
			if (num == 0) {
				
				_photoNum++;
				_photoNum = NumberUtil.numberLoop(_photoNum, _slideTotal, false);
				
			}else {
				
				_photoNum = num;
				
			}
			
			_target.gotoAndStop(_photoNum);
		}
		
		
		/*
		 * 
		 * スライト停止してページおくり
		 * 
		 */
		
		public function gotoSlide(num:int):void {
			
			if(_slideTimer != null)_slideTimer.stop();
			if (_st != null)_st.stop();
			
			
			if (num == _photoNum) {
				
				//trace("おなじ")
				
				_target.alpha = 1;
				
				_st = BetweenAS3.serial(
					//BetweenAS3.func(imageChange,[num]),
					//_t4
				);
				
			}else {
				
				_st = BetweenAS3.serial(
					_t3,
					BetweenAS3.func(imageChange,[num]),
					_t4
				);
				
			}
			
			
			
			_st.play();
		}
		
		public function restartSlide():void {
			if(_slideTimer != null)_slideTimer.start();
		}
		
		
		public function getPhotoNum():int {
			return _photoNum;
		}
		
		
	}

}