package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1071:Boolean;
      
      private var var_1072:Boolean;
      
      private var var_1319:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1071;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1072;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1319;
      }
      
      public function flush() : Boolean
      {
         this.var_1071 = false;
         this.var_1072 = false;
         this.var_1319 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1071 = param1.readBoolean();
         this.var_1072 = param1.readBoolean();
         this.var_1319 = param1.readBoolean();
         return true;
      }
   }
}
