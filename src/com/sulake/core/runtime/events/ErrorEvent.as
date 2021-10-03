package com.sulake.core.runtime.events
{
   public class ErrorEvent extends WarningEvent
   {
       
      
      protected var var_2754:Boolean;
      
      protected var var_1697:String;
      
      public function ErrorEvent(param1:String, param2:String, param3:Boolean, param4:String = null)
      {
         this.var_2754 = param3;
         this.var_1697 = param4;
         super(param1,param2);
      }
      
      public function get method_9() : Boolean
      {
         return this.var_2754;
      }
      
      public function get stackTrace() : String
      {
         return this.var_1697;
      }
   }
}
