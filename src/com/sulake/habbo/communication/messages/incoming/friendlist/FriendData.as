package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_987:int;
      
      private var var_695:Boolean;
      
      private var var_1762:Boolean;
      
      private var var_645:String;
      
      private var var_1288:int;
      
      private var var_1920:String;
      
      private var var_1663:String;
      
      private var var_1664:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_987 = param1.readInteger();
         this.var_695 = param1.readBoolean();
         this.var_1762 = param1.readBoolean();
         this.var_645 = param1.readString();
         this.var_1288 = param1.readInteger();
         this.var_1920 = param1.readString();
         this.var_1663 = param1.readString();
         this.var_1664 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_987;
      }
      
      public function get online() : Boolean
      {
         return this.var_695;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1762;
      }
      
      public function get figure() : String
      {
         return this.var_645;
      }
      
      public function get categoryId() : int
      {
         return this.var_1288;
      }
      
      public function get motto() : String
      {
         return this.var_1920;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1663;
      }
      
      public function get realName() : String
      {
         return this.var_1664;
      }
   }
}
