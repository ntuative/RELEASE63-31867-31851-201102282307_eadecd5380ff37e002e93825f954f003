package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_342:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1110:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1053:String = "RWOCM_PIXELS";
      
      public static const const_1108:String = "RWOCM_CREDITS";
       
      
      private var var_2539:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_342);
         this.var_2539 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2539;
      }
   }
}
