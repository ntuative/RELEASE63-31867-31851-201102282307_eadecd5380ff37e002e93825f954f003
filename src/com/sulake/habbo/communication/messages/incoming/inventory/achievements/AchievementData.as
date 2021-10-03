package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1326:int;
      
      private var var_281:String;
      
      private var var_2705:int;
      
      private var var_2317:int;
      
      private var var_1649:int;
      
      private var var_2704:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1326 = param1.readInteger();
         this.var_281 = param1.readString();
         this.var_2705 = param1.readInteger();
         this.var_2317 = param1.readInteger();
         this.var_1649 = param1.readInteger();
         this.var_2704 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_281;
      }
      
      public function get level() : int
      {
         return this.var_1326;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2705;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2317;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1649;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2704;
      }
   }
}
