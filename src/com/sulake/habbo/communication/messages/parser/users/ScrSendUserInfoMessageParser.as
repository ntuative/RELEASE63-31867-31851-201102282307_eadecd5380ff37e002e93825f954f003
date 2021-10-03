package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1890:int = 1;
      
      public static const const_1589:int = 2;
       
      
      private var var_882:String;
      
      private var var_2238:int;
      
      private var var_2241:int;
      
      private var var_2242:int;
      
      private var var_2240:int;
      
      private var var_2247:Boolean;
      
      private var var_2243:Boolean;
      
      private var var_2246:int;
      
      private var var_2248:int;
      
      private var var_2245:Boolean;
      
      private var var_2244:int;
      
      private var var_2239:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_882 = param1.readString();
         this.var_2238 = param1.readInteger();
         this.var_2241 = param1.readInteger();
         this.var_2242 = param1.readInteger();
         this.var_2240 = param1.readInteger();
         this.var_2247 = param1.readBoolean();
         this.var_2243 = param1.readBoolean();
         this.var_2246 = param1.readInteger();
         this.var_2248 = param1.readInteger();
         this.var_2245 = param1.readBoolean();
         this.var_2244 = param1.readInteger();
         this.var_2239 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_882;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2238;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2241;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2242;
      }
      
      public function get responseType() : int
      {
         return this.var_2240;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2247;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2243;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2246;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2248;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2245;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2244;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2239;
      }
   }
}
