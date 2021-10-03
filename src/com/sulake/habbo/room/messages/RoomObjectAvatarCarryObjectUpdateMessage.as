package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1300:int;
      
      private var var_1606:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         this.var_1300 = param1;
         this.var_1606 = param2;
      }
      
      public function get itemType() : int
      {
         return this.var_1300;
      }
      
      public function get itemName() : String
      {
         return this.var_1606;
      }
   }
}
