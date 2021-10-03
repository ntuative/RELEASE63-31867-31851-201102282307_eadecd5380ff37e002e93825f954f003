package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1653:String;
      
      private var var_1699:int;
      
      private var var_2402:Boolean;
      
      private var var_2400:Boolean;
      
      private var var_2399:int;
      
      private var var_2403:int;
      
      private var var_2397:int;
      
      private var var_2398:int;
      
      private var var_2401:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1653 = param1.readString();
         this.var_1699 = param1.readInteger();
         this.var_2402 = param1.readBoolean();
         this.var_2400 = param1.readBoolean();
         this.var_2399 = param1.readInteger();
         this.var_2403 = param1.readInteger();
         this.var_2397 = param1.readInteger();
         this.var_2398 = param1.readInteger();
         this.var_2401 = param1.readInteger();
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
   }
}
