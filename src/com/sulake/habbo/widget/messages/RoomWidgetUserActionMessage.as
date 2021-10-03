package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_802:String = "RWUAM_WHISPER_USER";
      
      public static const const_750:String = "RWUAM_IGNORE_USER";
      
      public static const const_828:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_533:String = "RWUAM_KICK_USER";
      
      public static const const_785:String = "RWUAM_BAN_USER";
      
      public static const const_689:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_732:String = "RWUAM_RESPECT_USER";
      
      public static const const_703:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_625:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_663:String = "RWUAM_START_TRADING";
      
      public static const const_755:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_564:String = "RWUAM_KICK_BOT";
      
      public static const const_773:String = "RWUAM_REPORT";
      
      public static const const_477:String = "RWUAM_PICKUP_PET";
      
      public static const const_1402:String = "RWUAM_TRAIN_PET";
      
      public static const const_486:String = " RWUAM_RESPECT_PET";
      
      public static const const_406:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_709:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
