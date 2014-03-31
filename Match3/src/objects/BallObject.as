package objects 
{
	import configs.GameConfig;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class BallObject extends Sprite 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		static private const RANDOM_TYPE:int = -1;
		static private const GLOW_COLOR:uint = 0xFF00FF;
		//--------------------------->	VARIABLES			<---------------------------//
		private var _color:uint;
		private var _position:Point;
		private var _readyForDelete:Boolean = false;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function BallObject(posX:uint, posY:uint, type:int = RANDOM_TYPE ) 
		{
			if (type != RANDOM_TYPE && (type < 0 || type >= GameConfig.getBallTypesAmount()))
				throw Error('Error! BallObject.as -> Incorrect ball type! Type: ' + type);
			
			if (type == RANDOM_TYPE)
				_color = GameConfig.BALL_COLORS[ int( Math.random() * GameConfig.getBallTypesAmount() ) ];
			else
				_color = GameConfig.BACKGROUND_COLOR[type];
				
			updatePosition(posX, posY);
			drawBall();
			
			buttonMode = true;
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function drawBall():void 
		{
			graphics.lineStyle(0, 0, 0);
			graphics.beginFill(0xFFFFFF, 0);
			graphics.drawRect(0, 0, GameConfig.BALL_RADIUS * 2, GameConfig.BALL_RADIUS * 2);
			graphics.endFill();
			
			graphics.lineStyle(3, _color, .5);
			graphics.beginFill(_color);
			graphics.drawCircle(GameConfig.BALL_RADIUS, GameConfig.BALL_RADIUS, GameConfig.BALL_RADIUS);
			graphics.endFill();
		}
		
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		public function updatePosition(posX:uint, posY:uint):void 
		{
			_position = new Point(posX, posY);
		}
		
		public function addSelection():void
		{
			filters = [new GlowFilter(GLOW_COLOR, 1, 10, 10, 10, 1, true)];
		}
		
		public function removeSelection():void
		{
			filters = [];
		}
		
		public function deleteBall():void
		{
			_readyForDelete = true;
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		public function get position():Point 
		{
			return _position;
		}
		
		public function get readyForDelete():Boolean 
		{
			return _readyForDelete;
		}
		
		public function get color():uint 
		{
			return _color;
		}
		
	}

}