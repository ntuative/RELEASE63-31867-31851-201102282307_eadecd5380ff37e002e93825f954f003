package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1544:int;
      
      private var var_1552:int;
      
      private var var_1551:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1552 = param1.readInteger();
         this.var_1544 = param1.readInteger();
         this.var_1551 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1544 = 0;
         this.var_1552 = 0;
         this.var_1551 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1544;
      }
      
      public function get messageId() : int
      {
         return this.var_1552;
      }
      
      public function get timestamp() : String
      {
         return this.var_1551;
      }
   }
}
