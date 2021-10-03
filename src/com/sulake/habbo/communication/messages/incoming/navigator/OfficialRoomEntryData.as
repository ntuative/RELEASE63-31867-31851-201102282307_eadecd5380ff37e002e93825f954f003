package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1076:int = 1;
      
      public static const const_620:int = 2;
      
      public static const const_645:int = 3;
      
      public static const const_1609:int = 4;
       
      
      private var _index:int;
      
      private var var_2113:String;
      
      private var var_2115:String;
      
      private var var_2111:Boolean;
      
      private var var_2112:String;
      
      private var var_936:String;
      
      private var var_2114:int;
      
      private var var_2032:int;
      
      private var _type:int;
      
      private var var_2045:String;
      
      private var var_832:GuestRoomData;
      
      private var var_831:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2113 = param1.readString();
         this.var_2115 = param1.readString();
         this.var_2111 = param1.readInteger() == 1;
         this.var_2112 = param1.readString();
         this.var_936 = param1.readString();
         this.var_2114 = param1.readInteger();
         this.var_2032 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1076)
         {
            this.var_2045 = param1.readString();
         }
         else if(this._type == const_645)
         {
            this.var_831 = new PublicRoomData(param1);
         }
         else if(this._type == const_620)
         {
            this.var_832 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_832 != null)
         {
            this.var_832.dispose();
            this.var_832 = null;
         }
         if(this.var_831 != null)
         {
            this.var_831.dispose();
            this.var_831 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2113;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2115;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2111;
      }
      
      public function get picText() : String
      {
         return this.var_2112;
      }
      
      public function get picRef() : String
      {
         return this.var_936;
      }
      
      public function get folderId() : int
      {
         return this.var_2114;
      }
      
      public function get tag() : String
      {
         return this.var_2045;
      }
      
      public function get userCount() : int
      {
         return this.var_2032;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_832;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_831;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1076)
         {
            return 0;
         }
         if(this.type == const_620)
         {
            return this.var_832.maxUserCount;
         }
         if(this.type == const_645)
         {
            return this.var_831.maxUsers;
         }
         return 0;
      }
   }
}
