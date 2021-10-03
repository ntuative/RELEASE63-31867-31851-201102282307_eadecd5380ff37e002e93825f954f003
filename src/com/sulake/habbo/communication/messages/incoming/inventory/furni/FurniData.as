package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2187:int;
      
      private var var_1300:String;
      
      private var _objId:int;
      
      private var var_1648:int;
      
      private var _category:int;
      
      private var var_1986:String;
      
      private var var_2524:Boolean;
      
      private var var_2523:Boolean;
      
      private var var_2522:Boolean;
      
      private var var_2048:Boolean;
      
      private var var_2525:int;
      
      private var var_1418:int;
      
      private var var_1936:String = "";
      
      private var var_2010:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2187 = param1;
         this.var_1300 = param2;
         this._objId = param3;
         this.var_1648 = param4;
         this._category = param5;
         this.var_1986 = param6;
         this.var_2524 = param7;
         this.var_2523 = param8;
         this.var_2522 = param9;
         this.var_2048 = param10;
         this.var_2525 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1936 = param1;
         this.var_1418 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2187;
      }
      
      public function get itemType() : String
      {
         return this.var_1300;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1648;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1986;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2524;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2523;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2522;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2048;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2525;
      }
      
      public function get slotId() : String
      {
         return this.var_1936;
      }
      
      public function get songId() : int
      {
         return this.var_2010;
      }
      
      public function get extra() : int
      {
         return this.var_1418;
      }
   }
}
