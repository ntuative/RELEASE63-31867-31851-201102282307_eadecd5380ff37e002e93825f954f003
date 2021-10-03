package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1561:int;
      
      private var var_2513:String;
      
      private var var_1326:int;
      
      private var var_1114:int;
      
      private var var_1593:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1561 = param1.readInteger();
         this.var_2513 = param1.readString();
         this.var_1326 = param1.readInteger();
         this.var_1114 = param1.readInteger();
         this.var_1593 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1561;
      }
      
      public function get petName() : String
      {
         return this.var_2513;
      }
      
      public function get level() : int
      {
         return this.var_1326;
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
   }
}
