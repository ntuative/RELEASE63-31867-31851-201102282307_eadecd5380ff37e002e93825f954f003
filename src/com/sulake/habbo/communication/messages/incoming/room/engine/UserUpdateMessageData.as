package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_146:Number = 0;
      
      private var var_147:Number = 0;
      
      private var var_2170:Number = 0;
      
      private var var_2173:Number = 0;
      
      private var var_2174:Number = 0;
      
      private var var_2172:Number = 0;
      
      private var var_266:int = 0;
      
      private var var_2175:int = 0;
      
      private var var_315:Array;
      
      private var var_2171:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_315 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_146 = param3;
         this.var_147 = param4;
         this.var_2170 = param5;
         this.var_266 = param6;
         this.var_2175 = param7;
         this.var_2173 = param8;
         this.var_2174 = param9;
         this.var_2172 = param10;
         this.var_2171 = param11;
         this.var_315 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
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
      
      public function get localZ() : Number
      {
         return this.var_2170;
      }
      
      public function get targetX() : Number
      {
         return this.var_2173;
      }
      
      public function get targetY() : Number
      {
         return this.var_2174;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2172;
      }
      
      public function get dir() : int
      {
         return this.var_266;
      }
      
      public function get dirHead() : int
      {
         return this.var_2175;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2171;
      }
      
      public function get actions() : Array
      {
         return this.var_315.slice();
      }
   }
}
