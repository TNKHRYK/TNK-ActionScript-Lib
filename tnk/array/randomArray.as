//--------------------------------------------------
//　配列の順番をランダムで並べ替えするクラスです
//--------------------------------------------------

class src.randomArray {
    // 静的メソッド
    public function randomArray() 
	{
		trace("RA");
    }
	
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
	}
}