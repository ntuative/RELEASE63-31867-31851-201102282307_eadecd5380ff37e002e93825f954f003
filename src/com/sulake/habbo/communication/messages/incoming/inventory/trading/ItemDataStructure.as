package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2388:int;
      
      private var var_1300:String;
      
      private var var_2541:int;
      
      private var var_2545:int;
      
      private var _category:int;
      
      private var var_1986:String;
      
      private var var_1418:int;
      
      private var var_2546:int;
      
      private var var_2544:int;
      
      private var var_2543:int;
      
      private var var_2547:int;
      
      private var var_2542:Boolean;
      
      private var var_2824:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2388 = param1;
         this.var_1300 = param2;
         this.var_2541 = param3;
         this.var_2545 = param4;
         this._category = param5;
         this.var_1986 = param6;
         this.var_1418 = param7;
         this.var_2546 = param8;
         this.var_2544 = param9;
         this.var_2543 = param10;
         this.var_2547 = param11;
         this.var_2542 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2388;
      }
      
      public function get itemType() : String
      {
         return this.var_1300;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2541;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2545;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_1986;
      }
      
      public function get extra() : int
      {
         return this.var_1418;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2546;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2542;
      }
      
      public function get songID() : int
      {
         return this.var_1418;
      }
   }
}
