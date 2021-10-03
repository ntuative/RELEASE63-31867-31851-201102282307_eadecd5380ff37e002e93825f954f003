package com.sulake.habbo.navigator
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.enum.HabboProtocolOption;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.navigator.domain.NavigatorData;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorOpenedEvent;
   import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
   import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailRenderer;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboNavigator extends Component implements IHabboNavigator
   {
       
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_15:IRoomSessionManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_176:IHabboConfigurationManager;
      
      private var _friendList:IHabboFriendList;
      
      private var var_674:ISessionDataManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_299:MainViewCtrl;
      
      private var var_616:RoomInfoViewCtrl;
      
      private var var_1134:RoomCreateViewCtrl;
      
      private var _data:NavigatorData;
      
      private var var_409:Tabs;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_2823:Dictionary;
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_171:IHabboToolbar;
      
      private var var_2532:Array;
      
      private var var_2531:RoomThumbnailRenderer;
      
      private var var_985:GuestRoomPasswordInput;
      
      private var var_298:GuestRoomDoorbell;
      
      private var _officialRoomEntryManager:OfficialRoomEntryManager;
      
      public function HabboNavigator(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_2532 = new Array();
         super(param1,param2,param3);
         Logger.log("Navigator initialized");
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationComponentInit);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         this._assetLibrary = new AssetLibraryCollection("NavigatorComponent");
         this._data = new NavigatorData(this);
         this.var_299 = new MainViewCtrl(this);
         this.var_616 = new RoomInfoViewCtrl(this);
         this.var_1134 = new RoomCreateViewCtrl(this);
         this.var_2531 = new RoomThumbnailRenderer(this);
         this.var_985 = new GuestRoomPasswordInput(this);
         this.var_298 = new GuestRoomDoorbell(this);
         this.var_409 = new Tabs(this);
         this._officialRoomEntryManager = new OfficialRoomEntryManager(this);
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get data() : NavigatorData
      {
         return this._data;
      }
      
      public function get mainViewCtrl() : MainViewCtrl
      {
         return this.var_299;
      }
      
      public function get tabs() : Tabs
      {
         return this.var_409;
      }
      
      public function get friendList() : IHabboFriendList
      {
         return this._friendList;
      }
      
      public function get roomInfoViewCtrl() : RoomInfoViewCtrl
      {
         return this.var_616;
      }
      
      public function get roomCreateViewCtrl() : RoomCreateViewCtrl
      {
         return this.var_1134;
      }
      
      public function get assetLibrary() : IAssetLibrary
      {
         return this._assetLibrary;
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_171;
      }
      
      public function get roomSettingsCtrls() : Array
      {
         return this.var_2532;
      }
      
      public function get thumbRenderer() : RoomThumbnailRenderer
      {
         return this.var_2531;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return this.var_674;
      }
      
      public function get passwordInput() : GuestRoomPasswordInput
      {
         return this.var_985;
      }
      
      public function get doorbell() : GuestRoomDoorbell
      {
         return this.var_298;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_176;
      }
      
      public function get officialRoomEntryManager() : OfficialRoomEntryManager
      {
         return this._officialRoomEntryManager;
      }
      
      override public function dispose() : void
      {
         if(this.var_299)
         {
            this.var_299.dispose();
            this.var_299 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_15)
         {
            this.var_15.release(new IIDHabboRoomSessionManager());
            this.var_15 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._localization)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this.var_176)
         {
            this.var_176.release(new IIDHabboConfigurationManager());
            this.var_176 = null;
         }
         if(this._friendList)
         {
            this._friendList.release(new IIDHabboFriendList());
            this._friendList = null;
         }
         if(this.var_674)
         {
            this.var_674.release(new IIDSessionDataManager());
            this.var_674 = null;
         }
         if(this._catalog)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this.var_171)
         {
            this.var_171.release(new IIDHabboToolbar());
            this.var_171 = null;
         }
         if(this.var_616)
         {
            this.var_616.dispose();
            this.var_616 = null;
         }
         if(this.var_1134)
         {
            this.var_1134.dispose();
            this.var_1134 = null;
         }
         if(this._officialRoomEntryManager)
         {
            this._officialRoomEntryManager.dispose();
            this._officialRoomEntryManager = null;
         }
         super.dispose();
      }
      
      public function goToRoom(param1:int, param2:Boolean, param3:String = "") : void
      {
         Logger.log("GO TO ROOM: " + param1);
         if(this.var_15)
         {
            if(param2)
            {
               this.var_299.close();
            }
            this.var_616.close();
            this.var_15.gotoRoom(false,param1,param3);
         }
      }
      
      public function goToPublicSpace(param1:int, param2:String) : void
      {
         Logger.log("GO TO PUBLIC SPACE: " + param1);
         if(this.var_15)
         {
            this.var_616.close();
            this.var_15.gotoRoom(true,param1,"",param2);
         }
      }
      
      public function goToHomeRoom() : Boolean
      {
         if(this._data.homeRoomId < 1)
         {
            Logger.log("No home room set while attempting to go to home room");
            return false;
         }
         this.goToRoom(this._data.homeRoomId,true);
         return true;
      }
      
      public function send(param1:IMessageComposer, param2:Boolean = false) : void
      {
         this._communication.getHabboMainConnection(null).send(param1,!!param2 ? 0 : -1);
      }
      
      public function getXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         var asset:IAsset = null;
         var xmlAsset:XmlAsset = null;
         var name:String = param1;
         var layer:uint = param2;
         var window:IWindow = null;
         try
         {
            asset = assets.getAssetByName(name + "_xml");
            xmlAsset = XmlAsset(asset);
            window = this._windowManager.buildFromXML(XML(xmlAsset.content),layer);
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboNavigator","Failed to build window " + name + "_xml, " + asset + ", " + _windowManager + "!");
            throw e;
         }
         return window;
      }
      
      public function getText(param1:String) : String
      {
         var _loc2_:String = this._localization.getKey(param1);
         if(_loc2_ == null || _loc2_ == "")
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      public function registerParameter(param1:String, param2:String, param3:String) : void
      {
         this._localization.registerParameter(param1,param2,param3);
      }
      
      public function getButton(param1:String, param2:String, param3:Function, param4:int = 0, param5:int = 0, param6:int = 0) : IBitmapWrapperWindow
      {
         var _loc7_:BitmapData = this.getButtonImage(param2);
         var _loc8_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._windowManager.createWindow(param1,"",HabboWindowType.const_297,HabboWindowStyle.const_42,0 | 0,new Rectangle(param4,param5,_loc7_.width,_loc7_.height),param3,param6));
         _loc8_.bitmap = _loc7_;
         return _loc8_;
      }
      
      public function refreshButton(param1:IWindowContainer, param2:String, param3:Boolean, param4:Function, param5:int, param6:String = null) : void
      {
         if(!param6)
         {
            param6 = param2;
         }
         var _loc7_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(!_loc7_)
         {
            Logger.log("Could not locate button in navigator: " + param2);
         }
         if(!param3)
         {
            _loc7_.visible = false;
         }
         else
         {
            this.prepareButton(_loc7_,param6,param4,param5);
            _loc7_.visible = true;
         }
      }
      
      private function prepareButton(param1:IBitmapWrapperWindow, param2:String, param3:Function, param4:int) : void
      {
         param1.id = param4;
         param1.procedure = param3;
         if(param1.bitmap != null)
         {
            return;
         }
         param1.bitmap = this.getButtonImage(param2);
         param1.width = param1.bitmap.width;
         param1.height = param1.bitmap.height;
      }
      
      public function getButtonImage(param1:String, param2:String = "_png") : BitmapData
      {
         var _loc7_:* = null;
         var _loc3_:String = param1 + param2;
         var _loc4_:IAsset = assets.getAssetByName(_loc3_);
         var _loc5_:BitmapDataAsset = BitmapDataAsset(_loc4_);
         var _loc6_:BitmapData = BitmapData(_loc5_.content);
         _loc7_ = new BitmapData(_loc6_.width,_loc6_.height,true,0);
         _loc7_.draw(_loc6_);
         return _loc7_;
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Navigator: communication available " + [param1,param2]);
         this._communication = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_15 = IRoomSessionManager(param2);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_171 = IHabboToolbar(param2) as IHabboToolbar;
         this.var_171.events.addEventListener(HabboToolbarEvent.const_64,this.onHabboToolbarEvent);
         this.var_171.events.addEventListener(HabboToolbarEvent.const_37,this.onHabboToolbarEvent);
         this.setHabboToolbarIcon();
         this.var_616.registerToolbarEvents();
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._catalog = IHabboCatalog(param2) as IHabboCatalog;
      }
      
      public function openCatalogClubPage() : void
      {
         if(this._catalog == null)
         {
            return;
         }
         this._catalog.openCatalogPage(CatalogPageName.const_195,true);
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_674 = param2 as ISessionDataManager;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_171 != null)
         {
            this.var_171.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_120,HabboToolbarIconEnum.NAVIGATOR));
            if(this._data != null && this._data.homeRoomId > 0)
            {
               this.var_171.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_120,HabboToolbarIconEnum.EXITROOM));
            }
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
            if(param1.iconId == HabboToolbarIconEnum.NAVIGATOR)
            {
               this.onNavigatorToolBarIconClick();
               return;
            }
            if(param1.iconId == HabboToolbarIconEnum.MEMENU)
            {
               this.roomInfoViewCtrl.close();
            }
            else if(param1.iconId == HabboToolbarIconEnum.ROOMINFO)
            {
               this.roomInfoViewCtrl.toggle();
            }
            else if(param1.iconId == HabboToolbarIconEnum.EXITROOM)
            {
               this.handleExitRoomClick();
            }
         }
      }
      
      private function handleExitRoomClick() : void
      {
         Logger.log("Got exit room");
         if(this._data.homeRoomId < 1)
         {
            Logger.log("No home room defined. Go to hotel view");
            this.send(new QuitMessageComposer());
            return;
         }
         if(this._data.isCurrentRoomHome())
         {
            Logger.log("Already in home room. Go to hotel view");
            this.send(new QuitMessageComposer());
            return;
         }
         Logger.log("Going to home room");
         this.goToHomeRoom();
      }
      
      public function animateWindowOpen(param1:IWindowContainer) : void
      {
         if(param1 != null && this.var_171 != null)
         {
            this.var_171.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.NAVIGATOR,param1));
         }
      }
      
      public function onAuthOk() : void
      {
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc4_:int = 0;
         Logger.log("Navigator: configuration " + [param1,param2]);
         this.var_176 = param2 as IHabboConfigurationManager;
         var _loc3_:String = this.var_176.getKey("navigator.default_tab");
         switch(_loc3_)
         {
            case "popular":
               _loc4_ = 0;
               break;
            case "official":
               _loc4_ = 0;
               break;
            case "me":
               _loc4_ = 0;
               break;
            case "events":
            default:
               _loc4_ = 0;
         }
         this.tabs.setSelectedTab(_loc4_);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Navigator: localization " + [param1,param2]);
         this._localization = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboFriendList(),this.onFriendListReady);
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         Logger.log("Navigator: friendlist " + [param1,param2]);
         this._friendList = IHabboFriendList(param2);
      }
      
      private function onNavigatorToolBarIconClick() : void
      {
         var _loc1_:Boolean = this.var_299.onNavigatorToolBarIconClick();
         if(_loc1_)
         {
            events.dispatchEvent(new HabboNavigatorOpenedEvent());
         }
      }
      
      public function performTagSearch(param1:String) : void
      {
         if(this.var_299 == null)
         {
            return;
         }
         this.var_299.startSearch(Tabs.const_215,Tabs.const_337,param1);
         this.var_299.mainWindow.activate();
      }
      
      public function showOwnRooms() : void
      {
         if(this.var_299 == null)
         {
            return;
         }
         this.var_299.startSearch(Tabs.const_292,Tabs.const_232);
         this.var_409.getTab(Tabs.const_292).tabPageDecorator.tabSelected();
      }
      
      public function getPublicSpaceName(param1:String, param2:int) : String
      {
         var _loc3_:* = "nav_venue_" + param1 + "/" + param2 + "_name";
         var _loc4_:String = this.getText(_loc3_);
         if(_loc4_ != _loc3_)
         {
            return _loc4_;
         }
         return this.getText("nav_venue_" + param1 + "_name");
      }
      
      public function getPublicSpaceDesc(param1:String, param2:int) : String
      {
         return this.getText("nav_venue_" + param1 + "/" + param2 + "_desc");
      }
   }
}
