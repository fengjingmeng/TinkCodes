package tinkLoader
{
	import tinkLoader.Loaders.BaseLoader;
	import tinkLoader.Loaders.XMLLoader;

	/**
	 *Loader C 
	 * @author tian.huang
	 * 
	 */	
	public class LoaderManager
	{
		private static var _instance:LoaderManager;
		private var _model:LoaderModel;
		private var _queue:LoaderQueue;
		
		public function LoaderManager()
		{
			_model = new LoaderModel();
			_queue = new LoaderQueue();
		}
		
		public function createLoader(path:String,type:int):*
		{
			var loader:BaseLoader;
			loader = model.getloaderByPath(path);
			if(!loader)
			{
				loader = createLoaderByType(path,type);
			}
			model.loaderSaveByPath[loader.url] = loader;
			return loader;
		}
		
		public function addLoader(loader:BaseLoader):void
		{
			_queue.addLoader(loader);
		}
		
		private function createLoaderByType(path:String,type:int):BaseLoader
		{
			var loader:BaseLoader;
			switch(type)
			{
				case LoaderType.XML:
				{
					loader = new XMLLoader(path);
					break;
				}
					
				default:
				{
					loader = new BaseLoader(path);
					break;
				}
			}
			return loader;
		}
		
		public function setup():void
		{
			
		}
		
		/**
		 *不断加载 
		 */		
		public function execute():void
		{
			_queue.execute();
		}
		
		public function get model():LoaderModel
		{
			return _model;
		}
		
		public static function get instance():LoaderManager
		{
			if(!_instance)
			{
				_instance = new LoaderManager();
			}
			return _instance;
		}
	}
}