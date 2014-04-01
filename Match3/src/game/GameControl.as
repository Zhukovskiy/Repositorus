package game 
{
	import configs.GameConfig;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	import windows.GameWindow;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class GameControl 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		private var _view:GameWindow;
		private var _data:GameData;
		private var _selected:Vector.<Point>;
		private var _math:Match3Math;
		private var _lockControl:Boolean = true;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function GameControl(view:GameWindow, data:GameData) 
		{
			_view = view;
			_data = data;
			
			_selected = new Vector.<Point>();
			_math = new Match3Math(_data);
			
			_view.gameField.addEventListener(MouseEvent.MOUSE_DOWN, gameField_mouseDownHandler);
			_view.gameField.addEventListener(MouseEvent.MOUSE_UP, gameField_mouseUpHandler);
			
			checkForMatch();
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function gameField_mouseUpHandler(event:MouseEvent):void 
		{
			selectSecondBall(createPointMousePosition(event.localX, event.localY));
		}
		
		private function gameField_mouseDownHandler(event:MouseEvent):void 
		{
			selectFirstBall(createPointMousePosition(event.localX, event.localY));
		}
		
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function selectFirstBall(ball:Point):void 
		{
			if (_lockControl)
				return;
			
			_selected[0] = ball;
		}
		
		private function selectSecondBall(ball:Point):void 
		{
			if (_lockControl)
				return;
				
			if (_selected.length > 0 && _selected[0] != null && (_selected[0].x != ball.x || _selected[0].y != ball.y) && _math.isNeighbors(_selected[0], ball))
			{
				_selected[1] = ball;
				swapSelectedBalls();
			}
			else
			{
				_selected = new Vector.<Point>();
			}
		}
		
		private function createPointMousePosition(mouseX:Number, mouseY:Number):Point
		{
			return new Point(
								int(mouseX / (GameConfig.BALL_RADIUS * 2)),
								int(mouseY / (GameConfig.BALL_RADIUS * 2))
							);
		}
		
		private function swapSelectedBalls():void 
		{
			_lockControl = true;
			
			swapBalls(_selected[0], _selected[1]);
			
			checkForMatch();
		}
		
		private function swapBalls(ballOne:Point, ballTwo:Point):void 
		{
			var typeOne:uint = _data.getBallAt(ballOne.x, ballOne.y);
			var typeTwo:uint = _data.getBallAt(ballTwo.x, ballTwo.y);
			
			_data.setBallTo(ballTwo.x, ballTwo.y, typeOne);
			_data.setBallTo(ballOne.x, ballOne.y, typeTwo);
		}
		
		private function checkForMatch():void 
		{
			_data.updateField();
			
			setTimeout(function():void
			{
				if (_math.fillFreeSpaces() || _math.findMatch())
				{
					checkForMatch();
					_selected = new Vector.<Point>();
				}
				else
				{
					if (_selected.length > 0)
					{
						swapBalls(_selected[0], _selected[1]);
						_data.updateField();
						_selected = new Vector.<Point>();
						_data.score -= GameConfig.USELESS_TURN_PENALTY;
					}
					if (_math.checkForStalemate())
						checkForMatch();
					else
						_lockControl = false;
				}
			}, GameConfig.GAME_SPEED);
		}
		
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}