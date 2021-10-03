package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1653:String;
      
      private var var_1699:int;
      
      private var var_2402:Boolean;
      
      private var var_2400:Boolean;
      
      private var var_2399:int;
      
      private var var_2403:int;
      
      private var var_394:ICatalogPage;
      
      private var var_2397:int;
      
      private var var_2398:int;
      
      private var var_2401:int;
      
      private var var_2597:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1653 = param2;
         this.var_1699 = param3;
         this.var_2402 = param4;
         this.var_2400 = param5;
         this.var_2399 = param6;
         this.var_2403 = param7;
         this.var_2397 = param8;
         this.var_2398 = param9;
         this.var_2401 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1653;
      }
      
      public function get price() : int
      {
         return this.var_1699;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2402;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2400;
      }
      
      public function get periods() : int
      {
         return this.var_2399;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2403;
      }
      
      public function get year() : int
      {
         return this.var_2397;
      }
      
      public function get month() : int
      {
         return this.var_2398;
      }
      
      public function get day() : int
      {
         return this.var_2401;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_172;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1699;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_394;
      }
      
      public function get priceType() : String
      {
         return Offer.const_667;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1653;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_394 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2597;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2597 = param1;
      }
   }
}
