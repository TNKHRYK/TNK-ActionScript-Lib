package classes.Util
{
	/**
	 * ...
	 * @author HiroyukiTanaka
	 */
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.external.ExternalInterface;
	 
	public class OpenPopup
	{

		public function OpenPopup(name:String):void {
			
			trace("ポップアップ開く");
			ExternalInterface.call(name);
			
		}	
	}
}