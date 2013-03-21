package tinkComponent
{
	/**
	 *object 
	 * @author tian.huang
	 * 
	 */	
	public class ObjectUtils
	{
		public function ObjectUtils()
		{
			
		}
		
		public static function copyPorpertiesByXML(compoent:Object,xml:XML):void
		{
			var xmllist:XMLList = xml.attributes();
			for each (var xmlitem:XML in xmllist) 
			{
				var name:String = xmlitem.name().toString();
				if(compoent.hasOwnProperty(name))
				{
					var value:String = xmlitem.toString();
					compoent[name] = value;
				}
			}
		}
	}
}