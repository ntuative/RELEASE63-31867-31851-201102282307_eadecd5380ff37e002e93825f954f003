package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_2781:int;
      
      private var var_355:RoomEventViewCtrl;
      
      private var var_244:Timer;
      
      private var var_172:RoomSettingsCtrl;
      
      private var var_245:RoomThumbnailCtrl;
      
      private var var_1075:TagRenderer;
      
      private var var_290:IWindowContainer;
      
      private var var_415:IWindowContainer;
      
      private var var_725:IWindowContainer;
      
      private var var_2470:IWindowContainer;
      
      private var var_2469:IWindowContainer;
      
      private var var_1381:IWindowContainer;
      
      private var var_957:ITextWindow;
      
      private var var_1121:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_918:ITextWindow;
      
      private var var_1388:ITextWindow;
      
      private var var_1118:ITextWindow;
      
      private var var_917:ITextWindow;
      
      private var var_1745:ITextWindow;
      
      private var var_246:IWindowContainer;
      
      private var var_920:IWindowContainer;
      
      private var var_1744:IWindowContainer;
      
      private var var_2228:ITextWindow;
      
      private var var_726:ITextWindow;
      
      private var var_2467:IWindow;
      
      private var var_1386:IContainerButtonWindow;
      
      private var var_1387:IContainerButtonWindow;
      
      private var var_1382:IContainerButtonWindow;
      
      private var var_1389:IContainerButtonWindow;
      
      private var var_1384:IContainerButtonWindow;
      
      private var var_1385:IContainerButtonWindow;
      
      private var var_1743:IButtonWindow;
      
      private var var_1741:IButtonWindow;
      
      private var var_1742:IButtonWindow;
      
      private var var_919:IWindowContainer;
      
      private var var_1383:ITextWindow;
      
      private var var_1119:ITextFieldWindow;
      
      private var var_65:IWindowContainer;
      
      private var var_1120:IButtonWindow;
      
      private var var_916:IButtonWindow;
      
      private var var_2468:String;
      
      private var var_2471:String;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_355 = new RoomEventViewCtrl(this._navigator);
         this.var_172 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_245 = new RoomThumbnailCtrl(this._navigator);
         this.var_1075 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_172);
         this.var_244 = new Timer(6000,1);
         this.var_244.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_98,this.onToolbarIconState);
         }
         if(this.var_244)
         {
            this.var_244.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_244.reset();
            this.var_244 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_244.reset();
         this.var_355.active = true;
         this.var_172.active = false;
         this.var_245.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_244.reset();
         this.var_172.load(param1);
         this.var_172.active = true;
         this.var_355.active = false;
         this.var_245.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_172.active = true;
         this.var_355.active = false;
         this.var_245.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_244.reset();
         this.var_172.active = false;
         this.var_355.active = false;
         this.var_245.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1135,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_244.reset();
         this.var_355.active = false;
         this.var_172.active = false;
         this.var_245.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_244.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_244.reset();
         this.var_355.active = false;
         this.var_172.active = false;
         this.var_245.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_480,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_290.rectangle + ", " + this.var_246.rectangle + ", " + this._window.rectangle);
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_290);
         this.var_290.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_172.refresh(this.var_290);
         this.var_245.refresh(this.var_290);
         Util.moveChildrenToColumn(this.var_290,["room_details","room_buttons"],0,2);
         this.var_290.height = Util.getLowestPoint(this.var_290);
         this.var_290.visible = true;
         Logger.log("XORP: " + this.var_415.visible + ", " + this.var_1381.visible + ", " + this.var_725.visible + ", " + this.var_725.rectangle + ", " + this.var_290.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_246);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_355.refresh(this.var_246);
         if(Util.hasVisibleChildren(this.var_246) && !(this.var_172.active || this.var_245.active))
         {
            Util.moveChildrenToColumn(this.var_246,["event_details","event_buttons"],0,2);
            this.var_246.height = Util.getLowestPoint(this.var_246);
            this.var_246.visible = true;
         }
         else
         {
            this.var_246.visible = false;
         }
         Logger.log("EVENT: " + this.var_246.visible + ", " + this.var_246.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_172.active && !this.var_245.active && !this.var_355.active)
         {
            this.var_919.visible = true;
            this.var_1119.text = this.getEmbedData();
         }
         else
         {
            this.var_919.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this.var_65)
         {
            return;
         }
         if(this.var_172.active)
         {
            this.var_65.visible = false;
            return;
         }
         this.var_65.visible = true;
         if(this.var_1120)
         {
            if(this.var_2468 == "exit_homeroom")
            {
               this.var_1120.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1120.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_916)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_916.visible = _loc1_;
            if(this.var_2471 == "0")
            {
               this.var_916.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_916.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_172.active || this.var_245.active)
         {
            return;
         }
         this.var_957.text = param1.roomName;
         this.var_957.height = this.var_957.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_918.text = param1.description;
         this.var_1075.refreshTags(this.var_415,param1.tags);
         this.var_918.visible = false;
         if(param1.description != "")
         {
            this.var_918.height = this.var_918.textHeight + 5;
            this.var_918.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1387,"facebook_logo_small",_loc3_,null,0);
         this.var_1387.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1386,"thumb_up",_loc4_,null,0);
         this.var_1386.visible = _loc4_;
         this.var_917.visible = !_loc4_;
         this.var_1745.visible = !_loc4_;
         this.var_1745.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_415,"home",param2,null,0);
         this._navigator.refreshButton(this.var_415,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_415,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_957.y,0);
         this.var_415.visible = true;
         this.var_415.height = Util.getLowestPoint(this.var_415);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_415.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_172.active || this.var_245.active)
         {
            return;
         }
         this.var_1121.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1121.height = this.var_1121.textHeight + 5;
         this.var_1388.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1388.height = this.var_1388.textHeight + 5;
         Util.moveChildrenToColumn(this.var_725,["public_space_name","public_space_desc"],this.var_1121.y,0);
         this.var_725.visible = true;
         this.var_725.height = Math.max(86,Util.getLowestPoint(this.var_725));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_355.active)
         {
            return;
         }
         this.var_2228.text = param1.eventName;
         this.var_726.text = param1.eventDescription;
         this.var_1075.refreshTags(this.var_920,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_726.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_726.height = this.var_726.textHeight + 5;
            this.var_726.y = Util.getLowestPoint(this.var_920) + 2;
            this.var_726.visible = true;
         }
         this.var_920.visible = true;
         this.var_920.height = Util.getLowestPoint(this.var_920);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_172.active || this.var_245.active)
         {
            return;
         }
         this.var_1743.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1382.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1389.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1384.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1385.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1381.visible = Util.hasVisibleChildren(this.var_1381);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_355.active)
         {
            return;
         }
         this.var_1741.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1742.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1744.visible = Util.hasVisibleChildren(this.var_1744);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_61,false);
         this._window.setParamFlag(HabboWindowParam.const_1610,true);
         this._window.visible = false;
         this.var_290 = IWindowContainer(this.find("room_info"));
         this.var_415 = IWindowContainer(this.find("room_details"));
         this.var_725 = IWindowContainer(this.find("public_space_details"));
         this.var_2470 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2469 = IWindowContainer(this.find("rating_cont"));
         this.var_1381 = IWindowContainer(this.find("room_buttons"));
         this.var_957 = ITextWindow(this.find("room_name"));
         this.var_1121 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_918 = ITextWindow(this.find("room_desc"));
         this.var_1388 = ITextWindow(this.find("public_space_desc"));
         this.var_1118 = ITextWindow(this.find("owner_caption"));
         this.var_917 = ITextWindow(this.find("rating_caption"));
         this.var_1745 = ITextWindow(this.find("rating_txt"));
         this.var_246 = IWindowContainer(this.find("event_info"));
         this.var_920 = IWindowContainer(this.find("event_details"));
         this.var_1744 = IWindowContainer(this.find("event_buttons"));
         this.var_2228 = ITextWindow(this.find("event_name"));
         this.var_726 = ITextWindow(this.find("event_desc"));
         this.var_1387 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1386 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2467 = this.find("staff_pick_button");
         this.var_1382 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1389 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1384 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1385 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1743 = IButtonWindow(this.find("room_settings_button"));
         this.var_1741 = IButtonWindow(this.find("create_event_button"));
         this.var_1742 = IButtonWindow(this.find("edit_event_button"));
         this.var_919 = IWindowContainer(this.find("embed_info"));
         this.var_1383 = ITextWindow(this.find("embed_info_txt"));
         this.var_1119 = ITextFieldWindow(this.find("embed_src_txt"));
         this.var_65 = IWindowContainer(this.find("buttons_container"));
         this.var_1120 = IButtonWindow(this.find("exit_room_button"));
         this.var_916 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1382,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1389,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1743,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1384,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1385,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1741,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1742,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1119,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1386,this.onThumbUp);
         Util.setProcDirectly(this.var_2467,this.onStaffPick);
         Util.setProcDirectly(this.var_1387,this.onFacebookLike);
         Util.setProcDirectly(this.var_916,this.onZoomClick);
         Util.setProcDirectly(this.var_1120,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1382,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1389,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1384,"home",true,null,0);
         this._navigator.refreshButton(this.var_1385,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_290,this.onHover);
         Util.setProcDirectly(this.var_246,this.onHover);
         this.var_1118.width = this.var_1118.textWidth;
         Util.moveChildrenToRow(this.var_2470,["owner_caption","owner_name"],this.var_1118.x,this.var_1118.y,3);
         this.var_917.width = this.var_917.textWidth;
         Util.moveChildrenToRow(this.var_2469,["rating_caption","rating_txt"],this.var_917.x,this.var_917.y,3);
         this.var_1383.height = this.var_1383.textHeight + 5;
         Util.moveChildrenToColumn(this.var_919,["embed_info_txt","embed_src_txt"],this.var_1383.y,2);
         this.var_919.height = Util.getLowestPoint(this.var_919) + 5;
         this.var_2781 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1119.setSelection(0,this.var_1119.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_37);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_37);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_98)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2471 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2468 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_244.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_480,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_98,this.onToolbarIconState);
         }
      }
   }
}
