package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1521:Boolean;
      
      private var var_815:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1521 = param1.readBoolean();
         this.var_815 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1521 + ", " + this.var_815.id + ", " + this.var_815.name + ", " + this.var_815.type + ", " + this.var_815.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1521;
      }
      
      public function get pet() : PetData
      {
         return this.var_815;
      }
   }
}
