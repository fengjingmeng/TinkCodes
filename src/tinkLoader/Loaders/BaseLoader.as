package tinkLoader.Loaders
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import tinkLoader.LoaderEvent;
	
	public class BaseLoader extends Loader
	{
		protected var _url:String;
		protected var _progress:Number;
		protected var _urlRoader:URLLoader;
		protected var _urlRequest:URLRequest;
		
		protected var _loading:Boolean = false;
		protected var _complete:Boolean = false;
		
		protected var errorMessage:String;
		
		public function BaseLoader(url:String)
		{
			super();
			_url = url;
			_urlRoader = new URLLoader();
			_urlRequest = new URLRequest(_url);
			initEvent();
		}
		
		public function startLoad():void
		{
			_loading = true;
			_progress = 1;
			_urlRoader.load(_urlRequest);
			trace("start load " + _urlRequest.url + "--------------------------------");
		}
		
		public function get url():String
		{
			return _url;
		}
		
		public function get loading():Boolean
		{
			return _loading;
		}
		
		public function get data():*
		{
			return _urlRoader.data;
		}
		
		public function get complete():Boolean
		{
			return _complete;
		}
		
		public function get progress():Number
		{
			return _progress;
		}
		
		protected function initEvent():void
		{
			_urlRoader.addEventListener(Event.COMPLETE,__loaderComplete);
			_urlRoader.addEventListener(IOErrorEvent.IO_ERROR,__loaderError);
			_urlRoader.addEventListener(ProgressEvent.PROGRESS,__loaderProgress);
		}
		
		protected function __loaderComplete(event:Event):void
		{
			_loading = false;
			_complete = true;
			dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETE));
			removeEvent();
		}
		
		protected function __loaderError(event:IOErrorEvent):void
		{
			_loading = false;
			_complete = true;
			dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETE));
			dispatchEvent(new LoaderEvent(LoaderEvent.ERROR));
			removeEvent();
			traceErrorMessage();
		}
		
		protected function traceErrorMessage():void
		{
			trace(errorMessage);
		}
		
		protected function __loaderProgress(event:ProgressEvent):void
		{
			_progress = event.bytesLoaded/event.bytesTotal;
			dispatchEvent(new LoaderEvent(LoaderEvent.PROGRESS))
		}
		
		protected function removeEvent():void
		{
			_urlRoader.removeEventListener(Event.COMPLETE,__loaderComplete);
			_urlRoader.removeEventListener(IOErrorEvent.IO_ERROR,__loaderError);
			_urlRoader.removeEventListener(ProgressEvent.PROGRESS,__loaderProgress);
		}
		
		protected function dispose():void
		{
			removeEvent();
			_urlRoader = null;
			_urlRequest = null;
		}
	}
}