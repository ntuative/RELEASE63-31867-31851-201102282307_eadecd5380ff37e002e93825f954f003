package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1481:Boolean = false;
      
      private var var_1699:int;
      
      private var var_1520:Array;
      
      private var var_775:Array;
      
      private var var_776:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1481 = _loc2_.isWrappingEnabled;
         this.var_1699 = _loc2_.wrappingPrice;
         this.var_1520 = _loc2_.stuffTypes;
         this.var_775 = _loc2_.boxTypes;
         this.var_776 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1481;
      }
      
      public function get price() : int
      {
         return this.var_1699;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1520;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_775;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_776;
      }
   }
}
