package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2405:int;
      
      private var var_2436:int;
      
      private var var_2434:int;
      
      private var _dayOffsets:Array;
      
      private var var_1728:Array;
      
      private var var_1727:Array;
      
      private var var_2437:int;
      
      private var var_2435:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2405;
      }
      
      public function get method_3() : int
      {
         return this.var_2436;
      }
      
      public function get historyLength() : int
      {
         return this.var_2434;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1728;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1727;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2437;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2435;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2405 = param1.readInteger();
         this.var_2436 = param1.readInteger();
         this.var_2434 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1728 = [];
         this.var_1727 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1728.push(param1.readInteger());
            this.var_1727.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2435 = param1.readInteger();
         this.var_2437 = param1.readInteger();
         return true;
      }
   }
}
