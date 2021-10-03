package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_236:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2661:int = 0;
      
      private var var_2660:int = 0;
      
      private var var_2662:int = 0;
      
      private var var_2659:Boolean = false;
      
      private var var_2477:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_236,param6,param7);
         this.var_2661 = param1;
         this.var_2660 = param2;
         this.var_2662 = param3;
         this.var_2659 = param4;
         this.var_2477 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2661;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2660;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2662;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2659;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2477;
      }
   }
}
