package windows 
{
	import configs.GameConfig;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import game.GameData;
	import objects.BallObject;
	
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class GameWindow extends Sprite 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		private const BACKGROUND_ELLIPSE_SIZE:int = 15;
		//--------------------------->	VARIABLES			<---------------------------//
		private var _data:GameData;
		private var _background:Shape;
		private var _score:TextField;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function GameWindow(data:GameData) 
		{
			_data = data;
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function addedToStageHandler(event:Event):void 
		{
			crateWindow();
		}
		
		private function data_updateScoreHandler(event:GameEvent):void 
		{
			updateScore();
		}
		
		private function data_updateFieldHandler(event:GameEvent):void 
		{
			updateField();
		}
		
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function crateWindow():void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			drawBackround();
			
			_score = new TextField();
			addChild(_score);
			
			_data.addEventListener(GameEvent.UPDATE_SCORE, data_updateScoreHandler);
			updateScore();
			
			_data.addEventListener(GameEvent.UPDATE_FIELD, data_updateFieldHandler);
			updateField();
		}
		
		private function drawBackround():void 
		{
			var fieldWidth:uint = GameConfig.BALL_RADIUS * 2 * GameConfig.FIELD_SIZE[0];
			var fieldHeight:uint = GameConfig.BALL_RADIUS * 2 * GameConfig.FIELD_SIZE[1];
			
			_background = new Shape();
			_background.graphics.beginFill(GameConfig.BACKGROUND_COLOR);
			_background.graphics.drawRoundRect(
									0, 0,
									fieldWidth, fieldHeight,
									BACKGROUND_ELLIPSE_SIZE, BACKGROUND_ELLIPSE_SIZE
								);
			_background.graphics.endFill();
			
			_background.x = ( stage.stageWidth - fieldWidth ) / 2;
			_background.y = ( stage.stageHeight - fieldHeight ) / 2;
			
			addChild(_background);
		}
		
		private function updateScore():void 
		{
			_score.text = 'Score: ' + _data.score;
		}
		
		private function updateField():void 
		{
			for (var i:int = 0; i < _data.fieldWidht; i++) 
			{
				for (var j:int = 0; j < _data.fieldHeight; j++) 
				{
					var ball:BallObject = _data.getBallAt(i, j);
					if (!ball)
						continue;
					if (!ball.parent)
						addChild(ball);
					if (ball.readyForDelete)
					{
						if (ball.parent)
							ball.parent.removeChild(ball);
					}
					else
					{
						ball.x = _background.x + GameConfig.BALL_RADIUS * 2 * i;
						ball.y = _background.y + GameConfig.BALL_RADIUS * 2 * j;
					}
				}
			}
		}
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}