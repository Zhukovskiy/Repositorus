package ui 
{
	import assets.PlayerSlotAsset;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class PlayerSlot extends PlayerSlotAsset 
	{
		
		//--------------------------->	STATIC VARIABLES	<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		private var _id:uint;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function PlayerSlot(id:uint) 
		{
			_id = id;
			
			TitleTF.text = 'Player ' + _id + ':';
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			nameTF.addEventListener(Event.CHANGE, nameTF_changeHandler);
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		private function nameTF_changeHandler(event:Event):void 
		{
			if (nameTF.length > 0)
				hintTF.visible = false;
			else 
				hintTF.visible = true;
		}
		
		private function addedToStageHandler(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			stage.focus = nameTF;
			nameTF.text = '';
			
			x = 10;
			y = 50 + (_id - 1) * 30;
		}
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		public function clear():void
		{
			nameTF.removeEventListener(Event.CHANGE, nameTF_changeHandler);
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		public function get id():uint 
		{
			return _id;
		}
		
		public function get pName():String 
		{
			return (nameTF.length > 0) ? nameTF.text : 'Player ' + _id;
		}
		
	}

}