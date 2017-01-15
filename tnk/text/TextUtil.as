package classes.tnk.text 
{
	/**
	 * ...
	 * @author HiroyukiTanaka
	 */
	public class TextUtil
	{
		
		public function TextUtil() {}
		
		/**
		* 文字を...で省略
		* <p/>
		* @param	text	元文字列
		* <p/>
		* @param	num		文字数
		* <p/>
		*/
		public static function omitString(text:String , num:int ):String
		{
			if (text.length <= num) return text;
			
			var result:String = text.substr(0, num) + "...";
			return result;
		}
		
	}

}