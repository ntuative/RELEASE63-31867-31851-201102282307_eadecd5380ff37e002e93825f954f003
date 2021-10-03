package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_924:String = "";
      
      private var var_645:String = "";
      
      private var var_2107:String = "";
      
      private var var_2110:int;
      
      private var var_2106:int = 0;
      
      private var var_2108:String = "";
      
      private var var_2105:int = 0;
      
      private var var_2109:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2110;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2110 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_924;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_924 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_645;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_645 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2107;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2107 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2106;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2106 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2108;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2108 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2105;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2105 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2109;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2109 = param1;
      }
   }
}
