package classes.Util
{
	/**
	 * ...
	 * @author HiroyukiTanaka
	 */
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.external.ExternalInterface;
	 
	public class LinkOpen
	{

		public function getURL(page:String , eventNum:uint = 0):void {
			
			trace( "page : " + page );
			
			if(page == "top")		navigateToURL(new URLRequest("../../index.html"), "_self");
			if(page == "agreement")	navigateToURL(new URLRequest("../member/login.php"), "_self");
			if(page == "logout") 	navigateToURL(new URLRequest("../member/login.php"), "_self");
			if (page == "evaluate")	navigateToURL(new URLRequest("http://www.higashin.co.jp/"), "_self");
			if (page == "higashin")	navigateToURL(new URLRequest("http://www.higashin.co.jp/"), "_blank");
			if (page == "join")		navigateToURL(new URLRequest("../member/entry.php"), "_self");
			if (page == "login")	navigateToURL(new URLRequest("../member/login.php"), "_self");
			
			//カーライフプランあしすと積金
			if (page == "1_1")		navigateToURL(new URLRequest("http://www.higashin.co.jp/product/deposit/life-car.html"), "_blank");
			//カーライフあしすとローン
			if (page == "1_2")		navigateToURL(new URLRequest("http://www.higashin.co.jp/product/loan/life-car.html"), "_blank");
			
			//ニューだんらん
			if (page == "5_1")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/loan/newdanran.html"), "_blank");
			//住まいるプラン
			if (page == "5_2")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/loan/smile1.html"), "_blank");
			
			//ご出産あしすと積金
			if (page == "3_1")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/deposit/life-birth.html"), "_blank");
			//ご出産あしすとローン
			if (page == "3_2")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/loan/life-birth.html"), "_blank");
			
			//ブライダルプランあしすと積金
			if (page == "2_1")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/deposit/life-bridal.html"), "_blank");
			//ブライダルプランあしすとローン
			if (page == "2_2")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/loan/life-bridal.html"), "_blank");
			
			//学資プランあしすと積金
			if (page == "4_1")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/deposit/life-education.html"), "_blank");
			//学資プランあしすとローン
			if (page == "4_2")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/loan/life-education.html"), "_blank");
			
			//老後・活き活きプラン積金
			if (page == "6_1")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/deposit/life-oldage.html"), "_blank");

			//トータル
			if (page == "10_1")	navigateToURL(new URLRequest("http://www.higashin.co.jp/product/deposit/life-oldage.html"), "_blank");
		}	
	}
}