package classes.tnk.image
{
	import classes.tnk.post.PostRequests;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import caurina.transitions.Tweener;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class SingleImageLoader extends EventDispatcher
	{
		
		public var loadBitmap:Bitmap;
		
		public function SingleImageLoader(pass:String):void 
		{
			trace( "pass : " + pass );
			var loader:Loader = new Loader();
			var loaderInfo:LoaderInfo = loader.contentLoaderInfo;
			var request:URLRequest = new URLRequest(pass);
			loaderInfo.addEventListener(Event.COMPLETE,loadComp);
			loader.load(request);
		}
		
		private function loadComp(e:Event):void {
			//trace(e.target.content);
			loadBitmap = e.target.content;
			
			dispatchEvent(new Event("COMPLETE"));
		}
	}
	
}