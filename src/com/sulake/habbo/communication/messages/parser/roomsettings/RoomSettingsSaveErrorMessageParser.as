package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1766:int = 1;
      
      public static const const_1796:int = 2;
      
      public static const const_1768:int = 3;
      
      public static const const_1776:int = 4;
      
      public static const const_1495:int = 5;
      
      public static const const_1721:int = 6;
      
      public static const const_1381:int = 7;
      
      public static const const_1588:int = 8;
      
      public static const const_1742:int = 9;
      
      public static const const_1581:int = 10;
      
      public static const const_1590:int = 11;
      
      public static const const_1543:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1544:int;
      
      private var var_1313:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1544 = param1.readInteger();
         this.var_1313 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1544;
      }
      
      public function get info() : String
      {
         return this.var_1313;
      }
   }
}
