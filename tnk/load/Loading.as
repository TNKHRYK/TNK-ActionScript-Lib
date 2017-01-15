package classes.Util
{
	/**
	 * ...
	 * @author HiroyukiTanaka
	 */
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.URLRequest;
	
	
	//Loading表示雛形 
	public class Loading extends MovieClip
	{
		
		public static var _root:MovieClip;
		var load_mc:MovieClip;
		public var contentsLoader:Loader;

		public function Loading():void {
			
			//trace("LOADING開始" + this + this.name);
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			x = stage.width / 2;
			y = stage.height / 2;
			gotoAndPlay(2);
			
			//addEventListener(Event.ACTIVATE, startLoading);
		}
		
		public function startLoading() {
			//removeEventListener(Event.ACTIVATE, startLoading);
			
			var loading_mc = this;
			var _root:MovieClip = root as MovieClip;
			
			
			loading_mc.text_mc.Loaded.text = 0;
			loading_mc.mask_mc.scaleY = 0;
			_root.main.content_mc.alpha = 0;
			
			addEventListener(Event.COMPLETE, endLoading);
			
		
			contentsLoader = new Loader();
			//contentsLoader.unload();
			var Loadinfo:LoaderInfo = contentsLoader.contentLoaderInfo;
			
			var request:URLRequest = new URLRequest(_root.main.menuArray[_root.main.nowNum]);
	
			Loadinfo.addEventListener(Event.OPEN,openHandler)
			Loadinfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);		
			Loadinfo.addEventListener(IOErrorEvent.IO_ERROR , IOErrorHandler);	
			Loadinfo.addEventListener(Event.COMPLETE, completeHandler);

			
			function openHandler(e:Event)
			{
				//trace("openHandlerです");
				//addChild(topLoadingBox_mc);
			}

			function progressHandler(e:Event)
			{
				//trace("progressEventです");
				var loading_num:Number = Math.floor(e.target.bytesLoaded / e.target.bytesTotal * 100);
				
				if(loading_num <= 99){
					loading_mc.text_mc.Loaded.text = loading_num;
					loading_mc.mask_mc.scaleY = loading_num/100;
				}else {
					loading_mc.text_mc.Loaded.text = 100;
					loading_mc.mask_mc.scaleY = 1;
				}
			}

			function completeHandler(e:Event)
			{
				//trace("completeです" + e.target);
				loading_mc.gotoAndPlay("endLoad");
				//loading_mc.parent.content_mc.addChild(contentsLoader);
				_root.main.content_mc.addChild(contentsLoader);
			}
			
			
			
			//読み込み開始
			contentsLoader.load(request);
		}
		
		private function endLoading(e:Event):void {
			removeEventListener(Event.COMPLETE, endLoading);
			dispatchEvent(new Event(Event.COMPLETE));
			//removeChild();
		}
		
		private function IOErrorHandler(e:Event):void {
			dispatchEvent(new Event("conError"));
		}
		
	}
}