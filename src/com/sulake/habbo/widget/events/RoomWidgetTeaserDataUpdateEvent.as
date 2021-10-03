package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_505:String = "RWTDUE_TEASER_DATA";
      
      public static const const_806:String = "RWTDUE_GIFT_DATA";
      
      public static const const_821:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_319:int;
      
      private var _data:String;
      
      private var var_378:int;
      
      private var var_173:String;
      
      private var var_2176:String;
      
      private var var_2208:Boolean;
      
      private var var_1398:int = 0;
      
      private var var_2537:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_319;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_378;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2176;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2208;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2537;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1398;
      }
      
      public function set status(param1:int) : void
      {
         this.var_378 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2176 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2208 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2537 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_319 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_173;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_173 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1398 = param1;
      }
   }
}
