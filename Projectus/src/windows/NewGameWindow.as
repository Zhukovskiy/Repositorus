package windows 
{
	import assets.NewGameWindowAsset;
	import assets.PlayerSlotAsset;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import ui.PlayerSlot;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class NewGameWindow extends WindowBase 
	{
		
		//--------------------------->	STATIC VARIABLES	<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		private var _players:Vector.<PlayerSlot>;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function NewGameWindow() 
		{
			super(NewGameWindowAsset);
			view.addPlayerButton.addEventListener(MouseEvent.CLICK, addPlayerButton_clickHandler);
			view.removePlayerButton.addEventListener(MouseEvent.CLICK, removePlayerButton_clickHandler);
			view.startGameButton.addEventListener(MouseEvent.CLICK, startGameButton_clickHandler);
			
			setButtonSelectable(view.removePlayerButton, false);
			setButtonSelectable(view.startGameButton, false);
			_players = new Vector.<PlayerSlot>();
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function startGameButton_clickHandler(event:MouseEvent):void 
		{
			for each (var slot:PlayerSlot in _players) 
			{
				Root.instance.addPlayer(slot.pName);
			}
			Root.instance.showWindow(GameWindow);
		}
		
		private function removePlayerButton_clickHandler(event:MouseEvent):void 
		{
			var slot:PlayerSlot = _players.pop();
			slot.clear();
			removeChild(slot);
			
			if (_players.length == 0)
			{
				setButtonSelectable(view.removePlayerButton, false);
				setButtonSelectable(view.startGameButton, false);
			}
		}
		
		private function addPlayerButton_clickHandler(event:MouseEvent):void 
		{
			var slot:PlayerSlot = new PlayerSlot(_players.length + 1);
			addChild(slot);
			_players.push(slot);
			
			setButtonSelectable(view.removePlayerButton, true);
			setButtonSelectable(view.startGameButton, true);
		}
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function setButtonSelectable(button:Sprite, value:Boolean):void
		{
			if (!button)
				return;
				
			button.mouseEnabled = value;
			button.alpha = (value) ? 1 : .5;
		}
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		override public function clear():void 
		{
			view.addPlayerButton.removeEventListener(MouseEvent.CLICK, addPlayerButton_clickHandler);
			view.removePlayerButton.removeEventListener(MouseEvent.CLICK, removePlayerButton_clickHandler);
			view.startGameButton.removeEventListener(MouseEvent.CLICK, startGameButton_clickHandler);

			super.clear();
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		private function get view():NewGameWindowAsset
		{
			return _view as NewGameWindowAsset;
		}
	}

}