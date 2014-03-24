package windows 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class WindowBase extends Sprite
	{
		
		//--------------------------->	STATIC VARIABLES	<---------------------------//
		//--------------------------->	VARIABLES			<---------------------------//
		protected var _view:Sprite;
		//--------------------------->	CONSTRUCTOR			<---------------------------//
		public function WindowBase(view:Class) 
		{
			_view = new view();
			addChild(_view);
		}
		
		//--------------------------->	EVENT HANDLERS		<---------------------------//
		//--------------------------->	PRIVATE METHODS		<---------------------------//
		//--------------------------->	PUBLIC METHODS		<---------------------------//
		public function clear():void
		{
			_view = null;
		}
		//--------------------------->	GETTERS & SETTERS	<---------------------------//
		
	}

}