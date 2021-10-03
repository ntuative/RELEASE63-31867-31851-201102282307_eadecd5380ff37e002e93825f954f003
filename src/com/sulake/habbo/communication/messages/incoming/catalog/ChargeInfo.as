package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2255:int;
      
      private var var_2565:int;
      
      private var var_1085:int;
      
      private var var_1084:int;
      
      private var var_1651:int;
      
      private var var_2564:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2255 = param1.readInteger();
         this.var_2565 = param1.readInteger();
         this.var_1085 = param1.readInteger();
         this.var_1084 = param1.readInteger();
         this.var_1651 = param1.readInteger();
         this.var_2564 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2255;
      }
      
      public function get charges() : int
      {
         return this.var_2565;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1085;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1084;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2564;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1651;
      }
   }
}
