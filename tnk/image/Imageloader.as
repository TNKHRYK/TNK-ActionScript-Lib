//imageloader.as 画像読み込みクラス
package classes.tnk.image{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;

	public class Imageloader extends Sprite {//クラス宣言

		private var imageArr:Array=new Array();//画像ファイル名の配列
		private var retArr:Array=new Array();//画像格納して返すための配列
		private var flagfinish:Boolean=false;
		private var tprog:Number;//ロードした割合(0～1)

	public function Imageloader(imagearr_hk:Array){//コンストラクタ

		imageArr=imagearr_hk;
		loadimages();
	}

	//////////////////////////////////////////////////////////////
	public function loadimages():void {
		var myimg:Loader;
		var imnum:uint=0;
		var rate:Number;

		imnum=setloadfile(0);//最初の画像設定

		addEventListener( Event.ENTER_FRAME, loading_EF );

		function loading_EF(eventObject:Event):void {//画像のロード

			rate=myimg.contentLoaderInfo.bytesLoaded/
			myimg.contentLoaderInfo.bytesTotal;
			rate=(!rate?0:rate);//値がない時０でないので
			tprog=1/imageArr.length*imnum+rate/imageArr.length;

			if ( (rate >= 1)&&(myimg.contentLoaderInfo.bytesTotal > 30) ){

				retArr.push({ mc:myimg , mcname:imnum });

				//終了かどうか？
				imnum++;
				if (imnum == imageArr.length){//終了
					removeEventListener( Event.ENTER_FRAME, loading_EF );
					flagfinish=true;

				}else{//次を読み込む
					imnum=setloadfile(imnum);//設定
				}
			}
		}

		function setloadfile(num:uint):uint {//読み込む画像を設定する
		
			while(1){
				if(imageArr[num].imagename){//ある場合のみ通常処理
					myimg = new Loader();
					myimg.load(new URLRequest(imageArr[num].imagename+
					"?n="+new Date().getTime()));
					break;
				}else{//ない場合はSKIPする
					retArr.push({ mc:false , mcname:num });
					num++;
				}
			}
			return(num);
		}
	}

	public function isfinish():Object {
		//進捗を報告するメソッド
		return { flagfinish:flagfinish , tprog:tprog };
	}

	public function getimages():Array {
		//得た画像を返すメソッド
		return(retArr);
		}
	}
} 