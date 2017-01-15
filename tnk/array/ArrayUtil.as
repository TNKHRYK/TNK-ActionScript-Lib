package classes.tnk.array{

	public class ArrayUtil {
		// 静的メソッド
		public function ArrayUtil() { };
			
		
		//--------------------------------------------------
		//　配列の順番をランダムで並べ替えするクラスです
		//--------------------------------------------------
		static public function shuffle(array:Array):Array
		{
			return array.sort(function():int{return int(Math.random()*3)-1});
		}
		
		
		/*
		public function shufful(array:Array):Array
		{
			
			var temp:Array = array;
			var total:Number = temp.length;
			var num:Number = total;
			var shuffulArray:Array = [];
			
			
			for(var i=0; i<total; i++){
				
				var a:Number = Math.floor( Math.random() * num );
				
				trace(a);
				
				shuffulArray[i] = temp[a];
				var t = temp.splice(a, 1);
				
				trace(temp);
				
				num--;
				
			}
			
			return shuffulArray;
		}*/
		
		
	}
	
}