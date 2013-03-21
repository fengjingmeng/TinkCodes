package tinkComponent
{

	/**
	 *工厂类 
	 * @author Demon-Tink
	 * 
	 */	
	public class ComponentFactory
	{
		private static var _instance:ComponentFactory;
		private var _model:ComponentModel;
		
		public function ComponentFactory()
		{
			_model = new ComponentModel();
		}
		
		public static function get instance():ComponentFactory
		{
			if(!_instance)
			{
				_instance = new ComponentFactory();
			}
			return _instance;
		}
		
		public function setup(xml:XML):void
		{
			_model.addXMLList(xml);
		}
		
		public function create(stylename:String):*
		{
			return null;
		}
		/**
		 *通过样式名创建component 
		 * @param stylename
		 * @return 
		 * 
		 */		
		public function createComponentByStylename(stylename:String):*
		{
			var xml:XML = getComponentXML(stylename);
			var classname:String = xml.@classname;
		}
		
		public function getComponentXML(stylename:String):XML
		{
			return _model.getComponentXML(stylename);
		}
	}
}