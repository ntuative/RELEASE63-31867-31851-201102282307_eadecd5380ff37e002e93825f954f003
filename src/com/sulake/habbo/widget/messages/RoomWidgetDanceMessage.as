package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_775:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1196:int = 0;
      
      public static const const_1368:Array = [2,3,4];
       
      
      private var var_82:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_775);
         this.var_82 = param1;
      }
      
      public function get style() : int
      {
         return this.var_82;
      }
   }
}
