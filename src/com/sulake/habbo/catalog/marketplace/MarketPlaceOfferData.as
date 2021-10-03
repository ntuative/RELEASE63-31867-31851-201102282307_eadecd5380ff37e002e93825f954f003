package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2406:int;
      
      private var var_1986:String;
      
      private var var_1699:int;
      
      private var var_2405:int;
      
      private var var_2404:int;
      
      private var var_378:int;
      
      private var var_2407:int = -1;
      
      private var var_1698:int;
      
      private var var_44:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2406 = param3;
         this.var_1986 = param4;
         this.var_1699 = param5;
         this.var_378 = param6;
         this.var_2405 = param7;
         this.var_1698 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_44)
         {
            this.var_44.dispose();
            this.var_44 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2406;
      }
      
      public function get stuffData() : String
      {
         return this.var_1986;
      }
      
      public function get price() : int
      {
         return this.var_1699;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2405;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_44 != null)
         {
            this.var_44.dispose();
         }
         this.var_44 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2404 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2404;
      }
      
      public function get status() : int
      {
         return this.var_378;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2407;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2407 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1699 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get method_3() : int
      {
         return this.var_1698;
      }
      
      public function set method_3(param1:int) : void
      {
         this.var_1698 = param1;
      }
   }
}
