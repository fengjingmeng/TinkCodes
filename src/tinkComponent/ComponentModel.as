package tinkComponent
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	/**
	 *component  M 
	 * @author tian.huang
	 * 
	 */	
	public class ComponentModel extends EventDispatcher
	{
		private var _componentList:Dictionary;
		private var _bitmapList:Dictionary;
		
		public function ComponentModel(target:IEventDispatcher=null)
		{
			super(target);
			
			_componentList = new Dictionary();
			_bitmapList = new Dictionary();
		}
		
		public function getComponentXML(stylename:String):XML
		{
			return _componentList[stylename];
		}
		
		public function addXMLList(xml:XML):void
		{
			var componentList:XMLList = xml..component;
			var bitmapList:XMLList = xml..bitmap;
			
			addComponentList(componentList);
			addBitmapList(bitmapList);
		}
		
		private function addComponentList(value:XMLList):void
		{
			for (var i:int = 0; i < value.length(); i++) 
			{
				if(_componentList[String(value[i].@stylename)] != null)
				{
					var error:Error = new Error("样式重名。。。请注意检查!!!!!!!!"+String(value[i].@stylename));
					throw error;
				}
				_componentList[String(value[i].@stylename)] = value[i];
			}
		}
		
		private function addBitmapList(value:XMLList):void
		{
			for (var i:int = 0; i < value.length(); i++) 
			{
				if(_bitmapList[String(value[i].@stylename)] != null)
				{
					var error:Error = new Error("样式重名。。。请注意检查!!!!!!!!"+String(value[i].@stylename));
					throw error;
				}
				_bitmapList[String(value[i].@stylename)] = value[i];
			}
		}
	}
}