package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2000:int;
      
      private var var_2001:int;
      
      private var var_2527:String;
      
      private var var_2529:int;
      
      private var var_2528:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2000 = param1;
         this.var_2001 = param2;
         this.var_2527 = param3;
         this.var_2529 = param4;
         this.var_2528 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2000,this.var_2001,this.var_2527,this.var_2529,int(this.var_2528)];
      }
      
      public function dispose() : void
      {
      }
   }
}
