package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2056:String;
      
      private var var_2055:int;
      
      private var var_2058:int;
      
      private var var_2059:String;
      
      private var var_2057:int;
      
      private var var_1569:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2056 = param1.readString();
         this.var_2055 = param1.readInteger();
         this.var_2058 = param1.readInteger();
         this.var_2059 = param1.readString();
         this.var_2057 = param1.readInteger();
         this.var_1569 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2056;
      }
      
      public function get unitPort() : int
      {
         return this.var_2055;
      }
      
      public function get worldId() : int
      {
         return this.var_2058;
      }
      
      public function get castLibs() : String
      {
         return this.var_2059;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2057;
      }
      
      public function get nodeId() : int
      {
         return this.var_1569;
      }
   }
}
