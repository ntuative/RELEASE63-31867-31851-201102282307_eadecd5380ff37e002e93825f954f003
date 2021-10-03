package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1454:String = "WN_CRETAE";
      
      public static const const_1440:String = "WN_CREATED";
      
      public static const const_1183:String = "WN_DESTROY";
      
      public static const const_1090:String = "WN_DESTROYED";
      
      public static const const_1136:String = "WN_OPEN";
      
      public static const const_1150:String = "WN_OPENED";
      
      public static const const_1138:String = "WN_CLOSE";
      
      public static const const_1079:String = "WN_CLOSED";
      
      public static const const_1051:String = "WN_FOCUS";
      
      public static const const_997:String = "WN_FOCUSED";
      
      public static const const_1071:String = "WN_UNFOCUS";
      
      public static const const_1160:String = "WN_UNFOCUSED";
      
      public static const const_1037:String = "WN_ACTIVATE";
      
      public static const const_378:String = "WN_ACTVATED";
      
      public static const const_989:String = "WN_DEACTIVATE";
      
      public static const const_1181:String = "WN_DEACTIVATED";
      
      public static const const_506:String = "WN_SELECT";
      
      public static const const_401:String = "WN_SELECTED";
      
      public static const const_842:String = "WN_UNSELECT";
      
      public static const const_795:String = "WN_UNSELECTED";
      
      public static const const_1066:String = "WN_LOCK";
      
      public static const const_1050:String = "WN_LOCKED";
      
      public static const const_1009:String = "WN_UNLOCK";
      
      public static const const_1047:String = "WN_UNLOCKED";
      
      public static const const_1010:String = "WN_ENABLE";
      
      public static const const_748:String = "WN_ENABLED";
      
      public static const const_1033:String = "WN_DISABLE";
      
      public static const const_700:String = "WN_DISABLED";
      
      public static const const_739:String = "WN_RESIZE";
      
      public static const const_202:String = "WN_RESIZED";
      
      public static const const_1038:String = "WN_RELOCATE";
      
      public static const const_513:String = "WN_RELOCATED";
      
      public static const const_1101:String = "WN_MINIMIZE";
      
      public static const const_1078:String = "WN_MINIMIZED";
      
      public static const const_1104:String = "WN_MAXIMIZE";
      
      public static const const_1137:String = "WN_MAXIMIZED";
      
      public static const const_1180:String = "WN_RESTORE";
      
      public static const const_1205:String = "WN_RESTORED";
      
      public static const const_1872:String = "WN_ARRANGE";
      
      public static const const_1806:String = "WN_ARRANGED";
      
      public static const const_1720:String = "WN_UPDATE";
      
      public static const const_1846:String = "WN_UPDATED";
      
      public static const const_360:String = "WN_CHILD_ADDED";
      
      public static const const_820:String = "WN_CHILD_REMOVED";
      
      public static const const_282:String = "WN_CHILD_RESIZED";
      
      public static const const_325:String = "WN_CHILD_RELOCATED";
      
      public static const const_220:String = "WN_CHILD_ACTIVATED";
      
      public static const const_578:String = "WN_PARENT_ADDED";
      
      public static const const_1098:String = "WN_PARENT_REMOVED";
      
      public static const const_566:String = "WN_PARENT_RESIZED";
      
      public static const const_1023:String = "WN_PARENT_RELOCATED";
      
      public static const const_761:String = "WN_PARENT_ACTIVATED";
      
      public static const const_468:String = "WN_STATE_UPDATED";
      
      public static const const_471:String = "WN_STYLE_UPDATED";
      
      public static const const_465:String = "WN_PARAM_UPDATED";
      
      public static const const_1877:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1980,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
