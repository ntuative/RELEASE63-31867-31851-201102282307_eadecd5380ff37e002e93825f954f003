package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2209:int;
      
      private var var_2210:int;
      
      private var var_695:Boolean;
      
      private var var_2212:int;
      
      private var var_2214:int;
      
      private var var_2213:int;
      
      private var var_2211:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2209 = param1.readInteger();
         this.var_2210 = param1.readInteger();
         this.var_695 = param1.readBoolean();
         this.var_2212 = param1.readInteger();
         this.var_2214 = param1.readInteger();
         this.var_2213 = param1.readInteger();
         this.var_2211 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2209;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2210;
      }
      
      public function get online() : Boolean
      {
         return this.var_695;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2212;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2214;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2213;
      }
      
      public function get banCount() : int
      {
         return this.var_2211;
      }
   }
}
