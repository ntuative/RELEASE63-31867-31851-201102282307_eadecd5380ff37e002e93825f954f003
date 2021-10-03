package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2160:Number;
      
      private var var_1858:Number;
      
      private var var_851:Number;
      
      private var var_852:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2160 = param1;
         this.var_1858 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_851 = param1;
         this.var_852 = 0;
      }
      
      public function update() : void
      {
         this.var_851 += this.var_1858;
         this.var_852 += this.var_851;
         if(this.var_852 > 0)
         {
            this.var_852 = 0;
            this.var_851 = this.var_2160 * -1 * this.var_851;
         }
      }
      
      public function get location() : Number
      {
         return this.var_852;
      }
   }
}
