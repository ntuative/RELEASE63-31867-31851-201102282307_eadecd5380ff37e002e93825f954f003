package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1561:int;
      
      private var var_1326:int;
      
      private var var_2078:int;
      
      private var var_2077:int;
      
      private var var_2080:int;
      
      private var _energy:int;
      
      private var var_2081:int;
      
      private var _nutrition:int;
      
      private var var_2076:int;
      
      private var var_2075:int;
      
      private var _ownerName:String;
      
      private var var_2079:int;
      
      private var var_457:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1561;
      }
      
      public function get level() : int
      {
         return this.var_1326;
      }
      
      public function get levelMax() : int
      {
         return this.var_2078;
      }
      
      public function get experience() : int
      {
         return this.var_2077;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2080;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2081;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2076;
      }
      
      public function get ownerId() : int
      {
         return this.var_2075;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2079;
      }
      
      public function get age() : int
      {
         return this.var_457;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1561 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1326 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2078 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2077 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2080 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2081 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2076 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2075 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2079 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_457 = param1;
      }
   }
}
