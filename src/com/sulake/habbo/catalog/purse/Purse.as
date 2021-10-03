package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_172:int = 0;
       
      
      private var var_2331:int = 0;
      
      private var var_1395:Dictionary;
      
      private var var_1765:int = 0;
      
      private var var_1766:int = 0;
      
      private var var_2243:Boolean = false;
      
      private var var_2246:int = 0;
      
      private var var_2248:int = 0;
      
      public function Purse()
      {
         this.var_1395 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2331;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2331 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1765;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1765 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1766;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1766 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1765 > 0 || this.var_1766 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2243;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2243 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2246;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2246 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2248;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2248 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1395;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1395 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1395[param1];
      }
   }
}
