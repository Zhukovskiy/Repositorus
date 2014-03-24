package  
{
	import assets.FullscreenPopup;
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	import windows.DartboardPopup;
	import windows.MainWindow;
	import windows.WindowBase;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class Root 
	{
		
		//--------------------------->	STATIC VARIABLES	<---------------------------//
		static private var _instance:Root;
		//--------------------------->	VARIABLES			<---------------------------//
		private var _view:Sprite;
		private var _window:WindowBase;
		private var _players:Vector.<String>;
		private var _score:Dictionary;
		private var _dartboard:DartboardPopup;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function Root() { }
		
		public function init(view:Sprite):void
		{
			_view = view;
			
			newGame();
			
			var fs:FullscreenPopup = new FullscreenPopup();
			_view.addChild(fs);
			fs.fullscreenButton.addEventListener(MouseEvent.CLICK, fullscreenButton_clickHandler);
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function fullscreenButton_clickHandler(event:MouseEvent):void 
		{
			_view.stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		public function showWindow(window:Class):void
		{
			if (_window)
			{
				_view.removeChild(_window);
				_window.clear();
				_window = null;
			}
			
			_window = new window();
			_view.addChildAt(_window, 0);
		}
		
		public function showDartboard(callback:Function):void
		{
			_dartboard = new DartboardPopup();
			_dartboard.setCallback(callback);
			_view.addChild(_dartboard);
		}
		
		public function hideDartboard():void
		{
			_view.removeChild(_dartboard);
			_dartboard = null;
		}
		
		public function addScore(id:uint, value:uint):void
		{
			_score[_players[id]] += value;
		}
		
		public function setScore(pName:String):uint
		{
			return _score[pName];
		}
		
		public function addPlayer(pName:String):void
		{
			_players.push(pName);
			_score[pName] = 0;
		}
		
		public function getPlayeName(id:uint):String
		{
			return _players[id];
		}
		
		public function newGame():void
		{
			_players = new Vector.<String>();
			_score = new Dictionary();
			showWindow(MainWindow);
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		static public function get instance():Root 
		{
			return (_instance) ? _instance : _instance = new Root();
		}
		
		public function get playersNum():uint
		{
			return _players.length;
		}
		
		public function get score():Array
		{
			var result:Array = [];
			for each (var player:String in _players)
			{
				var score:Object = {};
				score[PlayerConsts.PLAYER] = player;
				score[PlayerConsts.SCORE] = _score[player];
				result.push(score);
			}
			return result;
		}
	}

}