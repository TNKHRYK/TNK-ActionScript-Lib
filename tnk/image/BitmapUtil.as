package classes.tnk.image 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class BitmapUtil
	{
		
		public function BitmapUtil() { }
		
		/**
		* bitmapリサイズ 
		* <p/>
		* @param	target		リサイズする画像データ
		* <p/>
		* @param	ori_w		
		* <p/>
		* @param	ori_h	
		* <p/>
		* @param	resize_w	
		* <p/>
		* @param	resize_h	
		* <p/>
		* @param	smooth
		*/
		public static function resizeBitmapData(target:BitmapData , ori_w:int, ori_h:int, resize_w:int , resize_h:int , smooth:Boolean = false):BitmapData {
			
			var resizebmd:BitmapData = new BitmapData(resize_w, resize_h);
			var matrix:Matrix = new Matrix(); 
			matrix.scale(resize_w / ori_w, resize_h / ori_h);
			resizebmd.draw(target, matrix,null,null,null,smooth);
			
			return resizebmd;
		}
		
		
		
		/**
		* bitmap→bitmapdata 
		* <p/>
		* @param	target		リサイズする画像データ
		* <p/>
		* @param	ori_w		
		* <p/>
		* @param	ori_h	
		* <p/>
		* @param	resize_w	
		* <p/>
		* @param	resize_h	
		* <p/>
		* @param	smooth
		*/
		public static function bitmapToBitmapData():BitmapData
		{
			
			
			
		}
		
	}

}