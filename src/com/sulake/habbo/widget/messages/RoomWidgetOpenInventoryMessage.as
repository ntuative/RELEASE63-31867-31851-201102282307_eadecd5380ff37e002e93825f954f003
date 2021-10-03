package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_646:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1144:String = "inventory_effects";
      
      public static const const_975:String = "inventory_badges";
      
      public static const const_1586:String = "inventory_clothes";
      
      public static const const_1398:String = "inventory_furniture";
       
      
      private var var_2330:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_646);
         this.var_2330 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2330;
      }
   }
}
