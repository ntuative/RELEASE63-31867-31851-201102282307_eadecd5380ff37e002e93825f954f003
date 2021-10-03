package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserRightsMessageParser implements IMessageParser
   {
       
      
      private var var_1136:Boolean;
      
      private var var_938:Array = null;
      
      private var var_2477:int;
      
      private var var_1799:int;
      
      public function UserRightsMessageParser()
      {
         super();
         this.var_938 = [];
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Boolean = param1.readBoolean();
         if(_loc2_)
         {
            this.var_938 = [];
            _loc3_ = param1.readInteger();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.var_938.push(param1.readString());
               _loc4_++;
            }
            this.var_1136 = false;
         }
         else
         {
            this.var_2477 = param1.readInteger();
            this.var_1799 = param1.readInteger();
            this.var_1136 = true;
         }
         return true;
      }
      
      public function get simpleSecurity() : Boolean
      {
         return this.var_1136;
      }
      
      public function get rights() : Array
      {
         return this.var_938.slice();
      }
      
      public function get clubLevel() : int
      {
         return this.var_2477;
      }
      
      public function get securityLevel() : int
      {
         return this.var_1799;
      }
   }
}
