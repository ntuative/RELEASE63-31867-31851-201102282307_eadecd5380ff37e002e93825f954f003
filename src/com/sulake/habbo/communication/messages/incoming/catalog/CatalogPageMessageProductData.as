package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_82:String = "i";
      
      public static const const_91:String = "s";
      
      public static const const_272:String = "e";
       
      
      private var var_1710:String;
      
      private var var_2296:int;
      
      private var var_1357:String;
      
      private var var_1356:int;
      
      private var var_1711:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1710 = param1.readString();
         this.var_2296 = param1.readInteger();
         this.var_1357 = param1.readString();
         this.var_1356 = param1.readInteger();
         this.var_1711 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1710;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2296;
      }
      
      public function get extraParam() : String
      {
         return this.var_1357;
      }
      
      public function get productCount() : int
      {
         return this.var_1356;
      }
      
      public function get expiration() : int
      {
         return this.var_1711;
      }
   }
}
