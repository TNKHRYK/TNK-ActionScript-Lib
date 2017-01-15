package classes.Util
{
	/**
	 * ...
	 * @author HiroyukiTanaka
	 */
	import flash.display.MovieClip;
	import flash.text.*;
	import flash.events.*;
	import classes.Util.NumFormat;
	import classes.Form.Params;
	 
	public class TabIndex
	{
		public function TabIndex() { };
		
		
		public function setIndex(_array:Array , _this:MovieClip, _main:Object , _school:Boolean = true):void {
			
			var temp:int = 0;
			
			//学資２段目はbase1と複合
			if (_school == false) {
				temp = 3;
			}
			
			//tabIndexの制御
			for(var i:Number = 0; i<_array.length; i++)
			{
				//trace(_this[_array[i]])
				_this[_array[i]].tabIndex = Number(i) + 1 + temp;
			}
			
			//フォーカスを1番に異動(学資２段目以外)
			if (_school) {
				_main.stage.focus = _this[_array[0]];
			}
		}
		
		
		public function tabunEnable(_array:Array , _this:MovieClip):void {
		
			for(var i:Number = 0; i<_array.length; i++)
			{
				_this[_array[i]].tabEnabled = false;
			}		
		}
		
		public function tabEnable(_array:Array , _this:MovieClip):void {
		
			for(var i:Number = 0; i<_array.length; i++)
			{
				_this[_array[i]].tabEnabled = true;
			}		
		}
		
		//***************************************************************
		// 老後用
		//***************************************************************
		public function seniorTab(_nowInput:int , _this:MovieClip, _main:Object) {
			
			for (var i:uint = 1; i <= 3; i++) {
				
				if (i == _nowInput) {
					tabEnable(this["tab_Senior" + i], _this["form" + i + "_mc"]);
					setIndex (this["tab_Senior" + i], _this["form" + i + "_mc"], _main);
				}else {
					tabunEnable(this["tab_Senior" + i], _this["form" + i + "_mc"]);
				}
			}
			
		}
		
		
		
		private var tab_Senior1 = [
			"BIRTH_Y",						
			"BIRTH_M",						
			"RTRMNT_Y",								
			"RTRMNT_M",								
			"INCM_Y",								
			"INCM_M",								
			"INCM_AMT",								
			"INCM1_Y",								
			"INCM1_M",								
			"INCM1_AMT",								
			"INCM2_Y",								
			"INCM2_M",								
			"INCM2_AMT",								
			"RTRMNT_ALWC_Y",								
			"RTRMNT_ALWC_M",								
			"RTRMNT_ALWC_AMT",								
			"PNSN1_Y",								
			"PNSN1_M",								
			"PNSN1_AMT",								
			"PNSN2_Y",								
			"PNSN2_M",								
			"PNSN2_AMT",
			"ETC_INCM_AMT",	
			"ETC_INCM_FROM_Y",								
			"ETC_INCM_FROM_M",								
			"ETC_INCM_TO_Y",								
			"ETC_INCM_TO_M",															
			"CNSRT_RTRMNT_Y",								
			"CNSRT_RTRMNT_M",								
			"CNSRT_INCM_Y",								
			"CNSRT_INCM_M",								
			"CNSRT_INCM_AMT",								
			"CNSRT_INCM1_Y",								
			"CNSRT_INCM1_M",								
			"CNSRT_INCM1_AMT",								
			"CNSRT_INCM2_Y",								
			"CNSRT_INCM2_M",								
			"CNSRT_INCM2_AMT",								
			"CNSRT_RTRMNT_ALWC_Y",								
			"CNSRT_RTRMNT_ALWC_M",								
			"CNSRT_RTRMNT_ALWC_AMT",								
			"CNSRT_PNSN1_Y",								
			"CNSRT_PNSN1_M",								
			"CNSRT_PNSN1_AMT",
			"CNSRT_PNSN2_Y",								
			"CNSRT_PNSN2_M",								
			"CNSRT_PNSN2_AMT"								
		]
	
		private var tab_Senior2 = [
										
			"COST_LVNG_Y",								
			"COST_LVNG_M",								
			"COST_LVNG_AMT",								
			"COST_LVNG1_Y",								
			"COST_LVNG1_M",								
			"COST_LVNG1_AMT",								
			"COST_LVNG2_Y",								
			"COST_LVNG2_M",								
			"COST_LVNG2_AMT",								
			"COST_LVNG3_Y",								
			"COST_LVNG3_M",								
			"COST_LVNG3_AMT",								
			"LF_EVENT1_CPTL_AMT",								
			"LF_EVENT1_CPTL_Y",								
			"LF_EVENT1_CPTL_M",								
			"LF_EVENT2_CPTL_AMT",								
			"LF_EVENT2_CPTL_Y",								
			"LF_EVENT2_CPTL_M",								
			"LF_EVENT3_CPTL_AMT",								
			"LF_EVENT3_CPTL_Y",								
			"LF_EVENT3_CPTL_M",								
			"HSNG_LOAN_END_Y",								
			"HSNG_LOAN_END_M",								
			"HSNG_LOAN_END_AMT",								
			"ETC_LOAN_END_Y",								
			"ETC_LOAN_END_M",								
			"ETC_LOAN_END_AMT"
			]
			
		private var tab_Senior3 = [
			"CPTL",									
			"SVNG_MNTHLY_AMT",								
			"SVNG_YEARS",								
			"SVNG_MONTHS",								
			"SVNG_YEAR_RATE",								
			"SVNG_ST_Y",							
			"SVNG_ST_M"							
		];
		
		//***************************************************************
		// 学資用
		//***************************************************************
		public function schoolTab(_nowInput:int , _this:MovieClip, _main:Object) {

			//ラジオボタンはタブインデックスから除外
			tabunEnable(tab_SchoolRadio, _this.base_0);
			tabunEnable(rev_School, _this.form1_mc);

			if (_nowInput == 0) {
				tabEnable(tab_School0, _this.base_0);
				setIndex(tab_School0, _this.base_0, _main);
				tabunEnable(tab_School1, _this.base_0.result_mc);
				tabunEnable(tab_School2, _this.form1_mc);	
			}

			if (_nowInput == 1) {
				tabunEnable(tab_School0, _this.base_0);
				setIndex(tab_School1, _this.base_0.result_mc,_main);
				tabEnable(tab_School1, _this.base_0.result_mc);
				tabunEnable(tab_School2, _this.form1_mc);	
			}
			
			if (_nowInput == 2) {
				tabunEnable(tab_School0, _this.base_0);
				tabEnable(tab_School1, _this.base_0.result_mc);	
				setIndex(tab_School1, _this.base_0.result_mc,_main);
				tabEnable(tab_School2, _this.form1_mc);	
				setIndex(tab_School2, _this.form1_mc,_main , false);	
			}
			
		}
		
		
		private var tab_School0 = [
			"CHLD1_BIRTH_Y",								
			"CHLD1_BIRTH_M",								
			"CHLD2_BIRTH_Y",							
			"CHLD2_BIRTH_M",							
			"CHLD3_BIRTH_Y",								
			"CHLD3_BIRTH_M"								
		];
		
		private var tab_School1 = [
			"COST_EVENT_AMT",								
			"CPTL",																
			"BIRTH_Y",								
			"BIRTH_M"								
		];
		
		private var rev_School = [
			"COST_EVENT_AMT",								
			"CPTL",																
			"BIRTH_Y",								
			"BIRTH_M",
			"EVENT_Y",								
			"EVENT_M"	
		];
		
		private var tab_School2 = [	
			/*"COST_EVENT_AMT",								
			"CPTL",																
			"BIRTH_Y",								
			"BIRTH_M",*/
			"SVNG_MNTHLY_AMT",								
			"SVNG_YEARS",								
			"SVNG_MONTHS",								
			"SVNG_YEAR_RATE",								
			"SVNG_ST_Y",							
			"SVNG_ST_M",
			"LOAN_AMT",								
			"LOAN_BONUS_RPY_AMT",								
			"LOAN_YEARS",								
			"LOAN_MONTHS",								
			"LOAN_YEAR_RATE",								
			"LOAN_ST_Y",						
			"LOAN_ST_M"	
		];
		
		public var rev_School2 = [	
			"SVNG_MNTHLY_AMT",								
			"SVNG_YEARS",								
			"SVNG_MONTHS",								
			"SVNG_YEAR_RATE",								
			"SVNG_ST_Y",							
			"SVNG_ST_M",
		];

		public var rev_School3 = [	
			"LOAN_AMT",								
			"LOAN_BONUS_RPY_AMT",								
			"LOAN_YEARS",								
			"LOAN_MONTHS",								
			"LOAN_YEAR_RATE",								
			"LOAN_ST_Y",						
			"LOAN_ST_M"	
		];
		
		
		
		
		/*
		private var tab_School1 = [
			"COST_EVENT_AMT",								
			"CPTL",																
			"BIRTH_Y",								
			"BIRTH_M"								
		];
		
		private var tab_School2 = [								
			"SVNG_MNTHLY_AMT",								
			"SVNG_YEARS",								
			"SVNG_MONTHS",								
			"SVNG_YEAR_RATE",								
			"SVNG_ST_Y",							
			"SVNG_ST_M"							
		];
		
		private var tab_School3 = [							
			"LOAN_AMT",								
			"LOAN_BONUS_RPY_AMT",								
			"LOAN_YEARS",								
			"LOAN_MONTHS",								
			"LOAN_YEAR_RATE",								
			"LOAN_ST_Y",						
			"LOAN_ST_M"						
		];
		*/
		
		private var tab_SchoolRadio = [
			"child_1_1_0",							
			"child_1_1_1",							
			"child_1_1_2",							
			"child_1_1_4",							
			"child_1_2_0",								
			"child_1_2_1",								
			"child_1_2_2",								
			"child_1_2_4",								
			"child_1_3_0",								
			"child_1_3_1",								
			"child_1_3_2",
			"child_1_3_4",
			"child_1_4_0",								
			"child_1_4_1",								
			"child_1_4_2",								
			"child_1_4_4",								
			"child_1_5_0",								
			"child_1_5_1",								
			"child_1_5_2",																
			"child_1_5_4",																
			"child_1_6_1",								
			"child_1_6_2",								
			"child_1_6_4",								
			"child_2_1_0",							
			"child_2_1_1",							
			"child_2_1_2",							
			"child_2_1_4",							
			"child_2_2_0",								
			"child_2_2_1",								
			"child_2_2_2",								
			"child_2_2_4",								
			"child_2_3_0",								
			"child_2_3_1",								
			"child_2_3_2",								
			"child_2_3_4",								
			"child_2_4_0",								
			"child_2_4_1",								
			"child_2_4_2",								
			"child_2_4_4",								
			"child_2_5_0",								
			"child_2_5_1",								
			"child_2_5_2",								
			"child_2_5_4",								
			"child_2_6_1",
			"child_2_6_2",
			"child_2_6_4",
			"child_3_1_0",							
			"child_3_1_1",							
			"child_3_1_2",							
			"child_3_1_4",							
			"child_3_2_0",								
			"child_3_2_1",								
			"child_3_2_2",								
			"child_3_2_4",								
			"child_3_3_0",								
			"child_3_3_1",								
			"child_3_3_2",								
			"child_3_3_4",								
			"child_3_4_0",								
			"child_3_4_1",								
			"child_3_4_2",								
			"child_3_4_4",								
			"child_3_5_0",								
			"child_3_5_1",								
			"child_3_5_2",								
			"child_3_5_4",								
			"child_3_6_1",
			"child_3_6_2",
			"child_3_6_4"
			
		];
		
		
		
	}
}