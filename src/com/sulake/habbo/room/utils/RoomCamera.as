package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_929:int = 3;
       
      
      private var var_2303:int = -1;
      
      private var var_2298:int = -2;
      
      private var var_338:Vector3d = null;
      
      private var var_400:Vector3d = null;
      
      private var var_2299:Boolean = false;
      
      private var var_2302:Boolean = false;
      
      private var var_2304:Boolean = false;
      
      private var var_2305:Boolean = false;
      
      private var var_2297:int = 0;
      
      private var var_2300:int = 0;
      
      private var var_2306:int = 0;
      
      private var var_2301:int = 0;
      
      private var var_1322:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_400;
      }
      
      public function get targetId() : int
      {
         return this.var_2303;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2298;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2299;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2302;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2304;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2305;
      }
      
      public function get screenWd() : int
      {
         return this.var_2297;
      }
      
      public function get screenHt() : int
      {
         return this.var_2300;
      }
      
      public function get roomWd() : int
      {
         return this.var_2306;
      }
      
      public function get roomHt() : int
      {
         return this.var_2301;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2303 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2298 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2299 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2302 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2304 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2305 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2297 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2300 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2306 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2301 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_338 == null)
         {
            this.var_338 = new Vector3d();
         }
         if(this.var_338.x != param1.x || this.var_338.y != param1.y || this.var_338.z != param1.z)
         {
            this.var_338.assign(param1);
            this.var_1322 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_338 = null;
         this.var_400 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_400 != null)
         {
            return;
         }
         this.var_400 = new Vector3d();
         this.var_400.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_338 != null && this.var_400 != null)
         {
            ++this.var_1322;
            _loc4_ = Vector3d.dif(this.var_338,this.var_400);
            if(_loc4_.length <= param2)
            {
               this.var_400 = this.var_338;
               this.var_338 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_929 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1322 <= const_929)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_400 = Vector3d.sum(this.var_400,_loc4_);
            }
         }
      }
   }
}
