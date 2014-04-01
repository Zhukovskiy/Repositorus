package configs 
{
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class GameConfig 
	{
		
		//--------------------------->	CONSTS				<---------------------------//
		public static const BACKGROUND_COLOR:uint = 0xC0C0C0;
		
		public static const BALL_COLORS:Array = [0x00FF40, 0x004080, 0x800040, 0x408080];
		
		public static const FIELD_SIZE:Array = [7, 7];
		
		public static const BALL_RADIUS:uint = 25;
		
		public static const GAME_SPEED:uint = 100;
		
		public static const MATCH_LENGTH:uint = 3;
		
		public static const USELESS_TURN_PENALTY:uint = 10;
		//--------------------------->	VARIABLES			<---------------------------//
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function GameConfig() {}
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		static public function getBallTypesAmount():uint
		{
			return BALL_COLORS.length;
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}