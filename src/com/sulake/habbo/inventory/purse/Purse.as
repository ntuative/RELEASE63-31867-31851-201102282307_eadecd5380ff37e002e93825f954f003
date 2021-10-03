package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1765:int = 0;
      
      private var var_1766:int = 0;
      
      private var var_2721:int = 0;
      
      private var var_2722:Boolean = false;
      
      private var var_2243:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1765 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1766 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2721 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2722 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2243 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1765;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1766;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2721;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2722;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2243;
      }
   }
}
