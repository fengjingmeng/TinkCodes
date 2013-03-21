package tinkUIModuleLoader
{
	import flash.events.Event;
	
	public class UIModuleLoaderEvent extends Event
	{
		public static const COMPLETE:String = "complete";
		public static const ERROR:String = "error";
		
		public function UIModuleLoaderEvent(type:String)
		{
			super(type);
		}
	}
}