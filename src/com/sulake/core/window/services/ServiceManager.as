package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2770:uint;
      
      private var var_138:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var _windowContext:IWindowContext;
      
      private var var_1063:IMouseDraggingService;
      
      private var var_1064:IMouseScalingService;
      
      private var var_1067:IMouseListenerService;
      
      private var var_1062:IFocusManagerService;
      
      private var var_1065:IToolTipAgentService;
      
      private var var_1066:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2770 = 0;
         this.var_138 = param2;
         this._windowContext = param1;
         this.var_1063 = new WindowMouseDragger(param2);
         this.var_1064 = new WindowMouseScaler(param2);
         this.var_1067 = new WindowMouseListener(param2);
         this.var_1062 = new FocusManager(param2);
         this.var_1065 = new WindowToolTipAgent(param2);
         this.var_1066 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1063 != null)
         {
            this.var_1063.dispose();
            this.var_1063 = null;
         }
         if(this.var_1064 != null)
         {
            this.var_1064.dispose();
            this.var_1064 = null;
         }
         if(this.var_1067 != null)
         {
            this.var_1067.dispose();
            this.var_1067 = null;
         }
         if(this.var_1062 != null)
         {
            this.var_1062.dispose();
            this.var_1062 = null;
         }
         if(this.var_1065 != null)
         {
            this.var_1065.dispose();
            this.var_1065 = null;
         }
         if(this.var_1066 != null)
         {
            this.var_1066.dispose();
            this.var_1066 = null;
         }
         this.var_138 = null;
         this._windowContext = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1063;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1064;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1067;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1062;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1065;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1066;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
