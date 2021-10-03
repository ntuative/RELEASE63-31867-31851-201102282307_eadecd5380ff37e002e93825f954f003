package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_704:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_635:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_613:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_705:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         this.var_705 = param2;
      }
      
      public function get effectType() : int
      {
         return this.var_705;
      }
   }
}
