package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_319:int = -1;
      
      private var var_1114:int = -1;
      
      private var var_1593:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_319;
      }
      
      public function get petType() : int
      {
         return this.var_1114;
      }
      
      public function get breed() : int
      {
         return this.var_1593;
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function flush() : Boolean
      {
         this.var_319 = -1;
         this.var_1114 = -1;
         this.var_1593 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_319 = param1.readInteger();
         this.var_1114 = param1.readInteger();
         this.var_1593 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}
