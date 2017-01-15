package classes.tnk.xml {

	import classes.tnk.util.JudgeOS;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.StyleSheet;

	
	/**
	 * NEWS　XML　をセット
	 * 
	 * これをセットします。
	 * 
	 <root>
	    <news>
			<link window="_blank">http://www.gootle.com</link>
			<date>2010/05/4</date>
			<description><![CDATA[ ああああああ ]]></description>
		</news>
	</root>
	 * 
	 * 
	 */
	dynamic public class XmlNewsSetting extends EventDispatcher {
		
		private var _yy:int;
		
		public function XmlNewsSetting(xml:XML , target:MovieClip , point:Boolean = false) {
			
			//trace( "target : " + target.news_txt );
			//trace( "xml : " + xml );
			
			if (JudgeOS.isWin() ) {
				_yy = 16;
			}else {
				_yy = 17;
			}
			
			
			target.news_txt.text = "";
			var style:StyleSheet = new StyleSheet();
			style.setStyle("a", {textDecoration:"underline"});
			style.parseCSS("a:hover{ textDecoration:none}");
			target.news_txt.styleSheet = style;
			
			var newsTotal:int = xml.news.length();
			
			for (var i:int = 0; i < newsTotal; i++) 
			{
				if(xml.news.link[i] != ""){
					target.news_txt.htmlText +=   xml.news.date[i]  + "　" + "<a href='" + xml.news.link[i] + "' target='" + xml.news.link[i].@window + "' >" + xml.news.description[i] + "</a><br>";
				}else {
					target.news_txt.htmlText +=   xml.news.date[i]  + "　" + "" + xml.news.description[i] + "<br>";
				}
				
				var np:Sprite = new newsPoint();
				target.addChild(np);
				np.x = 1;
				np.y = 28 + i * _yy;
				
			}
			
			
			
			
			
			
		}
	}

	
}
