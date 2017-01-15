﻿package classes.tnk.mc 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author TNKHRYK
	 */
	public class Particle
	{
		private var container:DisplayObjectContainer;
		private var linkage:String;
		private var timer:Timer;
		private var xVel:Number;
		private var yVel:Number;
		private var _vol:Number = 1;
		private var _drag:Number = 0.99;
		private var _shrink:Number = 0.95;
		private var _gravity:Number = 0.8;
		private var _fade:Number = 0.02;
		private var _wind:Number = 0;
		private var _particleScale:Number = 1;
		
		//------------------------------
		//   コンストラクタ
		//------------------------------
		public function Particle(s:String, targetContainer:DisplayObjectContainer)
		{
			linkage = s;
			container = targetContainer;
		}

		//------------------------------
		//   パーティクルの生成
		//------------------------------
		
		private var _count:uint = 0;
		
		private function makeParticle(e:Event):void
		{
			_count++;
			
			var cnt:uint = _count % 8;
			
			if (cnt >= 3) return;
			
			for (var i:uint = 0; i < _vol; i++)
			{
				var mc:MovieClip = new(getDefinitionByName(linkage + cnt));
				//trace( "_count%3 : " + _count%3 );
				mc.scaleX = _particleScale;
				mc.scaleY = _particleScale;
				mc.mouseEnabled = false;
				mc.mouseChildren = false;
				container.addChild(mc);
				
				/*
				var mouseX:int = container.stage.mouseX;
				var mouseY:int = container.stage.mouseY;
				var mousePt:Point = new Point(mouseX, mouseY);
				var pt:Point = getNearPoint(mousePt);

				mc.x = pt.x;
				mc.y = pt.y;
				*/
				mc.xVel = getRandRange( -5, 5);
				mc.yVel = getRandRange( -5, 5);
				mc.rot = getRandRange( -15, 15);
				mc.alpha = 0;	
				
				mc.addEventListener(Event.ENTER_FRAME, onRender);
			}
		}

		//------------------------------
		//   指定範囲からランダム値の取得
		//------------------------------
		private function getRandRange(min:Number, max:Number):Number
		{
			var randomNum:Number = (Math.random() * (max - min )) + min;
			return randomNum;
		}

		//------------------------------
		//   近似ポイント座標の取得
		//------------------------------
		private function getNearPoint(pt1:Point):Point
		{
			var len:uint = Math.round(Math.random() * 10);
			var angle:uint = Math.round(Math.random() * 2 * Math.PI);
			var pt2:Point = Point.polar(len, angle);

			pt2.offset(pt1.x, pt1.y);
			return pt2;
		}

		//------------------------------
		//   スタート
		//------------------------------
		public function start():void
		{
			container.stage.addEventListener(Event.ENTER_FRAME, makeParticle);
		}

		//------------------------------
		//   ストップ
		//------------------------------
		public function stop():void
		{
			container.stage.removeEventListener(Event.ENTER_FRAME, makeParticle);
		}

		//------------------------------
		//   クリック
		//------------------------------
		public function click(scale:Number, time:int ):void
		{
			_particleScale = scale;
			
			container.stage.addEventListener(Event.ENTER_FRAME, makeParticle);

			timer = new Timer(time, 1);
			timer.addEventListener(TimerEvent.TIMER, onDelay);
			timer.start();
		}

		private function onDelay(e:TimerEvent):void
		{
			container.stage.removeEventListener(Event.ENTER_FRAME, makeParticle);
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onDelay);
		}

		//------------------------------
		//   レンダー
		//------------------------------
		private function onRender(e:Event):void
		{
			var mc:MovieClip = e.target as MovieClip;

			if (mc.alpha < 2.5)
			{
				mc.x += mc.xVel + _wind * 10;
				mc.y += mc.yVel;

				mc.xVel *= _drag;
				mc.yVel *= _drag;

				mc.scaleX *= _shrink;
				mc.scaleY *= _shrink;

				mc.yVel += _gravity;
				mc.alpha += _fade;
				mc.rotation += mc.rot;
			}
			else
			{
				mc.removeEventListener(Event.ENTER_FRAME, onRender);
				mc.removeChildAt(0);
				container.removeChild(mc);
				mc = null;
			}
		}

		//------------------------------
		//   getter setter
		//------------------------------
		public function get vol():Number { return _vol; }

		public function set vol(value:Number):void {
			_vol = value;
		}

		public function get drag():Number { return _drag; }

		public function set drag(value:Number):void {
			_drag = value;
		}

		public function get shrink():Number { return _shrink; }

		public function set shrink(value:Number):void {
			_shrink = value;
		}

		public function get gravity():Number { return _gravity; }

		public function set gravity(value:Number):void {
			_gravity = value;
		}

		public function get fade():Number { return _fade; }

		public function set fade(value:Number):void {
			_fade = value;
		}

		public function get wind():Number { return _wind; }

		public function set wind(value:Number):void {
			_wind = value;
		}
	}
}