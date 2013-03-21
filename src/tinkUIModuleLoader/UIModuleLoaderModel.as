package tinkUIModuleLoader
{
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import tinkLoader.Loaders.BaseLoader;
	
	
	/**
	 *模块加载 M 
	 * @author tian.huang
	 * 
	 */	
	public class UIModuleLoaderModel extends EventDispatcher
	{
		private var _loaders:Dictionary;
		
		public function UIModuleLoaderModel()
		{
			super();
			_loaders = new Dictionary();
		}

		public function getloaderByModuleName(module:String):BaseLoader
		{
			return _loaders[module];
		}
		
		public function addLoader(module:String,loader:BaseLoader):void
		{
			_loaders[module] = loader;
			dispatchEvent(new UIModuleLoaderEvent(UIModuleLoaderEvent.COMPLETE));
		}

	}
}