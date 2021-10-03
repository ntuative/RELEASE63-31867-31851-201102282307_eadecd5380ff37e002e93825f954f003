package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_1275:Boolean;
      
      private var var_1646:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_1275;
      }
      
      public function get minutesUntilChange() : int
      {
         return this.var_1646;
      }
      
      public function flush() : Boolean
      {
         this.var_1275 = false;
         this.var_1646 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1275 = param1.readInteger() > 0;
         this.var_1646 = param1.readInteger();
         return true;
      }
   }
}
