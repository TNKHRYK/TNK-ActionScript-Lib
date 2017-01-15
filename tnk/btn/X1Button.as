package classes.tnk.btn 
{
	import classes.project.Menu;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import caurina.transitions.Tweener;
	import caurina.transitions.properties.ColorShortcuts;
	import caurina.transitions.properties.DisplayShortcuts;
	
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class X1Button extends Sprite
	{
		private var _btnEnable:Boolean = true;
		private var _color:String = "0x003399";
		
		public function X1Button() 
		{
			DisplayShortcuts.init();
			ColorShortcuts.init();
			
			this.buttonMode = true;
			this.mouseChildren = false;
			
			this.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT,  outHandler);
		}
		
		private function overHandler(e:MouseEvent = null):void 
		{
			if (!_btnEnable) return;
			
			var btnNum:uint = uint(this.name.split("_")[1]);
			Menu.instance.over(btnNum);
			
			Tweener.addTween(text_mc, { _color:_color, time:0.5, transition:"easeOutQuart" })
		}
		
		private function outHandler(e:MouseEvent = null):void 
		{
			if (!_btnEnable) return;
			
			var btnNum:uint = uint(this.name.split("_")[1]);
			Menu.instance.out(btnNum);
			
			Tweener.addTween(text_mc, { _color:null, time:0.5, transition:"easeOutQuart" })
		}
		
		
		public function hide(e:MouseEvent = null):void 
		{
			if (!_btnEnable) return;
			Tweener.addTween(this, { _tintBrightness :-0.4, time:0.5, transition:"easeOutQuart" })
		}
		
		public function show(e:MouseEvent = null):void 
		{
			//if (!_btnEnable) return;
			Tweener.addTween(this, { _tintBrightness :0, time:0.5, transition:"easeOutQuart" })
		}
		
		
		public function enabled(value:Boolean, isOnState:Boolean = false):void
		{
			if (isOnState) overHandler();
			
			//いつでもきくように(OPおわりだけTRUEにしたい)
			if(value)this.mouseEnabled = value;
			
			_btnEnable = value; 
			
			if (value) { 
				outHandler();
			}
		}
		
		
		
		
	}

}