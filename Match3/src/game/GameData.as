package game 
{
	import configs.GameConfig;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class GameData extends EventDispatcher
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		private const NO_BALL:int = -1;
		static public const RANDOM:int = -1;
		//--------------------------->	VARIABLES			<---------------------------//
		private var _field:Vector.<Vector.<int>>;
		private var _score:uint;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function GameData(sizeX:uint, sizeY:uint) 
		{
			createNewField(sizeX, sizeY);
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function createNewField(sizeX:uint, sizeY:uint):void 
		{
			_field = new Vector.<Vector.<int>>();
			for (var i:int = 0; i < sizeX; i++) 
			{
				_field[i] = new Vector.<int>();
				for (var j:int = 0; j < sizeY; j++) 
				{
					_field[i][j] = NO_BALL;
					setBallTo(i, j);
				}
			}
			updateField();
		}
		
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		public function getBallAt(posX:uint, posY:uint):int
		{
			if (_field.length <= posX || _field[posX].length <= posY)
				throw Error('Error! GameData -> Incorrect ball position! Position: [' + posX + ', ' + posY + ']');
			
			return _field[posX][posY];
		}
		
		public function setBallTo(posX:uint, posY:uint, type:int = RANDOM):void
		{
			if (_field.length <= posX || _field[posX].length <= posY)
				throw Error('Error! GameData -> Incorrect ball position! Position: [' + posX + ', ' + posY + ']');
				
			if (type == RANDOM || type < 0)
				_field[posX][posY] = int(Math.random() * GameConfig.BALL_COLORS.length);
			else
				_field[posX][posY] = type;
		}
		
		public function deleteBallFrom(posX:uint, posY:uint):void 
		{
			if (_field.length <= posX || _field[posX].length <= posY)
				throw Error('Error! GameData -> Incorrect ball position! Position: [' + posX + ', ' + posY + ']');
				
			_field[posX][posY] = NO_BALL;
		}
		
		public function updateField():void 
		{
			dispatchEvent(new GameEvent(GameEvent.UPDATE_FIELD));
		}
		
		public function isEmpty(posX:uint, posY:uint):Boolean
		{
			if (_field.length <= posX || _field[posX].length <= posY)
				throw Error('Error! GameData -> Incorrect ball position! Position: [' + posX + ', ' + posY + ']');
			
			return (_field[posX][posY] == NO_BALL);
		}
		
		public function removeElement(col:uint, elem:uint):void 
		{
			if (_field.length <= col || _field[col].length <= elem)
				throw Error('Error! GameData -> Incorrect ball position! Position: [' + col + ', ' + elem + ']');
				
			_field[col].splice(elem, 1);
		}
		
		public function addElement(col:uint):void 
		{
			if (_field.length <= col)
				throw Error('Error! GameData -> Incorrect column! Column: ' + col);
			
			_field[col].unshift(NO_BALL);
			setBallTo(col, 0);
		}
		
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		public function get score():uint 
		{
			return _score;
		}
		
		public function set score(value:uint):void 
		{
			_score = value;
			
			if (_score < 0)
				_score = 0;
			
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