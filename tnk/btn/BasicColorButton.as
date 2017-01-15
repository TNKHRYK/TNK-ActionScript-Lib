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
	public class BasicColorButton extends Sprite
	{
		private var _color:String = "0x003399";
		
		public function BasicColorButton() 
		{
			ColorShortcuts.init();
			
			this.buttonMode = true;
			this.mouseChildren = false;
			
			this.addEventListener(MouseEvent.MOUSE_OVER, overHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT,  outHandler);
		}
		
		private function overHandler(e:MouseEvent):void 
		{
			Tweener.addTween(color_mc, { _color:_color, time:0.5, transition:"easeOutQuart" } )
		}
		
		private function outHandler(e:MouseEvent):void 
		{
			Tweener.addTween(color_mc,{_color:null, time:0.5, transition:"easeOutQuart"})
		}
		
		public function set color(c:String):void
		{
			_color = c;
			//trace( "_color : " + _color );
		}
		
		public function get color():String
		{
			return _color;
		}
		
		
	}

}