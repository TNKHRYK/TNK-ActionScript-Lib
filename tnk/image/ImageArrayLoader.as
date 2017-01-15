package classes.tnk.image{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;

	public class ImageArrayLoader extends EventDispatcher {
	
		private var _imgLoader:Loader;
		private var _target:Sprite;
		private var _total:uint;
		//読み込み枚数確認用
		private var _count:uint;
		private var _loadedArray:Array = [];
		
		private var _targetArray:Array = [];
		private var _rnd:String = String(Math.floor(Math.random()*100000));
		
		/**
		 * 
		 * コンストラクタ
		 * 
		 **/
		public function ImageArrayLoader() {
			_count = 0;
		}
		
		public function loadImg(imgUrlArr:Array):void {
			
			//_targetArray = targetArray;
			//_target = target;
			_total = imgUrlArr.length;
		
			
			for (var i:int = 0; i < _total; i++) {
				
				if (imgUrlArr[i] == "") {
					
					blankURL(i);
					
				}else {
						var load_req:URLRequest = new URLRequest(imgUrlArr[i]  + "?t=" + _rnd );
					  _imgLoader = new Loader();
					  _imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler(i));  
					  _imgLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, error(i));  
					  _imgLoader.load(load_req);
				}
				
			  
			}
			
			
			
		}
		
		
		
		private function error(num:int):Function 
		{
			return function(e:Event) {
				
				//読み込めなかったことを保存
				_loadedArray[num] = null;
				
				_count++;
				
				//debag
				//tf.text += "\n" + "よみこめなかった" + _count + " / "+_total;
				
				
				if (_count == _total) {
					//tf.text += "\n" + "YUYUYUYYYYUYUY" 
					//全部読みこみ完了
					dispatchEvent(new Event("COMPLETE"));
				}
				
				_imgLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, arguments.callee );  
			};
		}
		
		private function completeHandler(num:int):Function {

			return function(e:Event) {
				
				//読み込んだ画像を保存
				
				
				_loadedArray[num] = e.target.content;
				
				_count++;
				
				//debag
				//tf.text += "\n" + "aaaaaaaaaaaa" + _count + " / "+_total;
				//trace("よみこめた-----" + num);
				
				if (_count == _total) {
					//tf.text += "\n" + "MOMMOMOMOMMOMO" 
					//全部読みこみ完了
					dispatchEvent(new Event("COMPLETE"));
				}
				
				  _imgLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, arguments.callee);
			};
		}
		
		private function blankURL(num:int):void 
		{
			//読み込めなかったことを保存
			_loadedArray[num] = null;
			
			_count++;
			
			if (_count == _total) {
				//全部読みこみ完了
				dispatchEvent(new Event("COMPLETE"));
			}
		}
		
		
		public function get loadedArray():Array {
			return _loadedArray;
		}

		
	}
}