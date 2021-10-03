package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1419:IID;
      
      private var var_1804:String;
      
      private var var_103:IUnknown;
      
      private var var_740:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1419 = param1;
         this.var_1804 = getQualifiedClassName(this.var_1419);
         this.var_103 = param2;
         this.var_740 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1419;
      }
      
      public function get iis() : String
      {
         return this.var_1804;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_103;
      }
      
      public function get references() : uint
      {
         return this.var_740;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_103 == null;
      }
      
      public function dispose() : void
      {
         this.var_1419 = null;
         this.var_1804 = null;
         this.var_103 = null;
         this.var_740 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_740;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_740) : uint(0);
      }
   }
}
