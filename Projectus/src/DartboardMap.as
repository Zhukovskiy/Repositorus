package  
{
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class DartboardMap 
	{
		
		//--------------------------->	STATIC VARIABLES	<---------------------------//
		static public const MAP:Array = 
		[
			/*Center or miss*/
			{minAngle: 0, 	maxAngle: 360, 	minRadius: 0, 	maxRadius: 8, 		score: 50},
			{minAngle: 0, 	maxAngle: 360, 	minRadius: 8, 	maxRadius: 21, 		score: 25 },
			{minAngle: 0, 	maxAngle: 360, 	minRadius: 231, maxRadius: 1024, 	score: 0},
			/*x3*/
			{minAngle: 0, 	maxAngle: 18, 	minRadius: 133, 	maxRadius: 146, score: 60},
			{minAngle: 18, 	maxAngle: 36, 	minRadius: 133, 	maxRadius: 146, score: 3},
			{minAngle: 36, 	maxAngle: 54, 	minRadius: 133, 	maxRadius: 146, score: 54},
			{minAngle: 54, 	maxAngle: 72, 	minRadius: 133, 	maxRadius: 146, score: 12},
			{minAngle: 72, 	maxAngle: 90, 	minRadius: 133, 	maxRadius: 146, score: 39},
			{minAngle: 90, 	maxAngle: 108, 	minRadius: 133, 	maxRadius: 146, score: 24},
			{minAngle: 108, maxAngle: 126, 	minRadius: 133, 	maxRadius: 146, score: 30},
			{minAngle: 126, maxAngle: 144, 	minRadius: 133, 	maxRadius: 146, score: 45},
			{minAngle: 144, maxAngle: 162, 	minRadius: 133, 	maxRadius: 146, score: 6},
			{minAngle: 162, maxAngle: 180, 	minRadius: 133, 	maxRadius: 146, score: 51},
			{minAngle: 180, maxAngle: 198, 	minRadius: 133, 	maxRadius: 146, score: 9},
			{minAngle: 198, maxAngle: 216, 	minRadius: 133, 	maxRadius: 146, score: 57},
			{minAngle: 216, maxAngle: 234, 	minRadius: 133, 	maxRadius: 146, score: 21},
			{minAngle: 234, maxAngle: 252, 	minRadius: 133, 	maxRadius: 146, score: 48},
			{minAngle: 252, maxAngle: 270, 	minRadius: 133, 	maxRadius: 146, score: 24},
			{minAngle: 270, maxAngle: 288, 	minRadius: 133, 	maxRadius: 146, score: 33},
			{minAngle: 288, maxAngle: 306, 	minRadius: 133, 	maxRadius: 146, score: 42},
			{minAngle: 306, maxAngle: 324, 	minRadius: 133, 	maxRadius: 146, score: 27},
			{minAngle: 324, maxAngle: 342, 	minRadius: 133, 	maxRadius: 146, score: 36},
			{minAngle: 342, maxAngle: 360, 	minRadius: 133, 	maxRadius: 146, score: 15 },
			/*x2*/
			{minAngle: 0, 	maxAngle: 18, 	minRadius: 218, 	maxRadius: 231, score: 40},
			{minAngle: 18, 	maxAngle: 36, 	minRadius: 218, 	maxRadius: 231, score: 2},
			{minAngle: 36, 	maxAngle: 54, 	minRadius: 218, 	maxRadius: 231, score: 36},
			{minAngle: 54, 	maxAngle: 72, 	minRadius: 218, 	maxRadius: 231, score: 12},
			{minAngle: 72, 	maxAngle: 90, 	minRadius: 218, 	maxRadius: 231, score: 26},
			{minAngle: 90, 	maxAngle: 108, 	minRadius: 218, 	maxRadius: 231, score: 16},
			{minAngle: 108, maxAngle: 126, 	minRadius: 218, 	maxRadius: 231, score: 20},
			{minAngle: 126, maxAngle: 144, 	minRadius: 218, 	maxRadius: 231, score: 30},
			{minAngle: 144, maxAngle: 162, 	minRadius: 218, 	maxRadius: 231, score: 4},
			{minAngle: 162, maxAngle: 180, 	minRadius: 218, 	maxRadius: 231, score: 34},
			{minAngle: 180, maxAngle: 198, 	minRadius: 218, 	maxRadius: 231, score: 6},
			{minAngle: 198, maxAngle: 216, 	minRadius: 218, 	maxRadius: 231, score: 38},
			{minAngle: 216, maxAngle: 234, 	minRadius: 218, 	maxRadius: 231, score: 14},
			{minAngle: 234, maxAngle: 252, 	minRadius: 218, 	maxRadius: 231, score: 32},
			{minAngle: 252, maxAngle: 270, 	minRadius: 218, 	maxRadius: 231, score: 16},
			{minAngle: 270, maxAngle: 288, 	minRadius: 218, 	maxRadius: 231, score: 22},
			{minAngle: 288, maxAngle: 306, 	minRadius: 218, 	maxRadius: 231, score: 28},
			{minAngle: 306, maxAngle: 324, 	minRadius: 218, 	maxRadius: 231, score: 18},
			{minAngle: 324, maxAngle: 342, 	minRadius: 218, 	maxRadius: 231, score: 24},
			{minAngle: 342, maxAngle: 360, 	minRadius: 218, 	maxRadius: 231, score: 10 },
			/*Other*/
			{minAngle: 0, 	maxAngle: 18, 	minRadius: 8, maxRadius: 218, score: 20},
			{minAngle: 18, 	maxAngle: 36, 	minRadius: 8, 	maxRadius: 218, score: 1},
			{minAngle: 36, 	maxAngle: 54, 	minRadius: 8, 	maxRadius: 218, score: 18},
			{minAngle: 54, 	maxAngle: 72, 	minRadius: 8, 	maxRadius: 218, score: 4},
			{minAngle: 72, 	maxAngle: 90, 	minRadius: 8, 	maxRadius: 218, score: 13},
			{minAngle: 90, 	maxAngle: 108, 	minRadius: 8, 	maxRadius: 218, score: 8},
			{minAngle: 108, maxAngle: 126, 	minRadius: 8, 	maxRadius: 218, score: 10},
			{minAngle: 126, maxAngle: 144, 	minRadius: 8, 	maxRadius: 218, score: 15},
			{minAngle: 144, maxAngle: 162, 	minRadius: 8, 	maxRadius: 218, score: 2},
			{minAngle: 162, maxAngle: 180, 	minRadius: 8, 	maxRadius: 218, score: 17},
			{minAngle: 180, maxAngle: 198, 	minRadius: 8, 	maxRadius: 218, score: 3},
			{minAngle: 198, maxAngle: 216, 	minRadius: 8, 	maxRadius: 218, score: 19},
			{minAngle: 216, maxAngle: 234, 	minRadius: 8, 	maxRadius: 218, score: 7},
			{minAngle: 234, maxAngle: 252, 	minRadius: 8, 	maxRadius: 218, score: 16},
			{minAngle: 252, maxAngle: 270, 	minRadius: 8, 	maxRadius: 218, score: 8},
			{minAngle: 270, maxAngle: 288, 	minRadius: 8, 	maxRadius: 218, score: 11},
			{minAngle: 288, maxAngle: 306, 	minRadius: 8, 	maxRadius: 218, score: 14},
			{minAngle: 306, maxAngle: 324, 	minRadius: 8, 	maxRadius: 218, score: 9},
			{minAngle: 324, maxAngle: 342, 	minRadius: 8, 	maxRadius: 218, score: 12},
			{minAngle: 342, maxAngle: 360, 	minRadius: 8, 	maxRadius: 218, score: 5 }
		];
		//--------------------------->	VARIABLES			<---------------------------//
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function DartboardMap() 
		{
			
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}