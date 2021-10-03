package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_319:int;
      
      private var var_2513:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_319 = param1;
         this.var_2513 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_319,this.var_2513];
      }
      
      public function dispose() : void
      {
      }
   }
}
