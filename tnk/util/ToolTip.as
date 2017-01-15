package classes.tnk.util 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class ToolTip extends MovieClip
	{
		
		public var tipText:String;
		
		public function ToolTip() 
		{
			this.addEventListener( MouseEvent.ROLL_OVER , showToolTip );
			this.addEventListener( MouseEvent.ROLL_OUT , hideToolTip );
		}
		
		// ツールチップ表示
		function showToolTip( e:Event ){
			// 既にツールチップがある場合は削除（これをしないと増え続けるツールチップ地獄に）
			
			//trace( "tipText : " + tipText );
			if (tipText == "" || tipText == null) return;
			
			var tooltip = this.parent.getChildByName("tooltip" )
			if ( tooltip ) this.parent.removeChild( tooltip );

			var tf:TextField = new TextField();
			tf.border = true;
			tf.borderColor = 0x000000;
			tf.background = true;
			tf.backgroundColor = 0xFFFFFF;
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.text = tipText;
			tf.name = "tooltip";
			
			//イチ調整
			if(this.x < stage.stageWidth/2){
				tf.x = this.width + this.x + 5;
				tf.y = this.y - 10;
			}else {
				tf.x = -tf.width + this.x - 5;
				tf.y = this.y - 10;
			}
			
			this.parent.addChild( tf );
		}

		// ツールチップ削除
		function hideToolTip( e:Event ){
			// ツールチップ削除
			var tooltip = this.parent.getChildByName("tooltip" )
			if ( tooltip ) this.parent.removeChild( tooltip );
		}
		
	}

}