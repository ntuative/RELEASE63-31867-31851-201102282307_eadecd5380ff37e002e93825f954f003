package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_665:String = "";
      
      public static const const_455:int = 0;
      
      public static const const_430:int = 255;
      
      public static const const_747:Boolean = false;
      
      public static const const_541:int = 0;
      
      public static const const_451:int = 0;
      
      public static const const_447:int = 0;
      
      public static const const_1030:int = 1;
      
      public static const const_1127:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2045:String = "";
      
      private var var_1911:int = 0;
      
      private var var_2041:int = 255;
      
      private var var_2046:Boolean = false;
      
      private var var_2042:int = 0;
      
      private var var_2043:int = 0;
      
      private var var_2044:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2045 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2045;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1911 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1911;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2041 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2041;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2046 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2046;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2042 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2042;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2043 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2043;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2044 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2044;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
