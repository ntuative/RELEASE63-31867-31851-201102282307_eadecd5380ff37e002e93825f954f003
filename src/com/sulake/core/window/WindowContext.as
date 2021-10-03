package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_549:uint = 0;
      
      public static const const_1441:uint = 1;
      
      public static const const_1733:int = 0;
      
      public static const const_1783:int = 1;
      
      public static const const_1759:int = 2;
      
      public static const const_1917:int = 3;
      
      public static const const_1613:int = 4;
      
      public static const const_358:int = 5;
      
      public static var var_1484:IMouseCursor;
      
      public static var var_374:IEventQueue;
      
      private static var var_591:IEventProcessor;
      
      private static var var_1717:uint = const_549;
      
      private static var stage:Stage;
      
      private static var var_156:IWindowRenderer;
       
      
      private var _eventProcessorState:EventProcessorState;
      
      private var var_2414:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_181:DisplayObjectContainer;
      
      protected var var_2803:Boolean = true;
      
      protected var var_1238:Error;
      
      protected var var_1994:int = -1;
      
      protected var var_1237:IInternalWindowServices;
      
      protected var var_1489:IWindowParser;
      
      protected var var_2752:IWindowFactory;
      
      protected var var_136:IDesktopWindow;
      
      protected var var_1490:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_530:Boolean = false;
      
      private var var_2415:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_156 = param2;
         this._localization = param4;
         this.var_181 = param5;
         this.var_1237 = new ServiceManager(this,param5);
         this.var_2752 = param3;
         this.var_1489 = new WindowParser(this);
         this.var_2414 = param7;
         if(!stage)
         {
            if(this.var_181 is Stage)
            {
               stage = this.var_181 as Stage;
            }
            else if(this.var_181.stage)
            {
               stage = this.var_181.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_136 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_181.addChild(this.var_136.getDisplayObject());
         this.var_181.doubleClickEnabled = true;
         this.var_181.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_156,this.var_136,this.var_136,null,this.var_2414);
         inputMode = const_549;
         this.var_1490 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1717;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_374)
         {
            if(var_374 is IDisposable)
            {
               IDisposable(var_374).dispose();
            }
         }
         if(var_591)
         {
            if(var_591 is IDisposable)
            {
               IDisposable(var_591).dispose();
            }
         }
         switch(value)
         {
            case const_549:
               var_374 = new MouseEventQueue(stage);
               var_591 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1441:
               var_374 = new TabletEventQueue(stage);
               var_591 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_549;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_181.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_181.removeChild(IGraphicContextHost(this.var_136).getGraphicContext(true) as DisplayObject);
            this.var_136.destroy();
            this.var_136 = null;
            this.var_1490.destroy();
            this.var_1490 = null;
            if(this.var_1237 is IDisposable)
            {
               IDisposable(this.var_1237).dispose();
            }
            this.var_1237 = null;
            this.var_1489.dispose();
            this.var_1489 = null;
            var_156 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1238;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_1994;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1238 = param2;
         this.var_1994 = param1;
         if(this.var_2803)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1238 = null;
         this.var_1994 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1237;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1489;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2752;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_136;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1484 == null)
         {
            var_1484 = new MouseCursorControl(this.var_181);
         }
         return var_1484;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_136.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1613,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1490;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_136,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_136)
         {
            this.var_136 = null;
         }
         if(param1.state != WindowState.const_464)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_156.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_530 = true;
         if(this.var_1238)
         {
            throw this.var_1238;
         }
         var_591.process(this._eventProcessorState,var_374);
         this.var_530 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2415 = true;
         var_156.update(param1);
         this.var_2415 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_136 != null && !this.var_136.disposed)
         {
            if(this.var_181 is Stage)
            {
               this.var_136.width = Stage(this.var_181).stageWidth;
               this.var_136.height = Stage(this.var_181).stageHeight;
            }
            else
            {
               this.var_136.width = this.var_181.width;
               this.var_136.height = this.var_181.height;
            }
         }
      }
   }
}
