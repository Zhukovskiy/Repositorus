package game 
{
	import configs.GameConfig;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import objects.BallObject;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class GameData extends EventDispatcher
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		private var _field:Vector.<Vector.<BallObject>>;
		private var _score:uint;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function GameData() 
		{
			createNewField();
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function createNewField():void 
		{
			_field = new Vector.<Vector.<BallObject>>();
			for (var i:int = 0; i < GameConfig.FIELD_SIZE[0]; i++) 
			{
				_field[i] = new Vector.<BallObject>();
				for (var j:int = 0; j < GameConfig.FIELD_SIZE[1]; j++) 
				{
					_field[i][j] = new BallObject(i, j);
				}
			}
			updateField();
		}
		
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		public function getBallAt(posX:uint, posY:uint):BallObject
		{
			if (_field.length <= posX || _field[posX].length <= posY)
				throw Error('Error! GameData -> Incorrect ball position! Position: [' + posX + ', ' + posY + ']');
			
			return _field[posX][posY];
		}
		
		public function moveBallTo(ball:BallObject, posX:uint, posY:uint):void
		{
			if (!ball || _field.length <= posX || _field[posX].length <= posY)
				throw Error('Error! GameData -> Incorrect move ball parameters!');
			
			_field[posX][posY] = ball;
			ball.updatePosition(posX, posY);
		}
		
		public function updateField():void 
		{
			dispatchEvent(new GameEvent(GameEvent.UPDATE_FIELD));
		}
		
		public function fillFreeSpaces():Boolean 
		{
			var result:Boolean = false;
			
			for (var i:int = 0; i < _field.length; i++) 
			{
				/*for (var j:int = 0; j < GameConfig.FIELD_SIZE[1]; j++) 
				{
					if (_field[i][j].readyForDelete) 
					{
						_field[i][j] = new BallObject(i, j);
						
						result = true;
					}
				}*/
				var emptyPoint:Point;
				for (var j:int = _field[i].length - 1; j >= 0; j--) 
				{
					if (_field[i][j].readyForDelete)
					{
						if (!emptyPoint)
							emptyPoint = new Point(_field[i][j].position.x, _field[i][j].position.y);
						_field[i][j] = null;
					}
					else if (emptyPoint)
					{
						_field[i][j].updatePosition(emptyPoint.x, emptyPoint.y);
						emptyPoint.y -= 1;
						_field[i][j] = null;
					}
				}
			}
			
			return result;
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		public function get score():uint 
		{
			return _score;
		}
		
		public function set score(value:uint):void 
		{
			if (value < 0)
				return;
				
			_score = value;
			dispatchEvent(new GameEvent(GameEvent.UPDATE_SCORE));
		}
		
		public function get fieldWidht():uint
		{
			return _field.length;
		}
		
		public function get fieldHeight():uint
		{
			if (_field.length < 1)
				return 0;
			return _field[0].length;
		}
	}

}