package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import flash.display.BitmapData;
   
   public class PlaneTextureBitmap
   {
      
      public static const const_56:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _bitmap:BitmapData = null;
      
      private var var_2179:Number = -1.0;
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_2177:Number = -1.0;
      
      private var var_2178:Number = 1.0;
      
      public function PlaneTextureBitmap(param1:BitmapData, param2:Number = -1.0, param3:Number = 1.0, param4:Number = -1.0, param5:Number = 1.0)
      {
         super();
         this.var_2179 = param2;
         this._normalMaxX = param3;
         this.var_2177 = param4;
         this.var_2178 = param5;
         this._bitmap = param1;
      }
      
      public function get bitmap() : BitmapData
      {
         return this._bitmap;
      }
      
      public function get normalMinX() : Number
      {
         return this.var_2179;
      }
      
      public function get normalMaxX() : Number
      {
         return this._normalMaxX;
      }
      
      public function get normalMinY() : Number
      {
         return this.var_2177;
      }
      
      public function get normalMaxY() : Number
      {
         return this.var_2178;
      }
      
      public function dispose() : void
      {
         this._bitmap = null;
      }
   }
}