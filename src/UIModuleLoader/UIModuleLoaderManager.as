package UIModuleLoader
{
	import tinkComponent.ComponentFactory;
	
	import tinkLoader.LoaderEvent;
	import tinkLoader.LoaderManager;
	import tinkLoader.LoaderType;
	import tinkLoader.Loaders.XMLLoader;
	import tinkLoader.config.ConfigManager;
	
	/**
	 *模块加载  C 
	 * @author tian.huang
	 * 
	 */	
	public class UIModuleLoaderManager
	{
		private static var _instance:UIModuleLoaderManager;
		private var _model:UIModuleLoaderModel;
		
		public function UIModuleLoaderManager()
		{
			_model = new UIModuleLoaderModel();
		}
		
		public function get model():UIModuleLoaderModel
		{
			return _model;
		}
		
		public function addUIModule(module:String):void
		{
			loadModuleUI(module);
			
		}
		
		public function loadModuleUI(module:String):void
		{
			if(!model.getloaderByModuleName(module))
			{
				var path:String = ConfigManager.instance.xmlPath + module + ".xml";
				var loader:XMLLoader = LoaderManager.instance.createLoader(path,LoaderType.XML);
				loader.UIModuleName = module;
				loader.addEventListener(LoaderEvent.COMPLETE,__loaderComplete);
				loader.addEventListener(LoaderEvent.ERROR,__loaderError);
				LoaderManager.instance.addLoader(loader);
			}
			else
			{
				trace("Loader error:try to load " + module + ".xml in twice!");
			}
		}
		
		private function __loaderComplete(event:LoaderEvent):void
		{
			var loader:XMLLoader = event.target as XMLLoader;
			var xml:XML = new XML(loader.data);
			ComponentFactory.instance.setup(xml);
			
			loader.removeEventListener(LoaderEvent.COMPLETE,__loaderComplete);
			loader.removeEventListener(LoaderEvent.ERROR,__loaderError);
			
			model.addLoader(loader.UIModuleName,loader);
		}
		
		private function __loaderError(event:LoaderEvent):void
		{
			var loader:XMLLoader = event.target as XMLLoader;
			loader.removeEventListener(LoaderEvent.COMPLETE,__loaderComplete);
			loader.removeEventListener(LoaderEvent.ERROR,__loaderError);
			
			model.dispatchEvent(new UIModuleLoaderEvent(UIModuleLoaderEvent.ERROR));
		}
		
		public function setup():void
		{
			
		}
		
		public static function get instance():UIModuleLoaderManager
		{
			if(!_instance)
			{
				_instance = new UIModuleLoaderManager();
			}
			return _instance;
		}
	}
}