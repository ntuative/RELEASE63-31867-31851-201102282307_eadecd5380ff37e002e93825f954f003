package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChangeMottoMessage extends RoomWidgetMessage
   {
      
      public static const const_671:String = "RWVM_CHANGE_MOTTO_MESSAGE";
       
      
      private var var_1920:String;
      
      public function RoomWidgetChangeMottoMessage(param1:String)
      {
         super(const_671);
         this.var_1920 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1920;
      }
   }
}
