package classes.tnk.mc
{
	import flash.display.MovieClip;
	import flash.events.*;
	import caurina.transitions.Tweener;
	import flash.geom.Rectangle;
	//import jp.progression.casts.CastMovieClip;
	
	//import classes.project.history.History1;

	public class ScrollSet extends MovieClip {
		
		public var isScroll:Boolean;
		
		private var triggerX0:Number;
		private var triggerY0:Number;
		
		private var triggerDY:Number;
		
		private var noteY0:Number;
		private var noteDY:Number;
		
		private var delay:Number;
		
		private  var TRIGER_MAX:int;
		
		private const CLICK_MOVE:uint = 15;
		
		//コンストラクタ
		public function ScrollSet()
		{
			//マスクかける
			note_mc.mask = mask_mc;
			
			//トリガー下限
			triggerDY = bar_mc.height - trigger_mc.height;
			noteDY = note_mc.height - mask_mc.height;
			triggerX0 = trigger_mc.x;
			triggerY0 = trigger_mc.y;
			
			//スクロールでぃれい
			delay = 0.18
			
			//マスクより小さいときはスクロールなし
			if (mask_mc.height >= note_mc.height){
				bar_mc.visible = false;
				trigger_mc.visible = false;
				isScroll = false;	
			}else {
				bar_mc.visible = true;
				trigger_mc.visible = true;
				isScroll = true;
			}
			
			//UI
			trigger_mc.buttonMode = true;
			btn_up.buttonMode = true;
			btn_down.buttonMode = true;
			
			
			
			//初期状態に
			//reset();
		}
		
		public function reset():void
		{
			trigger_mc.y = triggerY0;
			note_mc.y = triggerY0;
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			trigger_mc.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, wheelHandler);
			btn_up.addEventListener(MouseEvent.MOUSE_DOWN, btnDownHandler);
			btn_down.addEventListener(MouseEvent.MOUSE_DOWN, btnDownHandler);
		}
		


		private function wheelHandler(e:MouseEvent):void 
		{
			trigger_mc.y -= e.delta * 5;
			trigger_mc.y = Math.max(0, Math.min(triggerDY, trigger_mc.y));
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
		
		private function btnDownHandler(e:MouseEvent):void 
		{
			var vec:int;
			
			if (e.target.name == "btn_up") {
				vec = -1;
			}else {
				vec = 1;
			}
			
			var yy:int = trigger_mc.y + CLICK_MOVE * vec;
			
			if (yy < triggerY0) yy = triggerY0;
			if (yy > triggerDY) yy = triggerDY;
			
			trigger_mc.y = yy;
			
		}
		
		/**************************************************
		 * スクロール破棄
		 **************************************************/
		public function destroy():void 
		{			
			trigger_mc.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			stage.removeEventListener(MouseEvent.MOUSE_WHEEL, wheelHandler);
			this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			btn_up.removeEventListener(MouseEvent.MOUSE_DOWN, btnDownHandler);
			btn_down.removeEventListener(MouseEvent.MOUSE_DOWN, btnDownHandler);
		}
		
	}
}