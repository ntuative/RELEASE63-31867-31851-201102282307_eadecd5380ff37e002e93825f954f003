package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.register.RegistrationUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_171:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_311:IHabboCommunicationManager;
      
      private var var_830:IHabboLocalizationManager;
      
      private var var_663:IHabboConfigurationManager;
      
      private var var_401:ISessionDataManager;
      
      private var var_1024:FaqIndex;
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_63:HelpUI;
      
      private var var_96:TutorialUI;
      
      private var var_664:HotelMergeUI;
      
      private var var_829:RegistrationUI;
      
      private var var_1272:CallForHelpData;
      
      private var var_2103:UserRegistry;
      
      private var var_2104:String = "";
      
      private var var_1553:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1272 = new CallForHelpData();
         this.var_2103 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1024 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2104 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2104;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1272;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2103;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_830;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_171;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_401;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_96;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_664;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_96)
         {
            return this.var_96.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_63 != null)
         {
            this.var_63.dispose();
            this.var_63 = null;
         }
         if(this.var_96 != null)
         {
            this.var_96.dispose();
            this.var_96 = null;
         }
         if(this.var_664)
         {
            this.var_664.dispose();
            this.var_664 = null;
         }
         if(this.var_829 != null)
         {
            this.var_829.dispose();
            this.var_829 = null;
         }
         if(this.var_1024 != null)
         {
            this.var_1024.dispose();
            this.var_1024 = null;
         }
         this._incomingMessages = null;
         if(this.var_171)
         {
            this.var_171.release(new IIDHabboToolbar());
            this.var_171 = null;
         }
         if(this.var_830)
         {
            this.var_830.release(new IIDHabboLocalizationManager());
            this.var_830 = null;
         }
         if(this.var_311)
         {
            this.var_311.release(new IIDHabboCommunicationManager());
            this.var_311 = null;
         }
         if(this.var_663)
         {
            this.var_663.release(new IIDHabboConfigurationManager());
            this.var_663 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_401 != null)
         {
            this.var_401.release(new IIDSessionDataManager());
            this.var_401 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_63 != null)
         {
            this.var_63.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_63 != null)
         {
            this.var_63.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_63 != null)
         {
            this.var_63.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_63 != null)
         {
            this.var_63.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_63 != null)
         {
            this.var_63.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1024;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_311 != null && param1 != null)
         {
            this.var_311.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_663 == null)
         {
            return param1;
         }
         return this.var_663.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_63 != null)
         {
            this.var_63.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_63 != null)
         {
            this.var_63.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1272.reportedUserId = param1;
         this.var_1272.reportedUserName = param2;
         this.var_63.showUI(HabboHelpViewEnum.const_366);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_63 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_63.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_63 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_63 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_830,this.var_171);
         }
         return this.var_63 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_96 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_96 = new TutorialUI(this,_loc1_);
         }
         return this.var_96 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_96 != null)
         {
            this.var_96.dispose();
            this.var_96 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_664)
         {
            this.var_664 = new HotelMergeUI(this);
         }
         this.var_664.startNameChange();
      }
      
      public function initRegistrationUI() : void
      {
         if(!this.var_829)
         {
            this.var_829 = new RegistrationUI(this);
         }
         this.var_829.showRegistrationView();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_96 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_96.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_96)
         {
            this.var_96.showView(TutorialUI.const_301);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_311 = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this,this.var_311);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_171 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_830 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_663 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_84,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_99,this.onRoomSessionEvent);
         this.var_171.events.addEventListener(HabboToolbarEvent.const_64,this.onHabboToolbarEvent);
         this.var_171.events.addEventListener(HabboToolbarEvent.const_37,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_401 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_84:
               if(this.var_63 != null)
               {
                  this.var_63.setRoomSessionStatus(true);
               }
               if(this.var_96 != null)
               {
                  this.var_96.setRoomSessionStatus(true);
               }
               this.showWelcomeScreen(true);
               break;
            case RoomSessionEvent.const_99:
               if(this.var_63 != null)
               {
                  this.var_63.setRoomSessionStatus(false);
               }
               if(this.var_96 != null)
               {
                  this.var_96.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
               this.showWelcomeScreen(false);
         }
      }
      
      private function showWelcomeScreen(param1:Boolean) : void
      {
         if(!this.var_1553)
         {
            this.var_1553 = new WelcomeScreenController(this,this._windowManager,this.var_663);
         }
         this.var_1553.showWelcomeScreen(param1);
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_171 != null)
         {
            this.var_171.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_120,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_64)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_37)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
   }
}
