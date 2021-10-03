package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestListMessageParser implements IMessageParser
   {
       
      
      private var var_1676:String;
      
      private var var_1651:int;
      
      private var var_357:Array;
      
      public function QuestListMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var _loc1_:* = null;
         this.var_1676 = "";
         this.var_1651 = 2;
         if(this.var_357)
         {
            for each(_loc1_ in this.var_357)
            {
               _loc1_.dispose();
            }
         }
         this.var_357 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1676 = param1.readString();
         this.var_1651 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_357.push(new QuestMessageData(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get quests() : Array
      {
         return this.var_357;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1676;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1651;
      }
   }
}
