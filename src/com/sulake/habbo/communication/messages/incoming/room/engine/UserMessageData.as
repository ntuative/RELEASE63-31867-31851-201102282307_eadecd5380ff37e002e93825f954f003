package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1091:String = "M";
      
      public static const const_1651:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_146:Number = 0;
      
      private var var_147:Number = 0;
      
      private var var_266:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_924:String = "";
      
      private var var_645:String = "";
      
      private var var_2107:String = "";
      
      private var var_2110:int;
      
      private var var_2106:int = 0;
      
      private var var_2108:String = "";
      
      private var var_2105:int = 0;
      
      private var var_2109:int = 0;
      
      private var var_2632:String = "";
      
      private var var_180:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_180 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_180)
         {
            this._x = param1;
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
      
      public function get dir() : int
      {
         return this.var_266;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_266 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_180)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_180)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_924;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_924 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_645;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_645 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2107;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_2107 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2110;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_2110 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2106;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_2106 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2108;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_2108 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2105;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_2105 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2109;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_180)
         {
            this.var_2109 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2632;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_180)
         {
            this.var_2632 = param1;
         }
      }
   }
}
