package tinkLoader.Loaders
{
	import flash.events.IOErrorEvent;

	/**
	 *加载XML 
	 * @author tian.huang
	 * 
	 */	
	public class XMLLoader extends BaseLoader
	{
		public var UIModuleName:String;
		
		public function XMLLoader(url:String)
		{
			super(url);
		}
		
		override protected function __loaderError(event:IOErrorEvent):void
		{
			errorMessage = "load uimodule " + UIModuleName + " error";
			super.__loaderError(event);
		}
	}
}