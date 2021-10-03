package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_281:int;
      
      private var var_2009:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_281 = param1;
         this.var_2009 = param2;
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
