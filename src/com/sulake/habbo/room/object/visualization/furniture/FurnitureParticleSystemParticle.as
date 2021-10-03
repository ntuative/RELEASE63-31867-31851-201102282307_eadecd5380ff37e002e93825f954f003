package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.geom.Vector3D;
   
   public class FurnitureParticleSystemParticle
   {
       
      
      private var _x:Number;
      
      private var var_146:Number;
      
      private var var_147:Number;
      
      private var var_1528:Number;
      
      private var var_1527:Number;
      
      private var var_1529:Number;
      
      private var var_1014:Boolean = false;
      
      private var _direction:Vector3D;
      
      private var var_457:int = 0;
      
      private var var_822:int;
      
      private var var_2051:Boolean = false;
      
      private var var_1526:Boolean = false;
      
      private var var_1287:Number;
      
      private var _alphaMultiplier:Number = 1.0;
      
      private var _frames:Array;
      
      public function FurnitureParticleSystemParticle()
      {
         super();
      }
      
      public function get fade() : Boolean
      {
         return this.var_1526;
      }
      
      public function get alphaMultiplier() : Number
      {
         return this._alphaMultiplier;
      }
      
      public function get direction() : Vector3D
      {
         return this._direction;
      }
      
      public function get age() : int
      {
         return this.var_457;
      }
      
      public function init(param1:Number, param2:Number, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:int, param8:Boolean = false, param9:Array = null, param10:Boolean = false) : void
      {
         this._x = param1;
         this.var_146 = param2;
         this.var_147 = param3;
         this._direction = new Vector3D(param4.x,param4.y,param4.z);
         this._direction.scaleBy(param5);
         this.var_1528 = this._x - this._direction.x * param6;
         this.var_1527 = this.var_146 - this._direction.y * param6;
         this.var_1529 = this.var_147 - this._direction.z * param6;
         this.var_457 = 0;
         this.var_1014 = false;
         this.var_822 = param7;
         this.var_2051 = param8;
         this._frames = param9;
         this.var_1526 = param10;
         this._alphaMultiplier = 1;
         this.var_1287 = 0.5 + Math.random() * 0.5;
      }
      
      public function update() : void
      {
         ++this.var_457;
         if(this.var_457 == this.var_822)
         {
            this.ignite();
         }
         if(this.var_1526)
         {
            if(this.var_457 / this.var_822 > this.var_1287)
            {
               this._alphaMultiplier = (this.var_822 - this.var_457) / (this.var_822 * (1 - this.var_1287));
            }
         }
      }
      
      public function getAsset() : IGraphicAsset
      {
         if(this._frames && this._frames.length > 0)
         {
            return this._frames[this.var_457 % this._frames.length];
         }
         return null;
      }
      
      protected function ignite() : void
      {
      }
      
      public function get isEmitter() : Boolean
      {
         return this.var_2051;
      }
      
      public function get isAlive() : Boolean
      {
         return this.var_457 <= this.var_822;
      }
      
      public function dispose() : void
      {
         this._direction = null;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_146;
      }
      
      public function get z() : Number
      {
         return this.var_147;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         this.var_146 = param1;
      }
      
      public function set z(param1:Number) : void
      {
         this.var_147 = param1;
      }
      
      public function get lastX() : Number
      {
         return this.var_1528;
      }
      
      public function set lastX(param1:Number) : void
      {
         this.var_1014 = true;
         this.var_1528 = param1;
      }
      
      public function get lastY() : Number
      {
         return this.var_1527;
      }
      
      public function set lastY(param1:Number) : void
      {
         this.var_1014 = true;
         this.var_1527 = param1;
      }
      
      public function get lastZ() : Number
      {
         return this.var_1529;
      }
      
      public function set lastZ(param1:Number) : void
      {
         this.var_1014 = true;
         this.var_1529 = param1;
      }
      
      public function get hasMoved() : Boolean
      {
         return this.var_1014;
      }
      
      public function toString() : String
      {
         return [this._x,this.var_146,this.var_147].toString();
      }
   }
}
