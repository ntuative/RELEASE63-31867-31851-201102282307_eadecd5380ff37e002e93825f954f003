package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2158:int;
      
      private var var_1665:String;
      
      private var var_2334:String;
      
      private var var_2609:Boolean;
      
      private var var_2610:Boolean;
      
      private var var_2607:int;
      
      private var var_2335:String;
      
      private var var_2608:String;
      
      private var var_1664:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2158 = param1.readInteger();
         this.var_1665 = param1.readString();
         this.var_2334 = param1.readString();
         this.var_2609 = param1.readBoolean();
         this.var_2610 = param1.readBoolean();
         param1.readString();
         this.var_2607 = param1.readInteger();
         this.var_2335 = param1.readString();
         this.var_2608 = param1.readString();
         this.var_1664 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2158;
      }
      
      public function get avatarName() : String
      {
         return this.var_1665;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2334;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2609;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2610;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2607;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2335;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2608;
      }
      
      public function get realName() : String
      {
         return this.var_1664;
      }
   }
}
