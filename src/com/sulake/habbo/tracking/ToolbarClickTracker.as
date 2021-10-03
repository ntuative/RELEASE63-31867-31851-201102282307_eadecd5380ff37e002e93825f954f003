package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1242:IHabboTracking;
      
      private var var_1583:Boolean = false;
      
      private var var_2368:int = 0;
      
      private var var_1686:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1242 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1242 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1583 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2368 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1583)
         {
            return;
         }
         ++this.var_1686;
         if(this.var_1686 <= this.var_2368)
         {
            this.var_1242.track("toolbar",param1);
         }
      }
   }
}
