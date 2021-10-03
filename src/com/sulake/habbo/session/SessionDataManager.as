package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var _communication:IHabboCommunicationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_15:IRoomSessionManager;
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_645:String;
      
      private var var_987:String;
      
      private var var_1664:String;
      
      private var var_2354:int = 0;
      
      private var _respectLeft:int = 0;
      
      private var var_736:int = 0;
      
      private var var_938:Array;
      
      private var var_1797:GroupDetailsView;
      
      private var var_2533:Boolean;
      
      private var var_2534:Boolean;
      
      private var var_1069:Dictionary;
      
      private var var_617:ProductDataParser;
      
      private var var_506:Map;
      
      private var _wallItems:Map;
      
      private var var_505:Map;
      
      private var var_300:FurnitureDataParser;
      
      private var var_1798:UserTagManager;
      
      private var var_1417:BadgeImageManager;
      
      private var var_1135:HabboGroupInfoManager;
      
      private var var_937:IgnoredUsersManager;
      
      private var var_176:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_1800:Boolean = false;
      
      private var var_1137:Array;
      
      private var var_939:Array;
      
      private var var_1136:Boolean;
      
      private var var_2477:int;
      
      private var var_1799:int;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_938 = [];
         this.var_1798 = new UserTagManager(events);
         this.var_1135 = new HabboGroupInfoManager(this,events);
         this.var_937 = new IgnoredUsersManager(this);
         this.var_1069 = new Dictionary();
         this.var_1137 = [];
         this.var_939 = [];
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      override public function dispose() : void
      {
         if(this.var_506)
         {
            this.var_506.dispose();
            this.var_506 = null;
         }
         if(this.var_505)
         {
            this.var_505.dispose();
            this.var_505 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_15)
         {
            this.var_15.release(new IIDHabboRoomSessionManager());
            this.var_15 = null;
         }
         if(this.var_176)
         {
            this.var_176.release(new IIDHabboConfigurationManager());
            this.var_176 = null;
         }
         if(this._localization)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         this.var_939 = null;
         if(this.var_300)
         {
            this.var_300.removeEventListener(FurnitureDataParser.const_110,this.onFurnitureReady);
            this.var_300.dispose();
            this.var_300 = null;
         }
         if(this.var_617)
         {
            this.var_617.removeEventListener(ProductDataParser.const_110,this.onProductsReady);
            this.var_617.dispose();
            this.var_617 = null;
         }
         super.dispose();
      }
      
      private function initBadgeImageManager() : void
      {
         if(this.var_1417 != null)
         {
            return;
         }
         if(this.var_176 == null || this._localization == null)
         {
            return;
         }
         this.var_1417 = new BadgeImageManager(context.root.assets,events,this.var_176,this._localization);
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         this._communication = param2 as IHabboCommunicationManager;
         if(this._communication == null)
         {
            return;
         }
         this._communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
         this._communication.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
         this._communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(this.onUserChange));
         this._communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(this.onUserNameChange));
         this._communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(this.onAvailabilityStatus));
         this._communication.addHabboConnectionMessageEvent(new PetRespectFailedEvent(this.onPetRespectFailed));
         this.var_1798.communication = this._communication;
         this.var_1135.communication = this._communication;
         this.var_937.registerMessageEvents();
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         var _loc3_:* = null;
         if(param2 == null)
         {
            return;
         }
         this.var_176 = param2 as IHabboConfigurationManager;
         this.initBadgeImageManager();
         if(!this.var_300)
         {
            this.var_506 = new Map();
            this._wallItems = new Map();
            this.var_505 = new Map();
            this.var_300 = new FurnitureDataParser(this.var_506,this._wallItems,this.var_505,this._localization);
            this.var_300.addEventListener(FurnitureDataParser.const_110,this.onFurnitureReady);
            if(this.var_176.keyExists("furnidata.load.url"))
            {
               _loc3_ = this.var_176.getKey("furnidata.load.url");
               this.var_300.loadData(_loc3_);
            }
         }
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
         this.initBadgeImageManager();
         if(this.var_300)
         {
            this.var_300.localization = this._localization;
            this.var_300.registerFurnitureLocalizations();
         }
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_15 = param2 as IRoomSessionManager;
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         this.var_300.removeEventListener(FurnitureDataParser.const_110,this.onFurnitureReady);
         for each(_loc2_ in this.var_939)
         {
            _loc2_.furniDataReady();
         }
         this.var_939 = [];
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = UserRightsMessageEvent(param1);
         if(_loc2_.simpleSecurity)
         {
            this.var_1136 = true;
            this.var_2477 = _loc2_.clubLevel;
            this.var_1799 = _loc2_.securityLevel;
         }
         else
         {
            this.var_1136 = false;
            this.var_938 = _loc2_.rights;
         }
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         this._id = _loc3_.id;
         this._name = _loc3_.name;
         this.var_2354 = _loc3_.respectTotal;
         this._respectLeft = _loc3_.respectLeft;
         this.var_736 = _loc3_.petRespectLeft;
         this.var_645 = _loc3_.figure;
         this.var_987 = _loc3_.sex;
         this.var_1664 = _loc3_.realName;
         this.var_937.initIgnoreList();
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            this.var_645 = _loc2_.figure;
            this.var_987 = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(this._id,this.var_645,this.var_987));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == this._id)
         {
            this._name = _loc3_.newName;
         }
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_2533 = _loc2_.isOpen;
         this.var_2534 = _loc2_.onShutDown;
      }
      
      private function onPetRespectFailed(param1:PetRespectFailedEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         ++this.var_736;
      }
      
      public function get systemOpen() : Boolean
      {
         return this.var_2533;
      }
      
      public function get systemShutDown() : Boolean
      {
         return this.var_2534;
      }
      
      public function get simpleSecurity() : Boolean
      {
         return this.var_1136;
      }
      
      public function hasSecurity(param1:int) : Boolean
      {
         return this.var_1799 >= param1;
      }
      
      public function hasUserRight(param1:String, param2:int) : Boolean
      {
         if(this.var_1136)
         {
            return this.var_2477 >= param2;
         }
         if(this.var_938 == null)
         {
            return false;
         }
         return this.var_938.indexOf(param1) >= 0;
      }
      
      public function get userId() : int
      {
         return this._id;
      }
      
      public function get userName() : String
      {
         return this._name;
      }
      
      public function get realName() : String
      {
         return this.var_1664;
      }
      
      public function get figure() : String
      {
         return this.var_645;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         if(this.var_1136)
         {
            return this.var_1799 >= SecurityLevelEnum.const_1002;
         }
         if(this.var_938 == null)
         {
            return false;
         }
         return this.var_938.indexOf("fuse_any_room_controller") >= 0;
      }
      
      public function getUserTags(param1:int) : Array
      {
         return this.var_1798.getTags(param1);
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return this.var_1417.getBadgeImage(param1);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(this.var_1797 == null)
         {
            this.var_1797 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = this.var_1135.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            this.var_1797.showGroupDetails(param1);
         }
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return this.var_1135.getGroupDetails(param1);
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return this.var_1135.getBadgeId(param1);
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return this.var_1417.getBadgeImage(param1,BadgeImageManager.const_1027);
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return this.var_937.isIgnored(param1);
      }
      
      public function ignoreUser(param1:String) : void
      {
         this.var_937.ignoreUser(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         this.var_937.unignoreUser(param1);
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_736;
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this._respectLeft < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         this._respectLeft = this._respectLeft - 1;
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this.var_736 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         this.var_736 = this.var_736 - 1;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_176;
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!this.var_1800)
         {
            this.loadProductData();
         }
         return this.var_1069[param1];
      }
      
      public function getFloorItemData(param1:int) : IFurnitureData
      {
         if(this.var_506 == null)
         {
            return null;
         }
         return this.var_506.getValue(param1.toString());
      }
      
      public function getWallItemData(param1:int) : IFurnitureData
      {
         if(this._wallItems == null)
         {
            return null;
         }
         return this._wallItems.getValue(param1.toString());
      }
      
      public function getFloorItemDataByName(param1:String, param2:int = 0) : IFurnitureData
      {
         var _loc4_:int = 0;
         if(this.var_505 == null)
         {
            return null;
         }
         var _loc3_:Array = this.var_505.getValue(param1);
         if(_loc3_ != null && param2 <= _loc3_.length - 1)
         {
            _loc4_ = _loc3_[param2];
            return this.getFloorItemData(_loc4_);
         }
         return null;
      }
      
      public function getWallItemDataByName(param1:String, param2:int = 0) : IFurnitureData
      {
         var _loc4_:int = 0;
         if(this.var_505 == null)
         {
            return null;
         }
         var _loc3_:Array = this.var_505.getValue(param1);
         if(_loc3_ != null && param2 <= _loc3_.length - 1)
         {
            _loc4_ = _loc3_[param2];
            return this.getWallItemData(_loc4_);
         }
         return null;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(this.var_176 != null)
         {
            urlString = this.var_176.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(this.var_15 == null || this._windowManager == null)
         {
            return;
         }
         var session:IRoomSession = this.var_15.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || this.isAnyRoomController)
         {
            this._windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:Event):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_186)
               {
                  method_5();
               }
            });
         }
      }
      
      public function loadProductData(param1:IProductDataListener = null) : Boolean
      {
         var _loc2_:* = null;
         if(this.var_1800)
         {
            return true;
         }
         if(this.var_1137.indexOf(param1) == -1)
         {
            this.var_1137.push(param1);
         }
         if(this.var_617 == null)
         {
            _loc2_ = this.var_176.getKey("productdata.load.url");
            this.var_617 = new ProductDataParser(_loc2_,this.var_1069);
            this.var_617.addEventListener(ProductDataParser.const_110,this.onProductsReady);
         }
         return false;
      }
      
      private function onProductsReady(param1:Event) : void
      {
         var _loc2_:* = null;
         this.var_617.removeEventListener(ProductDataParser.const_110,this.onProductsReady);
         this.var_1800 = true;
         for each(_loc2_ in this.var_1137)
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.productDataReady();
            }
         }
         this.var_1137 = [];
      }
      
      private function method_5() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return this.var_15;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get gender() : String
      {
         return this.var_987;
      }
      
      public function getFurniData(param1:IFurniDataListener) : Array
      {
         if(this.var_506.length == 0)
         {
            if(this.var_939.indexOf(param1) == -1)
            {
               this.var_939.push(param1);
            }
            return null;
         }
         var _loc2_:Array = this.var_506.getValues();
         return _loc2_.concat(this._wallItems.getValues());
      }
   }
}
