package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserGivableBadgesUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_688:String = "RWUGBUE_USER_GIVABLE_BADGES";
       
      
      private var var_256:Array;
      
      public function RoomWidgetUserGivableBadgesUpdateEvent(param1:Array, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_256 = [];
         super(const_688,param2,param3);
         this.var_256 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_256;
      }
   }
}
