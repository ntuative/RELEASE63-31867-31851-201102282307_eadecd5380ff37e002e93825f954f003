package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_579:int = 0;
      
      public static const const_173:int = 1;
      
      public static const const_119:int = 2;
      
      public static const const_697:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1507:String;
      
      private var var_2065:int;
      
      private var var_1288:int;
      
      private var var_2063:int;
      
      private var var_2068:int;
      
      private var var_799:Array;
      
      private var var_2062:Array;
      
      private var var_2061:int;
      
      private var var_2069:Boolean;
      
      private var var_2067:Boolean;
      
      private var var_2066:Boolean;
      
      private var var_2064:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2069;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2069 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2067;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2067 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2066;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2066 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2064;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2064 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1507;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1507 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2065;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2065 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1288;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1288 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2063;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2063 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2068;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2068 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_799;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_799 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2062;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2062 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2061;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2061 = param1;
      }
   }
}
