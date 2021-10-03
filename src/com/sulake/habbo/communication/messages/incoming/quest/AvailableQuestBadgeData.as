package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AvailableQuestBadgeData
   {
       
      
      private var var_281:int;
      
      private var var_2009:String;
      
      public function AvailableQuestBadgeData(param1:IMessageDataWrapper)
      {
         super();
         this.var_281 = param1.readInteger();
         this.var_2009 = param1.readString();
      }
      
      public function get badgeId() : int
      {
         return this.var_281;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2009;
      }
   }
}
