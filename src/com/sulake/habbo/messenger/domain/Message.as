package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_738:int = 1;
      
      public static const const_880:int = 2;
      
      public static const const_843:int = 3;
      
      public static const const_1141:int = 4;
      
      public static const const_858:int = 5;
      
      public static const const_1065:int = 6;
       
      
      private var _type:int;
      
      private var var_1073:int;
      
      private var var_2265:String;
      
      private var var_2446:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1073 = param2;
         this.var_2265 = param3;
         this.var_2446 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2265;
      }
      
      public function get time() : String
      {
         return this.var_2446;
      }
      
      public function get senderId() : int
      {
         return this.var_1073;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
