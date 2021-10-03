package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_723:String = "RWFUAM_ROTATE";
      
      public static const const_322:String = "RWFAM_MOVE";
      
      public static const const_862:String = "RWFAM_PICKUP";
       
      
      private var _furniId:int = 0;
      
      private var var_2716:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         this._furniId = param2;
         this.var_2716 = param3;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniCategory() : int
      {
         return this.var_2716;
      }
   }
}
