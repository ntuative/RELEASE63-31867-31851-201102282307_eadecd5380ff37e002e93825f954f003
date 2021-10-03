package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_645:String;
      
      private var var_2155:String;
      
      private var var_987:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_645 = param1;
         this.var_987 = param2;
         this.var_2155 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_645;
      }
      
      public function get race() : String
      {
         return this.var_2155;
      }
      
      public function get gender() : String
      {
         return this.var_987;
      }
   }
}
