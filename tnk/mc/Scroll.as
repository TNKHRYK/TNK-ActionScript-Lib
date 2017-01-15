package classes.tnk.mc{
	import flash.display.MovieClip;
	import flash.events.*;
	import caurina.transitions.Tweener;
	import flash.geom.Rectangle;

	public class Scroll extends MovieClip {
		
		private var triggerX0:Number;
		private var triggerY0:Number;
		
		private var triggerDY:Number;
		
		private var noteY0:Number;
		private var noteDY:Number;
		
		private var delay:Number;
		
		private static const TRIGER_MAX:int = 105;
		private static const BTN_UNIT:int = 5;
		
		//コンストラクタ
		public function Scroll() {
			init();
			
			_onCastAdded();
		}
		
		private function init() {
			trace("----------------------")
			//規約文言をマスクする
			note_mc.mask = mask_mc;
			//トリガーの初期設定
			triggerX0 = trigger_mc.x;
			triggerY0 = trigger_mc.y;
			triggerDY = mask_mc.height - trigger_mc.height;
			
			//規約（note_mc）の初期設定
			noteY0 = note_mc.y;
			noteDY = note_mc.height - mask_mc.height + 10;
					
			delay = .125
			
			trigger_mc.buttonMode = true;
			trigger_mc.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		protected function _onCastAdded():void 
		{
			this.btn_up.addEventListener(MouseEvent.CLICK, btnClickHandler);
			this.btn_up.buttonMode = true;
			this.btn_down.addEventListener(MouseEvent.CLICK, btnClickHandler);
			this.btn_down.buttonMode = true;
			addEventListener(MouseEvent.MOUSE_WHEEL, wheelHandler);
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			trigger_mc.y = 0
			note_mc.y = 10;
		}
		
		private function wheelHandler(e:MouseEvent):void 
		{
			trigger_mc.y -= e.delta * 5;
			trigger_mc.y = Math.max(0, Math.min(triggerDY, trigger_mc.y));
		}
		
		protected function _onCastRemoved():void 
		{
			this.btn_up.removeEventListener(MouseEvent.CLICK, btnClickHandler);
			this.btn_down.removeEventListener(MouseEvent.CLICK, btnClickHandler);
			removeEventListener(MouseEvent.MOUSE_WHEEL, wheelHandler);
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function mouseDownHandler(event:MouseEvent):void {
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
            MovieClip(event.target).startDrag(false,new Rectangle(triggerX0, triggerY0, 0, triggerDY));
        }
        private function mouseUpHandler(event:MouseEvent):void {
            stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
            trigger_mc.stopDrag();
        }

        private function mouseMoveHandler(event:MouseEvent):void {
            event.updateAfterEvent();
        }
		
		private function enterFrameHandler(event:Event) {
			scrolling();
		}
		
		private function scrolling() {
			var per:Number = (trigger_mc.y - triggerY0) / triggerDY;
			var destY:Number = per * -noteDY;
			var dy:Number = destY - note_mc.y;
			
			if (Math.abs(dy)>1) {
				note_mc.y += dy * delay;
			}else {
				note_mc.y = destY;	
			}
			
		}
		
		private function btnClickHandler(e:Event):void {
			//trace( "e : " + e );
			
			if (e.target.name == "btn_up") {
				this.trigger_mc.y -= BTN_UNIT;
				if(this.trigger_mc.y < 0)this.trigger_mc.y = 0;
			}else {
				this.trigger_mc.y += BTN_UNIT;
				if(this.trigger_mc.y > triggerDY)this.trigger_mc.y = triggerDY;
			}
			
		}
		
	}
}