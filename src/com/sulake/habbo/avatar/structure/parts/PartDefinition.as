package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2640:String;
      
      private var var_1875:String;
      
      private var var_2639:String;
      
      private var var_1877:Boolean;
      
      private var var_1876:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2640 = String(param1["set-type"]);
         this.var_1875 = String(param1["flipped-set-type"]);
         this.var_2639 = String(param1["remove-set-type"]);
         this.var_1877 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1876 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1876;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1876 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2640;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1875;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2639;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1877;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1877 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1875 = param1;
      }
   }
}
