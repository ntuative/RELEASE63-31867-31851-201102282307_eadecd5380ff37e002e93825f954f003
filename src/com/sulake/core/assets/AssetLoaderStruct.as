package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_892:IAssetLoader;
      
      private var var_1927:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1927 = param1;
         this.var_892 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1927;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_892;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_892 != null)
            {
               if(!this.var_892.disposed)
               {
                  this.var_892.dispose();
                  this.var_892 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
