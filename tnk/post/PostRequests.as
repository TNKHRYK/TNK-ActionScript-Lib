package classes.tnk.post
{
	import flash.events.*;
	import flash.net.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.display.*;
	
	/**
	 * PHP→XML
	 * @author ...TanakaHiroyuki
	 */
	public class PostRequests extends EventDispatcher
	{
		private var sendDateObject:URLVariables = new URLVariables();
		
		//接続先
		private var CALC_SERVER_URL:String;
		//responsXML
		public var xml:XML;
		
		public function PostRequests(url:String):void 
		{
			CALC_SERVER_URL = url;	
		}
		
		
		public function sendDate( sendObject:URLVariables  = null) {
			
			
			sendDateObject = sendObject;
			
			var url_Request:URLRequest = new URLRequest();
			
			if(sendDateObject != null)url_Request.data = sendDateObject;
			url_Request.url = CALC_SERVER_URL;
			url_Request.method = URLRequestMethod.POST;
			
			 //送信
			var url_Loader:URLLoader = new URLLoader();
			//UTF-8じゃないとき？
			//url_Loader.dataFormat = URLLoaderDataFormat.VARIABLES;
			url_Loader.addEventListener(Event.COMPLETE, completeHandler);
			url_Loader.addEventListener(Event.OPEN, openHandler);
			url_Loader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			url_Loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			url_Loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			url_Loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			
			try{
				url_Loader.load(url_Request);
			}catch(error:Error) {
				trace("Unable to load requested document.");
				dispatchEvent(new Event("ERROR"));
			}
		}
		
		
		function completeHandler(e:Event):void {
			var loader:URLLoader = URLLoader(e.target);		
			xml = new XML(e.target.data);
			
			dispatchEvent(new Event("COMPLETE"));
			//dispatchEvent(new Event("ERROR"));
		}

		function openHandler(e:Event):void {
			//trace("openHandler: " + e);
		}

		function progressHandler(e:ProgressEvent):void {
			//trace("progressHandler loaded:" + e.bytesLoaded + " total: " + e.bytesTotal);
		}

		function securityErrorHandler(e:SecurityErrorEvent):void {
			trace("securityErrorHandler: " + e);
			dispatchEvent(new Event("ERROR"));
		}

		function httpStatusHandler(e:HTTPStatusEvent):void {
			//trace("httpStatusHandler: " + e);
		}

		function ioErrorHandler(e:IOErrorEvent):void {
			trace("ioErrorHandler: " + e);
			//dispatchEvent(new Event("conError"));
			dispatchEvent(new Event("ERROR"));
		}
		
		
	}
	
}