package tinkComponent
{
	import flash.utils.getDefinitionByName;

	/**
	 *类识别 
	 * @author tian.huang
	 * 
	 */	
	public class ClassUtils
	{
		public function ClassUtils()
		{
			
		}
		/**
		 *根据类名，创建类对象 
		 * @param classname
		 * @return 
		 * 
		 */		
		public static function adapter(classname:String,arg:Array = null):*
		{
			var classObject:Object = getDefinitionByName(classname);
			if(!classObject)
			{
				throw new Error("can't find the class " + classname);
			}
			else
			{
				var object:Object;
				if(arg == null || arg.length == 0)
				{
					object = new classObject();
				}
				else if(arg.length == 1)
				{
					object = new classObject(arg[0]);
				}
				else if(arg.length == 2)
				{
					object = new classObject(arg[0],arg[1]);
				}
				return object;
			}
		}
	}
}