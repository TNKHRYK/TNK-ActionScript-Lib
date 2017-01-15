package classes.tnk.pv3d 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.BasicView;
	import org.papervision3d.materials.BitmapAssetMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.events.*;
	import org.papervision3d.view.Viewport3D;
	/**
	 * ...
	 * @author HiroyukiTanaka/MaxMouse
	 */
	public class ObjectDragRotation extends EventDispatcher
	{
		private const VV:Number = 0.5;
		
		private var _target:Cube;
		private var _viewPort:Viewport3D;
		private var _camera:Camera3D;
		
		private var rx:Number = VV;
		private var ry:Number = VV;
		private var _targetX:Number = VV;
		private var _targetY:Number = VV;
		
		private var _mouseX:Number;
		private var _mouseY:Number;
		
		private var _isMouseDown:Boolean = false;
		
		

		/**
		* ドラッグ回転準備 
		* <p/>
		* @param	target			ターゲット
		* <p/>
		* @param	viewPort		viewPort
		* <p/>
		* @param	camera			カメラ
		* <p/>
		* @param	isAlways		ドラッグしなくても常に回っているか？
		* <p/>
		*/
		public function ObjectDragRotation(target:Cube , viewPort:Viewport3D ,camera:Camera3D = null, isAlways:Boolean = false) 
		{
			_viewPort = viewPort;
			_target = target;
			_camera = camera;
		}
		
		/*
		 *ドラッグ回転スタート 
		 * 
		 */
		public function startRotation():void {
			_viewPort.addEventListener(Event.ENTER_FRAME , enterFrameHandler);
			_target.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS , dragStartHandler);
			_target.addEventListener(InteractiveScene3DEvent.OBJECT_RELEASE , dragEndHandler);
			_target.addEventListener(InteractiveScene3DEvent.OBJECT_RELEASE_OUTSIDE , dragEndHandler);
			_target.addEventListener(InteractiveScene3DEvent.OBJECT_OUT , dragEndHandler);
			_target.addEventListener(InteractiveScene3DEvent.OBJECT_MOVE , dragMoveHandler);
			
			//ハンドカーソル
			_target.addEventListener(InteractiveScene3DEvent.OBJECT_OVER, function(e) {
				_viewPort.containerSprite.buttonMode = true;
			})

			_target.addEventListener(InteractiveScene3DEvent.OBJECT_OUT, function(e) {
				_viewPort.containerSprite.buttonMode = false;
			})
		}
		
		
		/*
		 *ドラッグ回転一時停止 
		 */
		public function stopRotation():void {

		}
		
		
		/*
		 *ドラッグ回転再開 
		 */
		public function playRotation():void {

		}
		
		/*
		 *スピン 
		 */
		public function spin():void {
			_targetX += 100;
			_targetY += 100;
			
		}
		
		/*
		 *ドラッグ回転終了 
		 */
		public function endRotation():void {
			
			_viewPort.removeEventListener(Event.ENTER_FRAME , enterFrameHandler);
			_target.removeEventListener(InteractiveScene3DEvent.OBJECT_PRESS , dragStartHandler);
			_target.removeEventListener(InteractiveScene3DEvent.OBJECT_RELEASE , dragEndHandler);
			_target.removeEventListener(InteractiveScene3DEvent.OBJECT_RELEASE_OUTSIDE , dragEndHandler);
			_target.removeEventListener(InteractiveScene3DEvent.OBJECT_OUT , dragEndHandler);
			_target.removeEventListener(InteractiveScene3DEvent.OBJECT_MOVE , dragMoveHandler);
			
		}
		
		
		/*
		 * 回転制御 
		 */
		private function enterFrameHandler(e:Event):void {
			
			var vvx:Number = (_targetX - rx)*0.05;
			var vvy:Number = (_targetY - ry)*0.05;
			rx += vvx;
			ry += vvy;

			
			//常にまわってる
			if (!_isMouseDown && Math.abs(vvx) < VV) {
				
				if (vvx > 0) {
					_targetX += VV;
				}else {
					_targetX -= VV;
				}
			}
			
			if (!_isMouseDown && Math.abs(vvy) < VV) {
				if (vvy > 0) {
					_targetY+=VV;
				}else {
					_targetY+=VV;
				}	
			}
					
			
			_target.rotationY = -rx;
			_target.rotationX = -ry;
			
			
			//Mainに通知
			dispatchEvent(new Event("CHANGE"));
			
		}
		
		private function dragStartHandler(e:InteractiveScene3DEvent):void {
			//とめる
			_targetX = -_target.rotationY;
			rx = _targetX;
			_mouseX = _viewPort.mouseX;
			
			_targetY = -_target.rotationX;
			ry = _targetY;
			_mouseY = _viewPort.mouseY;
			
			_isMouseDown = true;
			
		}
		
		private function dragEndHandler(e:InteractiveScene3DEvent):void {

			_isMouseDown = false;
		}
		
		private function dragMoveHandler(e:InteractiveScene3DEvent):void {
		
			if (_isMouseDown) {
				
				var dx:Number = _viewPort.mouseX - _mouseX;
				_targetX += dx;
				_mouseX =  _viewPort.mouseX;
				
				var dy:Number = _viewPort.mouseY - _mouseY;
				_targetY += dy;
				_mouseY =  _viewPort.mouseY;
				
			}
		}
		
		
		
		
	}
	
}