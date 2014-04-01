package game 
{
	import configs.GameConfig;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class Match3Math 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		private const CHAIN_MAP:Array = [[1, 0], [0, 1]];
		private const SIDES:Array = [	[ -1, -1, 1], 	[ 0, -1, 2], 	[ 1, -1, 4],
										[ -1, 0, 128], 					[ 1, 0, 8],
										[ -1, 1, 64], 	[ 0, 1, 32], 	[ 1, 1, 16],
									];
		private const BAD_COMBINATIONS:Array = [	0, 1, 2, 4, 8, 16, 32, 64, 128, 
													3, 6, 12, 24, 48, 96, 192, 129, 
													68, 17,
													130, 10, 40, 160,
													146, 74, 164, 41
												];
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
		public function isNeighbors(ballOne:Point, ballTwo:Point):Boolean
		{
			if (ballOne.x == ballTwo.x && (ballOne.y == ballTwo.y - 1 || ballOne.y == ballTwo.y + 1))
				return true;
			if (ballOne.y == ballTwo.y && (ballOne.x == ballTwo.x - 1 || ballOne.x == ballTwo.x + 1))
				return true;
			return false;
		}
		
		public function findMatch():Boolean
		{
			var result:Boolean = false;
			var i:int;
			var j:int;
			
			_checkGrid = new Vector.<Vector.<Boolean>>();
			for (i = 0; i < _data.fieldWidht; i++) 
			{
				_checkGrid[i] = new Vector.<Boolean>();
				for (j = 0; j < _data.fieldHeight; j++) 
				{
					_checkGrid[i][j] = false;
				}
			}
			
			for (i = 0; i < _data.fieldWidht; i++) 
			{
				for (j = 0; j < _data.fieldHeight; j++) 
				{
					if (_checkGrid[i][j])
						continue;
						
					var ball:Point = new Point(i, j);
					var total:uint;
					
					for each (var direction:Array in CHAIN_MAP)
					{
						total = makeChain(ball, _data.getBallAt(i, j), direction[0], direction[1]);
						if (total >= GameConfig.MATCH_LENGTH)
						{
							_data.score += total * total;
							result = true;
						}
					}
				}
			}
			
			return result;
		}
		
		private function makeChain(ball:Point, color:uint, moveHor:Number, moveVer:Number, total:uint = 1):uint
		{
			if (_data.getBallAt(ball.x, ball.y) != color)
				return total - 1;
			
			var nextX:uint = ball.x + moveHor;
			var nextY:uint = ball.y + moveVer;
			
			if (nextX < _data.fieldWidht && nextY < _data.fieldHeight)
				total = makeChain(new Point(nextX, nextY), color, moveHor, moveVer, total + 1);
			
			if (total >= GameConfig.MATCH_LENGTH)
			{
				_checkGrid[ball.x][ball.y] = true;
				_data.deleteBallFrom(ball.x, ball.y);
			}
			return total;
		}
		
		public function fillFreeSpaces():Boolean 
		{
			var result:Boolean = false;
			
			for (var i:int = 0; i < _data.fieldWidht; i++) 
			{
				breakFor: for (var j:int = _data.fieldHeight - 1; j >= 0; j--) 
				{
					if (_data.isEmpty(i,j))
					{
						_data.removeElement(i, j);
						_data.addElement(i);
						
						result = true;
						
						break breakFor;
					}
				}
			}
			
			return result;
		}
		
		public function checkForStalemate():Boolean
		{
			for (var i:int = 0; i < _data.fieldWidht; i++) 
			{
				for (var j:int = 0; j < _data.fieldHeight; j++) 
				{
					var total:uint = 0;
					var currentColor:uint = _data.getBallAt(i, j);
					for each (var corner:Array in SIDES)
					{
						var cornerX:int = (i + corner[0]);
						var cornerY:int = (j + corner[1]);
						if (cornerX < 0 || cornerX >= _data.fieldWidht || cornerY < 0 || cornerY >= _data.fieldHeight)
							continue;
						if (_data.getBallAt(cornerX, cornerY) == currentColor)
							total += corner[2];
					}
					if (BAD_COMBINATIONS.lastIndexOf(total) == -1)
					{		
						return false;
					}
				}
			}
			randomize();
			
			return true;
		}
		
		private function randomize():void 
		{
			var balls:Vector.<uint> = new Vector.<uint>();
			var i:int;
			var j:int;
			for (i = 0; i < _data.fieldWidht; i++) 
			{
				for (j = 0; j < _data.fieldHeight; j++) 
				{
					balls.push(_data.getBallAt(i,j));
				}
			}
			for (i = 0; i < _data.fieldWidht; i++) 
			{
				for (j = 0; j < _data.fieldHeight; j++) 
				{
					var randomBall:uint = Math.random() * balls.length;
					_data.setBallTo(i, j, balls[randomBall]);
					balls.splice(randomBall, 1);
				}
			}
		}
		
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}