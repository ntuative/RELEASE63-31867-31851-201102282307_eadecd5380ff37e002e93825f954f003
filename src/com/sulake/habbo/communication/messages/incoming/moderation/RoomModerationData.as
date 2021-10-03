package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_371:int;
      
      private var var_2032:int;
      
      private var var_2515:Boolean;
      
      private var var_2075:int;
      
      private var _ownerName:String;
      
      private var var_113:RoomData;
      
      private var var_763:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_371 = param1.readInteger();
         this.var_2032 = param1.readInteger();
         this.var_2515 = param1.readBoolean();
         this.var_2075 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_113 = new RoomData(param1);
         this.var_763 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_113 != null)
         {
            this.var_113.dispose();
            this.var_113 = null;
         }
         if(this.var_763 != null)
         {
            this.var_763.dispose();
            this.var_763 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_371;
      }
      
      public function get userCount() : int
      {
         return this.var_2032;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2515;
      }
      
      public function get ownerId() : int
      {
         return this.var_2075;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_113;
      }
      
      public function get event() : RoomData
      {
         return this.var_763;
      }
   }
}
