package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	/**
	 * ...
	 * @author Zhukovskiy G.B.
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP;
			Root.instance.init(this);
		}
		
	}
	
}