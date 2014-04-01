package windows 
{
	import configs.GameConfig;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import game.GameData;
	
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
		private var _gameField:Sprite;
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
			
			_gameField = new Sprite();
			_gameField.x = _background.x;
			_gameField.y = _background.y;
			
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
			_gameField.graphics.clear();
			for (var i:int = 0; i < _data.fieldWidht; i++) 
			{
				for (var j:int = 0; j < _data.fieldHeight; j++) 
				{
					if (_data.getBallAt(i, j) < 0)
						continue;
					var color:uint = GameConfig.BALL_COLORS[_data.getBallAt(i, j)];
					_gameField.graphics.lineStyle(3, color, .1);
					_gameField.graphics.beginFill(color);
					_gameField.graphics.drawCircle(
													GameConfig.BALL_RADIUS + i * GameConfig.BALL_RADIUS * 2,
													GameConfig.BALL_RADIUS + j * GameConfig.BALL_RADIUS * 2,
													GameConfig.BALL_RADIUS
												);
					_gameField.graphics.endFill();
				}
			}
			_gameField.buttonMode = true;
			addChild(_gameField);
		}
		
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		public function get gameField():Sprite 
		{
			return _gameField;
		}
		
	}

}