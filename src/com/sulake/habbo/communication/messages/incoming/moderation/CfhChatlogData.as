package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1889:int;
      
      private var var_2669:int;
      
      private var var_1394:int;
      
      private var var_2259:int;
      
      private var var_113:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1889 = param1.readInteger();
         this.var_2669 = param1.readInteger();
         this.var_1394 = param1.readInteger();
         this.var_2259 = param1.readInteger();
         this.var_113 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1889);
      }
      
      public function get callId() : int
      {
         return this.var_1889;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2669;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1394;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2259;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_113;
      }
   }
}
