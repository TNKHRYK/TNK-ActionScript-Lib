package classes.tnk.number 
{
	
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class NumberUtil 
	{
		
		public function NumberUtil() 
		{
			
		}
		/**
		* 数字をループ 
		* <p/>
		* @param	num			変換する数字
		* <p/>
		* @param	total		数字の上限、これ超えるとリセット
		* <p/>
		* @param	zeroFlag	0に戻るか1に戻るか
		* <p/>
		*/
		public static function numberLoop(num:int, total:int , zeroFlag:Boolean):int {
			
			var returnNum:int = num;
			
			if (zeroFlag) {
				
				if (num < 0) {
					return total + num + 1;
				}
								
				if (num > total) {
					return num - total -1;
				}
				
				
			}else {
				
				if (num < 1) {
					return total;
				}
								
				if (num > total) {
					return 1;
				}
				
			}
			return num;
		}
		
		
		/**
		* 2点間の距離を算出 
		* <p/>
		* @param	p1_x	座標
		* <p/>
		* @param	p1_y	座標
		* <p/>
		* @param	p2_x	座標
		* <p/>
		* @param	p2_y	座標
		* <p/>
		*/
		public static function GetDistancePointToPoint(p1_x:Number, p1_y:Number, p2_x:Number, p2_y:Number) : Number
		{
			// X
			var x:Number = Math.pow((p1_x - p2_x), 2);
			
			// Y
			var y:Number = Math.pow((p1_y - p2_y), 2);
			
			// 距離計算
			return Math.sqrt(x + y);
		}

			
		/**
		* 数字をループ2
		* <p/>
		* @param	num			変換する数字
		* <p/>
		* @param	total		数字の上限、これ超えるとリセット
		*/
		public static function numberLoop2(num:int, total:int):int {
			
			var returnNum:int;
			
			if (num < total) {
			
				returnNum = num;
				
			}else{
			
				
				returnNum = num % total;
				
			}
			
			return returnNum;
		}
		
		
	}
	
}