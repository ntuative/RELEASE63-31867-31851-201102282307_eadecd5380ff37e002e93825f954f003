package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1859:IID;
      
      private var var_659:Boolean;
      
      private var var_1173:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1859 = param1;
         this.var_1173 = new Array();
         this.var_659 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1859;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_659;
      }
      
      public function get receivers() : Array
      {
         return this.var_1173;
      }
      
      public function dispose() : void
      {
         if(!this.var_659)
         {
            this.var_659 = true;
            this.var_1859 = null;
            while(this.var_1173.length > 0)
            {
               this.var_1173.pop();
            }
            this.var_1173 = null;
         }
      }
   }
}
