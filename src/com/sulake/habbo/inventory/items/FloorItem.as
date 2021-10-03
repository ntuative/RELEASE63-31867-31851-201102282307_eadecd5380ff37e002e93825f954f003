package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_1986:String;
      
      protected var var_1418:Number;
      
      protected var var_2746:Boolean;
      
      protected var var_2744:Boolean;
      
      protected var var_2542:Boolean;
      
      protected var var_2131:Boolean;
      
      protected var var_2745:int;
      
      protected var var_2544:int;
      
      protected var var_2543:int;
      
      protected var var_2547:int;
      
      protected var var_1936:String;
      
      protected var var_2010:int;
      
      protected var var_964:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2542 = param5;
         this.var_2744 = param6;
         this.var_2746 = param7;
         this.var_2131 = param8;
         this.var_1986 = param9;
         this.var_1418 = param10;
         this.var_2745 = param11;
         this.var_2544 = param12;
         this.var_2543 = param13;
         this.var_2547 = param14;
         this.var_1936 = param15;
         this.var_2010 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_1986;
      }
      
      public function get extra() : Number
      {
         return this.var_1418;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2746;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2744;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2542;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2131;
      }
      
      public function get expires() : int
      {
         return this.var_2745;
      }
      
      public function get creationDay() : int
      {
         return this.var_2544;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2543;
      }
      
      public function get creationYear() : int
      {
         return this.var_2547;
      }
      
      public function get slotId() : String
      {
         return this.var_1936;
      }
      
      public function get songId() : int
      {
         return this.var_2010;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_964 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_964;
      }
   }
}
