package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_645:String;
      
      private var var_924:String;
      
      private var var_2355:String;
      
      private var var_1664:String;
      
      private var var_2352:int;
      
      private var var_2353:String;
      
      private var var_2351:int;
      
      private var var_2356:int;
      
      private var var_2354:int;
      
      private var _respectLeft:int;
      
      private var var_736:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_645 = param1.readString();
         this.var_924 = param1.readString();
         this.var_2355 = param1.readString();
         this.var_1664 = param1.readString();
         this.var_2352 = param1.readInteger();
         this.var_2353 = param1.readString();
         this.var_2351 = param1.readInteger();
         this.var_2356 = param1.readInteger();
         this.var_2354 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_736 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_645;
      }
      
      public function get sex() : String
      {
         return this.var_924;
      }
      
      public function get customData() : String
      {
         return this.var_2355;
      }
      
      public function get realName() : String
      {
         return this.var_1664;
      }
      
      public function get tickets() : int
      {
         return this.var_2352;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2353;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2351;
      }
      
      public function get directMail() : int
      {
         return this.var_2356;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2354;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_736;
      }
   }
}
