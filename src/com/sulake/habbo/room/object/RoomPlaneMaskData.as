package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2342:Number = 0.0;
      
      private var var_2345:Number = 0.0;
      
      private var var_2344:Number = 0.0;
      
      private var var_2343:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2342 = param1;
         this.var_2345 = param2;
         this.var_2344 = param3;
         this.var_2343 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2342;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2345;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2344;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2343;
      }
   }
}
