package windows 
{
	import assets.MainWindowAsset;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class MainWindow extends WindowBase 
	{
		
		//--------------------------->	STATIC VARIABLES	<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function MainWindow() 
		{
			super(MainWindowAsset);
			
			view.newGameButton.addEventListener(MouseEvent.CLICK, newGameButton_clickHandler);
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function newGameButton_clickHandler(event:MouseEvent):void 
		{
			Root.instance.showWindow(NewGameWindow);
		}
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		override public function clear():void 
		{
			view.newGameButton.removeEventListener(MouseEvent.CLICK, newGameButton_clickHandler);
			super.clear();
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		private function get view():MainWindowAsset
		{
			return _view as MainWindowAsset;
		}
	}

}