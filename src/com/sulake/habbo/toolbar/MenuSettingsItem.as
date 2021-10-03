package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2286:String;
      
      private var var_2287:Array;
      
      private var var_2285:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2286 = param1;
         this.var_2287 = param2;
         this.var_2285 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2286;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2287;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2285;
      }
   }
}
