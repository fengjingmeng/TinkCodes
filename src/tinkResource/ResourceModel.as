package tinkResource
{
	import flash.events.EventDispatcher;
	
	public class ResourceModel extends EventDispatcher
	{
		private var _XMLResource:Vector.<XMLList>
		
		public function ResourceModel()
		{
			super();
		}
		
		public function get XMLResource():Vector.<XMLList>
		{
			return _XMLResource;
		}
		
		public function getXMLResourceByModuleName(moduleName:String):XMLList
		{
			return XMLResource[moduleName];
		}
		
		public function addXMLResource(moduleName:String,xmllist:XMLList):void
		{
			if(!XMLResource[moduleName])
			{
				XMLResource[moduleName] = xmllist;
			}
		}
	}
}