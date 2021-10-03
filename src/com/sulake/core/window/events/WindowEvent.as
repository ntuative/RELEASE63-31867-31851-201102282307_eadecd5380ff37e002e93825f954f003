package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1396:String = "WE_CREATE";
      
      public static const const_1583:String = "WE_CREATED";
      
      public static const const_1465:String = "WE_DESTROY";
      
      public static const const_295:String = "WE_DESTROYED";
      
      public static const const_1567:String = "WE_OPEN";
      
      public static const const_1627:String = "WE_OPENED";
      
      public static const const_1572:String = "WE_CLOSE";
      
      public static const const_1428:String = "WE_CLOSED";
      
      public static const const_1433:String = "WE_FOCUS";
      
      public static const const_300:String = "WE_FOCUSED";
      
      public static const const_1621:String = "WE_UNFOCUS";
      
      public static const const_1626:String = "WE_UNFOCUSED";
      
      public static const const_1456:String = "WE_ACTIVATE";
      
      public static const const_1534:String = "WE_ACTIVATED";
      
      public static const const_1426:String = "WE_DEACTIVATE";
      
      public static const const_616:String = "WE_DEACTIVATED";
      
      public static const const_571:String = "WE_SELECT";
      
      public static const const_58:String = "WE_SELECTED";
      
      public static const const_660:String = "WE_UNSELECT";
      
      public static const const_707:String = "WE_UNSELECTED";
      
      public static const const_1756:String = "WE_ATTACH";
      
      public static const const_1729:String = "WE_ATTACHED";
      
      public static const const_1723:String = "WE_DETACH";
      
      public static const const_1728:String = "WE_DETACHED";
      
      public static const const_1395:String = "WE_LOCK";
      
      public static const const_1563:String = "WE_LOCKED";
      
      public static const const_1503:String = "WE_UNLOCK";
      
      public static const const_1587:String = "WE_UNLOCKED";
      
      public static const const_853:String = "WE_ENABLE";
      
      public static const const_304:String = "WE_ENABLED";
      
      public static const const_712:String = "WE_DISABLE";
      
      public static const const_256:String = "WE_DISABLED";
      
      public static const const_1569:String = "WE_RELOCATE";
      
      public static const const_399:String = "WE_RELOCATED";
      
      public static const const_1475:String = "WE_RESIZE";
      
      public static const const_49:String = "WE_RESIZED";
      
      public static const const_1394:String = "WE_MINIMIZE";
      
      public static const const_1390:String = "WE_MINIMIZED";
      
      public static const const_1487:String = "WE_MAXIMIZE";
      
      public static const const_1473:String = "WE_MAXIMIZED";
      
      public static const const_1444:String = "WE_RESTORE";
      
      public static const const_1601:String = "WE_RESTORED";
      
      public static const const_1876:String = "WE_ARRANGE";
      
      public static const const_1936:String = "WE_ARRANGED";
      
      public static const const_105:String = "WE_UPDATE";
      
      public static const const_1724:String = "WE_UPDATED";
      
      public static const const_1919:String = "WE_CHILD_RELOCATE";
      
      public static const const_540:String = "WE_CHILD_RELOCATED";
      
      public static const const_1871:String = "WE_CHILD_RESIZE";
      
      public static const const_287:String = "WE_CHILD_RESIZED";
      
      public static const const_1888:String = "WE_CHILD_REMOVE";
      
      public static const const_515:String = "WE_CHILD_REMOVED";
      
      public static const const_1881:String = "WE_PARENT_RELOCATE";
      
      public static const const_1763:String = "WE_PARENT_RELOCATED";
      
      public static const const_1805:String = "WE_PARENT_RESIZE";
      
      public static const const_1558:String = "WE_PARENT_RESIZED";
      
      public static const const_186:String = "WE_OK";
      
      public static const const_855:String = "WE_CANCEL";
      
      public static const const_103:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_446:String = "WE_SCROLL";
      
      public static const const_161:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1980:IWindow;
      
      protected var var_1981:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1980 = param3;
         this.var_1981 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1980;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1981 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1981;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
