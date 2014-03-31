package game 
{
	import flash.display.Sprite;
	import windows.GameWindow;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class Root 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		static private var _instance:Root;
		//--------------------------->	VARIABLES			<---------------------------//
		private var _stage:Sprite;
		private var _window:GameWindow;
		private var _data:GameData;
		private var _game:GameLogic;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function Root() {}
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		public function init(stage:Sprite) : void
		{
			_stage = stage;
			
			_data = new GameData();
			
			_window = new GameWindow(_data);
			_stage.addChild(_window);
			
			_game = new GameLogic(_window, _data);
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		static public function get instance():Root 
		{
			return (_instance) ? _instance : _instance = new Root();
		}
		
	}

}