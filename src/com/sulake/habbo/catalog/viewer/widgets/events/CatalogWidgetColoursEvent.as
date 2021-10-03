package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_975:Array;
      
      private var var_2485:String;
      
      private var var_2484:String;
      
      private var var_2483:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         this.var_975 = param1;
         this.var_2485 = param2;
         this.var_2484 = param3;
         this.var_2483 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_975;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2485;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2484;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2483;
      }
   }
}
