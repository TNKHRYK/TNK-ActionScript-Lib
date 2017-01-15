package classes.tnk.xml
{
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.System;
	import flash.events.Event;
	
	public class XmlLoader extends EventDispatcher {
		private var isXmlList:Boolean = false;
		private var xmlLoader:URLLoader;
		private var xml:XML;
		private var xmlList:XMLList;
		private var object:Object;
		
		/*
		XMLファイルの文字エンコード形式がUnicodeならtrue、Shift_JISならfalseとして呼び出します。
		*/
		public function XmlLoader(url:String, isUnicode:Boolean , xmlListFlag:Boolean = false ) 
		{
			isXmlList = xmlListFlag;
			xmlLoader = new URLLoader();
			xmlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
			xmlLoader.addEventListener(IOErrorEvent.IO_ERROR, onXMLFailed);
			System.useCodePage = !isUnicode;
			xmlLoader.load(new URLRequest(url));
		}
		
		private function onXMLFailed(e:IOErrorEvent):void 
		{
			dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
		}
		
		private function onXMLLoaded(e:Event):void 
		{
			try {
				if (isXmlList) {
					xmlList =  new XMLList(xmlLoader.data);
				}else {
					xml = new XML(xmlLoader.data);
				}
				
				parseXML();
				
			} catch(err:TypeError) {
				trace(err.message);
			}
		}
		
		private function parseXML() 
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get rawXML():XML 
		{
			return xml;
		}
		
		public function get rawXMLList():XMLList 
		{
			return xmlList;
		}
		
		public function get data():Object 
		{
			return object;
		}
	}
}