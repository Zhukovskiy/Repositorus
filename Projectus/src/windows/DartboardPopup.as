package windows 
{
	import assets.DartboardPopupAsset;
	import assets.DartInBoard;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class DartboardPopup extends WindowBase 
	{
		//--------------------------->	STATIC VARIABLES	<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		private var _callback:Function;
		private var _score:uint;
		private var _darts:uint = 3;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function DartboardPopup() 
		{
			super(DartboardPopupAsset);
			view.closeButton.addEventListener(MouseEvent.CLICK, closeButton_clickHandler);
			view.applyButton.addEventListener(MouseEvent.CLICK, applyButton_clickHandler);
			view.clickZone.addEventListener(MouseEvent.CLICK, clickZone_clickHandler);
			
			showDartAmount();
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function clickZone_clickHandler(event:MouseEvent):void 
		{
			var dart:DartInBoard = new DartInBoard();
			dart.mouseEnabled = false;
			dart.x = event.localX;
			dart.y = event.localY;
			view.clickZone.addChild(dart);
			
			addScore(event.localX, event.localY);
			
			_darts --;
			showDartAmount();
		}
		
		private function addScore(localX:Number, localY:Number):void 
		{
			var vector:Point = new Point(localX - 300, localY - 300);
			
			var angle:Number = Math.atan2(vector.y, vector.x) * 180 / Math.PI + 99;
			if (angle < 0)
				angle += 360;
			var radius:Number = vector.length;
			
			for each (var part:Object in DartboardMap.MAP)
			{
				if (radius >= part.minRadius && radius <= part.maxRadius && angle >= part.minAngle && angle <= part.maxAngle)
				{
					_score += part.score;
					break;
				}
			}
		}
		
		private function applyButton_clickHandler(event:MouseEvent):void 
		{
			_callback.apply(null, [_score]);
			Root.instance.hideDartboard();
		}
		
		private function closeButton_clickHandler(event:MouseEvent):void 
		{
			Root.instance.hideDartboard();
		}
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function showDartAmount():void 
		{
			if (_darts > 0)
				view.dartAmount.gotoAndStop(_darts);
			else
				view.dartAmount.visible = false;
		}
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		override public function clear():void 
		{
			view.closeButton.removeEventListener(MouseEvent.CLICK, closeButton_clickHandler);
			view.applyButton.removeEventListener(MouseEvent.CLICK, applyButton_clickHandler);
			view.clickZone.removeEventListener(MouseEvent.CLICK, clickZone_clickHandler);
			
			super.clear();
		}
		
		public function setCallback(callback:Function):void
		{
			_callback = callback;
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		private function get view():DartboardPopupAsset
		{
			return _view as DartboardPopupAsset;
		}
	}

}