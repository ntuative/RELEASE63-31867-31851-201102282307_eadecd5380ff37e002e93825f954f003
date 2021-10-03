package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_117:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_138:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1089:int = 2;
      
      public static const const_1011:int = 3;
      
      public static const const_1573:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1920:String = "";
      
      private var var_2110:int;
      
      private var var_2106:int = 0;
      
      private var var_2109:int = 0;
      
      private var var_645:String = "";
      
      private var var_44:BitmapData = null;
      
      private var var_256:Array;
      
      private var var_1755:Array;
      
      private var var_1421:int = 0;
      
      private var var_2480:String = "";
      
      private var var_2479:int = 0;
      
      private var var_2478:int = 0;
      
      private var var_1929:Boolean = false;
      
      private var var_1664:String = "";
      
      private var var_2650:Boolean = false;
      
      private var var_2653:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2651:Boolean = false;
      
      private var var_2656:Boolean = false;
      
      private var var_2652:Boolean = false;
      
      private var var_2654:Boolean = false;
      
      private var var_2657:Boolean = false;
      
      private var var_2658:Boolean = false;
      
      private var var_2655:int = 0;
      
      private var var_1931:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_256 = [];
         this.var_1755 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1920 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1920;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2110 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2110;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2106 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2106;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2109 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2109;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_645 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_645;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_44 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_44;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_256 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_256;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1755;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1755 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1421 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1421;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2480 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2480;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2650 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2650;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2651 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2651;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2656 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2656;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2652 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2652;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2654 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2654;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2657 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2657;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2658 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2658;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2655 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2655;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2653 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2653;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1931 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1931;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2479 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2479;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2478 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2478;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1929 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1929;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1664 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1664;
      }
   }
}
