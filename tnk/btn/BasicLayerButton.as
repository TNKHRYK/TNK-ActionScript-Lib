package classes.tnk.btn 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import caurina.transitions.Tweener;
	import caurina.transitions.properties.ColorShortcuts;
	import caurina.transitions.properties.DisplayShortcuts;
	
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class BasicLayerButton extends Sprite
	{
		private var _btnEnable:Boolean = true;
		
		public function BasicLayerButton() 
		{
			this.buttonMode = true;
			this.mouseChildren = false;
			
			this.on_mc.alpha = 0;
			
			this.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT,  outHandler);
		}
		
		private function overHandler(e:MouseEvent = null):void 
		{
			if (!_btnEnable) return;
			Tweener.addTween(this.on_mc, { alpha:1, time:0.8 } );
		}
		
		private function outHandler(e:MouseEvent = null):void 
		{
			if (!_btnEnable) return;
			Tweener.addTween(this.on_mc, { alpha:0, time:0.8 } );
		}
		
		
		public function enabled(value:Boolean, isOnState:Boolean = false):void
		{
			if (isOnState) overHandler();
			
			this.mouseEnabled = value;
			_btnEnable = value; 
			
			if (value) { 
				outHandler();
			}
			
			
			
		}
		
	}

}