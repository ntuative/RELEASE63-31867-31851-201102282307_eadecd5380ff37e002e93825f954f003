package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2570:int;
      
      private var var_2571:int;
      
      private var var_2572:int;
      
      private var var_2573:String;
      
      private var var_1677:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2570 = param1.readInteger();
         this.var_2571 = param1.readInteger();
         this.var_2572 = param1.readInteger();
         this.var_2573 = param1.readString();
         this.var_1677 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2570;
      }
      
      public function get minute() : int
      {
         return this.var_2571;
      }
      
      public function get chatterId() : int
      {
         return this.var_2572;
      }
      
      public function get chatterName() : String
      {
         return this.var_2573;
      }
      
      public function get msg() : String
      {
         return this.var_1677;
      }
   }
}
