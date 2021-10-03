package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1155:String;
      
      private var var_1472:Array;
      
      private var var_1081:Array;
      
      private var var_1932:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1155;
      }
      
      public function get choices() : Array
      {
         return this.var_1472.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1081.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1932;
      }
      
      public function flush() : Boolean
      {
         this.var_1155 = "";
         this.var_1472 = [];
         this.var_1081 = [];
         this.var_1932 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1155 = param1.readString();
         this.var_1472 = [];
         this.var_1081 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1472.push(param1.readString());
            this.var_1081.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1932 = param1.readInteger();
         return true;
      }
   }
}
