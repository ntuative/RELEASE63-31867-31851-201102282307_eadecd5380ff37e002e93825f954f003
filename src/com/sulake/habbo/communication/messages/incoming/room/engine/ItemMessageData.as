package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2252:Boolean = false;
      
      private var var_2249:int = 0;
      
      private var var_2251:int = 0;
      
      private var var_2253:int = 0;
      
      private var var_2250:int = 0;
      
      private var var_146:Number = 0;
      
      private var var_147:Number = 0;
      
      private var var_266:String = "";
      
      private var _type:int = 0;
      
      private var var_2814:String = "";
      
      private var var_1418:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_180:Boolean = false;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2252 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_180 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2252;
      }
      
      public function get wallX() : Number
      {
         return this.var_2249;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_180)
         {
            this.var_2249 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2251;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_180)
         {
            this.var_2251 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2253;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_180)
         {
            this.var_2253 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2250;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_180)
         {
            this.var_2250 = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_146;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_180)
         {
            this.var_146 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_147;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_180)
         {
            this.var_147 = param1;
         }
      }
      
      public function get dir() : String
      {
         return this.var_266;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_266 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_180)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_180)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_180)
         {
            this._data = param1;
         }
      }
   }
}
