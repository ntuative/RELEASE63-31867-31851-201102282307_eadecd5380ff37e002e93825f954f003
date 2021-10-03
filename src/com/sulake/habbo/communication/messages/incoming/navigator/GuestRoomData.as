package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_371:int;
      
      private var var_763:Boolean;
      
      private var var_957:String;
      
      private var _ownerName:String;
      
      private var var_2065:int;
      
      private var var_2032:int;
      
      private var var_2487:int;
      
      private var var_1507:String;
      
      private var var_2489:int;
      
      private var var_2491:Boolean;
      
      private var var_765:int;
      
      private var var_1288:int;
      
      private var var_2490:String;
      
      private var var_799:Array;
      
      private var var_2488:RoomThumbnailData;
      
      private var var_2069:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_799 = new Array();
         super();
         this.var_371 = param1.readInteger();
         this.var_763 = param1.readBoolean();
         this.var_957 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2065 = param1.readInteger();
         this.var_2032 = param1.readInteger();
         this.var_2487 = param1.readInteger();
         this.var_1507 = param1.readString();
         this.var_2489 = param1.readInteger();
         this.var_2491 = param1.readBoolean();
         this.var_765 = param1.readInteger();
         this.var_1288 = param1.readInteger();
         this.var_2490 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_799.push(_loc4_);
            _loc3_++;
         }
         this.var_2488 = new RoomThumbnailData(param1);
         this.var_2069 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_799 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_371;
      }
      
      public function get event() : Boolean
      {
         return this.var_763;
      }
      
      public function get roomName() : String
      {
         return this.var_957;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2065;
      }
      
      public function get userCount() : int
      {
         return this.var_2032;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2487;
      }
      
      public function get description() : String
      {
         return this.var_1507;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2489;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2491;
      }
      
      public function get score() : int
      {
         return this.var_765;
      }
      
      public function get categoryId() : int
      {
         return this.var_1288;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2490;
      }
      
      public function get tags() : Array
      {
         return this.var_799;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2488;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2069;
      }
   }
}
