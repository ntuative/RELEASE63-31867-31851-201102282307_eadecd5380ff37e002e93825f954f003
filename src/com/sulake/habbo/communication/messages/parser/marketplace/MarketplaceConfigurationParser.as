package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1481:Boolean;
      
      private var var_2280:int;
      
      private var var_1631:int;
      
      private var var_1630:int;
      
      private var var_2279:int;
      
      private var var_2278:int;
      
      private var var_2283:int;
      
      private var var_2281:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1481;
      }
      
      public function get commission() : int
      {
         return this.var_2280;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1631;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1630;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2278;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2279;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2283;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2281;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1481 = param1.readBoolean();
         this.var_2280 = param1.readInteger();
         this.var_1631 = param1.readInteger();
         this.var_1630 = param1.readInteger();
         this.var_2278 = param1.readInteger();
         this.var_2279 = param1.readInteger();
         this.var_2283 = param1.readInteger();
         this.var_2281 = param1.readInteger();
         return true;
      }
   }
}
