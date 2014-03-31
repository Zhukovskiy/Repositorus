package game 
{
	import configs.GameConfig;
	import objects.BallObject;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class Match3Math 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		private var _data:GameData;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function Match3Math(data:GameData) 
		{
			_data = data;
		}
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private var _checkGrid:Vector.<Vector.<Boolean>>;
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		public function isNeighbors(ballOne:BallObject, ballTwo:BallObject):Boolean
		{
			if (ballOne.position.x == ballTwo.position.x && (ballOne.position.y == ballTwo.position.y - 1 || ballOne.position.y == ballTwo.position.y + 1))
				return true;
			if (ballOne.position.y == ballTwo.position.y && (ballOne.position.x == ballTwo.position.x - 1 || ballOne.position.x == ballTwo.position.x + 1))
				return true;
			return false;
		}
		
		public function findMatch():Boolean
		{
			var result:Boolean = false;
			var i:int;
			var j:int;
			
			_checkGrid = new Vector.<Vector.<Boolean>>();
			for (i = 0; i < GameConfig.FIELD_SIZE[0]; i++) 
			{
				_checkGrid[i] = new Vector.<Boolean>();
				for (j = 0; j < GameConfig.FIELD_SIZE[1]; j++) 
				{
					_checkGrid[i][j] = false;
				}
			}
			
			for (i = 0; i < GameConfig.FIELD_SIZE[0]; i++) 
			{
				for (j = 0; j < GameConfig.FIELD_SIZE[1]; j++) 
				{
					if (_checkGrid[i][j])
						continue;
						
					var ball:BallObject = _data.getBallAt(i, j);
					if (ball)
					{
						if (makeChain(ball, ball.color, 1, 0) >= GameConfig.MATCH_LENGTH)
							result = true;
						if (makeChain(ball, ball.color, 0, 1) >= GameConfig.MATCH_LENGTH)
							result = true;
					}
				}
			}
			
			return result;
		}
		
		private function makeChain(ball:BallObject, color:uint, moveHor:Number, moveVer:Number, total:uint = 1):uint
		{
			if (!ball || ball.color != color)
				return total - 1;
			
			var nextX:uint = ball.position.x + moveHor;
			var nextY:uint = ball.position.y + moveVer;
			
			if (nextX < _data.fieldWidht && nextY < _data.fieldHeight)
				total = makeChain(_data.getBallAt(nextX, nextY), color, moveHor, moveVer, total + 1);
			
			if (total >= GameConfig.MATCH_LENGTH)
			{
				_checkGrid[ball.position.x][ball.position.y] = true;
				ball.deleteBall();
			}
			return total;
		}
		
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}