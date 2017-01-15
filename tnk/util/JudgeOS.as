package classes.tnk.util 
{
	
	import flash.system.Capabilities;
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class JudgeOS
	{
		
		public function JudgeOS() {}
		
		static public function isWin():Boolean {
			
			var os:String = Capabilities.os.substring(0, 3);

			if ( os == "Win" ){
				// Windowsなら
				return true;
			}else {
				// Macなら
				return false;
			}
			
		}
		
		
	}

}