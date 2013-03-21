package tinkLoader
{
	import tinkLoader.Loaders.BaseLoader;

	/**
	 *加载队列 
	 * @author tian.huang
	 * 
	 */	
	public class LoaderQueue
	{
		private var _loaderQueue:Vector.<BaseLoader>;
		
		public function LoaderQueue()
		{
			_loaderQueue = new Vector.<BaseLoader>();
		}
		
		public function addLoader(loader:BaseLoader):void
		{
			_loaderQueue.push(loader);
		}
		
		public function execute():void
		{
			if(_loaderQueue.length > 0)
			{
				if(_loaderQueue[0].complete)
				{
					_loaderQueue.shift();
				}
				else if(!_loaderQueue[0].loading)
				{
					_loaderQueue[0].startLoad();
				}
			}
		}
	}
}