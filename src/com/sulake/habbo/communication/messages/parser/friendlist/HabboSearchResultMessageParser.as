package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultData;
   
   public class HabboSearchResultMessageParser implements IMessageParser
   {
       
      
      private var var_202:Array;
      
      private var var_1573:Array;
      
      public function HabboSearchResultMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_202 = new Array();
         this.var_1573 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_202.push(new HabboSearchResultData(param1));
            _loc3_++;
         }
         var _loc4_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            this.var_1573.push(new HabboSearchResultData(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get friends() : Array
      {
         return this.var_202;
      }
      
      public function get others() : Array
      {
         return this.var_1573;
      }
   }
}
