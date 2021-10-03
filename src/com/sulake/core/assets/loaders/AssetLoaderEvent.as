package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_28:String = "AssetLoaderEventComplete";
      
      public static const const_1048:String = "AssetLoaderEventProgress";
      
      public static const const_1157:String = "AssetLoaderEventUnload";
      
      public static const const_1130:String = "AssetLoaderEventStatus";
      
      public static const const_45:String = "AssetLoaderEventError";
      
      public static const const_1188:String = "AssetLoaderEventOpen";
       
      
      private var var_378:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_378 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_378;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_378);
      }
   }
}
