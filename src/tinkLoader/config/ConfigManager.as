package tinkLoader.config
{
	public class ConfigManager
	{
		private var _xmlPath:String;			//模块xml的路径
		private var _swfPath:String;			//模块swf的路径
		
		private static var _instance:ConfigManager;
		
		public function ConfigManager()
		{
			
		}
		
		public static function get instance():ConfigManager
		{
			if(!_instance)
			{
				_instance = new ConfigManager();
			}
			return _instance;
		}

		public function get xmlPath():String
		{
			return _xmlPath;
		}

		public function set xmlPath(value:String):void
		{
			_xmlPath = value;
		}

		public function get swfPath():String
		{
			return _swfPath;
		}

		public function set swfPath(value:String):void
		{
			_swfPath = value;
		}


	}
}