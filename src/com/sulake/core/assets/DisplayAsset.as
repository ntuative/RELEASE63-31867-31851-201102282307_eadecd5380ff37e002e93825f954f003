package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_993:String;
      
      protected var var_168:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_808:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_808 = param1;
         this.var_993 = param2;
      }
      
      public function get url() : String
      {
         return this.var_993;
      }
      
      public function get content() : Object
      {
         return this.var_168;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_808;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_168.loaderInfo != null)
            {
               if(this.var_168.loaderInfo.loader != null)
               {
                  this.var_168.loaderInfo.loader.unload();
               }
            }
            this.var_168 = null;
            this.var_808 = null;
            this._disposed = true;
            this.var_993 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_168 = param1 as DisplayObject;
            if(this.var_168 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_168 = DisplayAsset(param1).var_168;
            this.var_808 = DisplayAsset(param1).var_808;
            if(this.var_168 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_168 = DisplayAsset(param1).var_168;
            this.var_808 = DisplayAsset(param1).var_808;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
