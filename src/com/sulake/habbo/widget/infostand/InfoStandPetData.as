package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1326:int;
      
      private var var_2078:int;
      
      private var var_2077:int;
      
      private var var_2080:int;
      
      private var _energy:int;
      
      private var var_2081:int;
      
      private var _nutrition:int;
      
      private var var_2076:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1561:int = -1;
      
      private var _type:int;
      
      private var var_2155:int;
      
      private var var_44:BitmapData;
      
      private var var_2156:Boolean;
      
      private var var_2075:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2154:int;
      
      private var var_457:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1561;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2155;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2156;
      }
      
      public function get ownerId() : int
      {
         return this.var_2075;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get age() : int
      {
         return this.var_457;
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
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2154;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1561 = param1.id;
         this._type = param1.petType;
         this.var_2155 = param1.petRace;
         this.var_44 = param1.image;
         this.var_2156 = param1.isOwnPet;
         this.var_2075 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1326 = param1.level;
         this.var_2078 = param1.levelMax;
         this.var_2077 = param1.experience;
         this.var_2080 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2081 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2076 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2154 = param1.roomIndex;
         this.var_457 = param1.age;
      }
   }
}
