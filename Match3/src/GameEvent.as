package  
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class GameEvent extends Event 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		public static const UPDATE_SCORE:String = 'GameEventUpdateScore';
		public static const UPDATE_FIELD:String = 'GameEventUpdateField';
		//--------------------------->	VARIABLES			<---------------------------//
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}