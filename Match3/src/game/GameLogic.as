package game 
{
	import configs.GameConfig;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	import objects.BallObject;
	import windows.GameWindow;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class GameLogic 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		private var _view:GameWindow;
		private var _data:GameData;
		private var _selected:Vector.<BallObject>;
		private var _math:Match3Math;
		private var _lockControl:Boolean = true;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function GameLogic(view:GameWindow, data:GameData) 
		{
			_view = view;
			_data = data;
			
			_selected = new Vector.<BallObject>();
			_math = new Match3Math(_data);
			
			_view.addEventListener(MouseEvent.CLICK, view_clickHandler);
			
			checkForMatch();
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function view_clickHandler(event:MouseEvent):void 
		{
			if (!(event.target is BallObject))
				return;
			
			selectBall(event.target as BallObject);
		}
		
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function selectBall(ball:BallObject):void 
		{
			if (_lockControl)
				return;
				
			if (_selected.length == 1 && _selected[0] === ball)
			{
				_selected[0].removeSelection();
				_selected.pop();
			}
			else if (_selected.length == 0)
			{
				_selected[0] = ball;
				_selected[0].addSelection();
			}
			else if (_math.isNeighbors(_selected[0], ball))
			{
				_selected[1] = ball;
				swapSelectedBalls();
			}
		}
		
		private function swapSelectedBalls():void 
		{
			_lockControl = true;
				
			_selected[0].removeSelection();
			
			swapBalls(_selected[0], _selected[1]);
			
			checkForMatch();
		}
		
		private function swapBalls(ballOne:BallObject, ballTwo:BallObject):void 
		{
			var position:Point = new Point(ballOne.position.x, ballOne.position.y);
			_data.moveBallTo(ballOne, ballTwo.position.x, ballTwo.position.y);
			_data.moveBallTo(ballTwo, position.x, position.y);
		}
		
		private function checkForMatch():void 
		{
			_data.updateField();
			
			setTimeout(function():void
			{
				if (_data.fillFreeSpaces() || _math.findMatch())
				{
					checkForMatch();
					_selected = new Vector.<BallObject>();
				}
				else
				{
					if (_selected.length > 0)
					{
						swapBalls(_selected[0], _selected[1]);
						_data.updateField();
						_selected = new Vector.<BallObject>();
					}
					_lockControl = false;
				}
			}, GameConfig.GAME_SPEED);
		}
		
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}