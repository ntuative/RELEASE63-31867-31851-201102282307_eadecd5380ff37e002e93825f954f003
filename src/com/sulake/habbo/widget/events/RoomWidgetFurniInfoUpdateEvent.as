package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_306:String = "RWFIUE_FURNI";
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var _name:String = "";
      
      private var var_1507:String = "";
      
      private var var_44:BitmapData = null;
      
      private var var_2073:Boolean = false;
      
      private var var_2071:Boolean = false;
      
      private var var_1931:Boolean = false;
      
      private var var_1928:Boolean = false;
      
      private var var_2070:Boolean = false;
      
      private var var_1711:int = -1;
      
      private var var_2072:int = -1;
      
      private var _offerId:int = -1;
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1507 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1507;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_44 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2073 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2073;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2071 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2071;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1931 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1931;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_1928 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_1928;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2070 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2070;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_1711 = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_1711;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2072 = param1;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2072;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
   }
}
