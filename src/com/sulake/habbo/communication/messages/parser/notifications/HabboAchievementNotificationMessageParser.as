package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1326:int;
      
      private var var_1887:int;
      
      private var var_2317:int;
      
      private var var_1649:int;
      
      private var var_1325:int;
      
      private var var_2161:String = "";
      
      private var var_2379:String = "";
      
      private var var_2378:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1326 = param1.readInteger();
         this.var_2161 = param1.readString();
         this.var_1887 = param1.readInteger();
         this.var_2317 = param1.readInteger();
         this.var_1649 = param1.readInteger();
         this.var_1325 = param1.readInteger();
         this.var_2378 = param1.readInteger();
         this.var_2379 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1326;
      }
      
      public function get points() : int
      {
         return this.var_1887;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2317;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1649;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1325;
      }
      
      public function get badgeID() : String
      {
         return this.var_2161;
      }
      
      public function get achievementID() : int
      {
         return this.var_2378;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2379;
      }
   }
}
