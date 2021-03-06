package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1936:int;
      
      private var var_2374:String;
      
      private var var_987:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1936 = param1.readInteger();
         this.var_2374 = param1.readString();
         this.var_987 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1936;
      }
      
      public function get figureString() : String
      {
         return this.var_2374;
      }
      
      public function get gender() : String
      {
         return this.var_987;
      }
   }
}
