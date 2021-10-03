package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2010:int;
      
      private var var_2035:int;
      
      private var var_2036:String;
      
      private var var_2038:String;
      
      private var var_2037:int = 0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2010 = param1;
         this.var_2035 = param2;
         this.var_2036 = param3;
         this.var_2038 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2010;
      }
      
      public function get length() : int
      {
         return this.var_2035;
      }
      
      public function get name() : String
      {
         return this.var_2036;
      }
      
      public function get creator() : String
      {
         return this.var_2038;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2037;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2037 = param1;
      }
   }
}
