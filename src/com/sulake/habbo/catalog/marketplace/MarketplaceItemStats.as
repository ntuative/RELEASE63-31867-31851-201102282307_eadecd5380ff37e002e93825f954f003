package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2405:int;
      
      private var var_2436:int;
      
      private var var_2434:int;
      
      private var _dayOffsets:Array;
      
      private var var_1728:Array;
      
      private var var_1727:Array;
      
      private var var_2437:int;
      
      private var var_2435:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2405 = param1;
      }
      
      public function set method_3(param1:int) : void
      {
         this.var_2436 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2434 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1728 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1727 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2437 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2435 = param1;
      }
   }
}
