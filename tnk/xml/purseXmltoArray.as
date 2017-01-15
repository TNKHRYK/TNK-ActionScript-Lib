package classes.tnk.xml 
{
	
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class purseXmltoArray 
	{
		
		public function purseXmltoArray() 
		{
			
		}
		
		/**
		* XMLをオブジェクトアレイに格納
		* <p/>
		* @param	xml		xmlデータ
		* <p/>
		* @param	array	キー配列
		* <p/>
		* @param	name	繰り返しノード
		* <p/>
		* @param	count	データ数
		* <p/>
		*/
		static public function bk_purseXmltoObject( xml:XML , array:Array, name:String, count:int = 0 ):Array {
			
			if (count == 0) {
				//xmlから数かぞえる
				count = xml[name].length();
				//trace( "count : " + count );
			}
			var obj:Object;
			var arrayTotal:int = array.length;
			var returnArray:Array = [];
			
			for (var i:int = 0; i < count; i++) 
			{
				obj = new Object();
				for ( var k:int = 0; k < arrayTotal; k++) {
					obj[array[k]] = xml[name][i][array[k]];
				}
				returnArray[i] = obj;
			}
			
			return returnArray;
			
		}
		
		
		/**
		* XMLをオブジェクトアレイに格納(改良版　http://f-site.org/articles/2009/10/07112031.html)
		* <p/>
		* @param	xml		xmlデータ
		*/
		static public function purseXmltoObject( xml:XML , loopNode:String):Array
		{
			//trace( "loopNode : " + loopNode );
			
			var dataNodeList:XMLList = xml[loopNode];
			var dataNodeList_array:Array = [];
			var nodeData_array:Array = []; 
			
			//0件のとき
			if (dataNodeList[0] == undefined) return [];
			
			//小ノードの要素名をObjectのキーとして使う
			for each (var p:XML in dataNodeList[0].*){
				var xProp:String = p.localName();
				dataNodeList_array.push(xProp);
			}
			
			// Objectオブジェクトを作成し、XMLのノード名をプロパティに、ノードタグの値をプロパティ値に代入。
			for (var x:uint = 0 ; x < dataNodeList.length() ; x++ ){

				nodeData_array[x] = new Object();
				
				var total:int = dataNodeList_array.length;
				
				for ( var i:uint = 0 ; i < total ; i++)
				{
					nodeData_array[x][dataNodeList_array[i]] = dataNodeList[x].elements(dataNodeList_array[i]).toString();
				};
			};
			
			return nodeData_array;
			
		}
		
	}
	
}