package tinkLoader
{
	import flash.events.Event;
	
	/**
	 *loader 事件 
	 * @author tian.huang
	 * 
	 */	
	public class LoaderEvent extends Event
	{
		public static const COMPLETE:String = "complete";
		public static const PROGRESS:String = "progress";
		public static const ERROR:String = "error";
		
		public function LoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}