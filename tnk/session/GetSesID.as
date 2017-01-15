package classes.Util
{
	/**
	 * ...
	 * @author HiroyukiTanaka
	 */
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.external.ExternalInterface;
	 
	public class GetSesID
	{
		
		public var _sesID;

		public function getSessionID():String {
			
			trace("セッションＩＤの取得");
			//var id:String = navigateToURL(new URLRequest('javascript:checkCookie();'),'_self');
			var id:String = ExternalInterface.call("checkCookie");
			//trace( "id : " + id );
			
			return id;
			
		}	
	}
}