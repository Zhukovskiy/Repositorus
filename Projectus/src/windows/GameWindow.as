package windows 
{
	import assets.GameWindowAsset;
	import fl.data.DataProvider;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class GameWindow extends WindowBase 
	{
		
		//--------------------------->	STATIC VARIABLES	<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		private var _turn:uint = 0;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function GameWindow() 
		{
			super(GameWindowAsset);
			view.mainMenuButton.addEventListener(MouseEvent.CLICK, mainMenuButton_clickHandler);
			view.scoreTF.addEventListener(Event.CHANGE, scoreTF_changeHandler);
			view.addScoreButton.addEventListener(MouseEvent.CLICK, addScoreButton_clickHandler);
			view.dartboardButton.addEventListener(MouseEvent.CLICK, dartboardButton_clickHandler);
			
			initGrid();
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function nextTurn():void 
		{
			view.playerTF.text = Root.instance.getPlayeName(_turn);
			view.scoreboardDG.selectedIndex = _turn;
			
			view.scoreTF.text = '';
			stage.focus = view.scoreTF;
			view.hintTF.visible = true;
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function dartboardButton_clickHandler(event:MouseEvent):void 
		{
			Root.instance.showDartboard(dartboardCallback);
		}
		
		private function addedToStageHandler(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			nextTurn();
		}
		
		private function addScoreButton_clickHandler(event:MouseEvent):void 
		{
			if (view.scoreTF.text == '' || int(view.scoreTF.text).toString() != view.scoreTF.text)
				return;
			
			Root.instance.addScore(_turn, int(view.scoreTF.text));
			updateGrid();
				
			_turn = (_turn < Root.instance.playersNum - 1) ? _turn + 1 : 0;
			
			nextTurn();
		}
		
		private function scoreTF_changeHandler(event:Event):void 
		{
			if (view.scoreTF.text != '')
				view.hintTF.visible = false;
			else
				view.hintTF.visible = true;
		}
		
		private function mainMenuButton_clickHandler(event:MouseEvent):void 
		{
			Root.instance.newGame();
		}
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		private function dartboardCallback(score:uint):void
		{
			view.scoreTF.text = score.toString();
		}
		
		private function initGrid():void 
		{
			view.scoreboardDG.width = 200;
			view.scoreboardDG.columns = [PlayerConsts.PLAYER, PlayerConsts.SCORE];
			view.scoreboardDG.getColumnAt(0).width = 100;
			view.scoreboardDG.getColumnAt(1).width = 100;
			view.scoreboardDG.mouseChildren = false;
			
			updateGrid();
		}
		
		private function updateGrid():void
		{
			view.scoreboardDG.dataProvider = new DataProvider(Root.instance.score);
			view.scoreboardDG.rowCount = Root.instance.score.length;
		}
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		override public function clear():void 
		{
			view.mainMenuButton.removeEventListener(MouseEvent.CLICK, mainMenuButton_clickHandler);
			view.scoreTF.removeEventListener(Event.CHANGE, scoreTF_changeHandler);
			view.addScoreButton.removeEventListener(MouseEvent.CLICK, addScoreButton_clickHandler);
			view.dartboardButton.removeEventListener(MouseEvent.CLICK, dartboardButton_clickHandler);
			
			super.clear();
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		private function get view():GameWindowAsset
		{
			return _view as GameWindowAsset;
		}
	}

}