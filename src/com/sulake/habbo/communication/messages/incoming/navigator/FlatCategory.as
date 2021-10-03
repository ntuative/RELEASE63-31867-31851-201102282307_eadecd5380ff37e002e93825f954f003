package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1569:int;
      
      private var var_2294:String;
      
      private var var_376:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1569 = param1.readInteger();
         this.var_2294 = param1.readString();
         this.var_376 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1569;
      }
      
      public function get nodeName() : String
      {
         return this.var_2294;
      }
      
      public function get visible() : Boolean
      {
         return this.var_376;
      }
   }
}
