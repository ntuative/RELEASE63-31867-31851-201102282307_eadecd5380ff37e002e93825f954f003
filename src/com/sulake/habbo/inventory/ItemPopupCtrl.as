package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      public static const const_1086:int = 1;
      
      public static const const_434:int = 2;
      
      private static const const_945:int = 5;
      
      private static const const_1314:int = 250;
      
      private static const const_1315:int = 100;
      
      private static const const_1313:int = 180;
      
      private static const const_1312:int = 200;
       
      
      private var var_350:Timer;
      
      private var var_351:Timer;
      
      private var _assets:IAssetLibrary;
      
      private var var_77:IWindowContainer;
      
      private var _parent:IWindowContainer;
      
      private var var_1721:int = 2;
      
      private var var_714:BitmapData;
      
      private var var_907:BitmapData;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         this.var_350 = new Timer(const_1314,1);
         this.var_351 = new Timer(const_1315,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         this.var_77 = param1;
         this.var_77.visible = false;
         this._assets = param2;
         this.var_350.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_351.addEventListener(TimerEvent.TIMER,this.onHideTimer);
         var _loc3_:BitmapDataAsset = this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_907 = _loc3_.content as BitmapData;
         }
         _loc3_ = this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_714 = _loc3_.content as BitmapData;
         }
      }
      
      public function dispose() : void
      {
         if(this.var_350 != null)
         {
            this.var_350.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_350.stop();
            this.var_350 = null;
         }
         if(this.var_351 != null)
         {
            this.var_351.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_351.stop();
            this.var_351 = null;
         }
         this._assets = null;
         this.var_77 = null;
         this._parent = null;
         this.var_714 = null;
         this.var_907 = null;
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(this.var_77 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_77);
         }
         this._parent = param1;
         this.var_1721 = param4;
         var _loc5_:ITextWindow = ITextWindow(this.var_77.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_77.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1313,param3.width),Math.min(const_1312,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (this.var_77.width - _loc6_.width) / 2;
            this.var_77.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      public function show() : void
      {
         this.var_351.reset();
         this.var_350.reset();
         if(this._parent == null)
         {
            return;
         }
         this.var_77.visible = true;
         this._parent.addChild(this.var_77);
         this.refreshArrow(this.var_1721);
         switch(this.var_1721)
         {
            case const_1086:
               this.var_77.x = -1 * this.var_77.width - const_945;
               break;
            case const_434:
               this.var_77.x = this._parent.width + const_945;
         }
         this.var_77.y = (this._parent.height - this.var_77.height) / 2;
      }
      
      public function hide() : void
      {
         this.var_77.visible = false;
         this.var_351.reset();
         this.var_350.reset();
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_77);
         }
      }
      
      public function showDelayed() : void
      {
         this.var_351.reset();
         this.var_350.reset();
         this.var_350.start();
      }
      
      public function hideDelayed() : void
      {
         this.var_351.reset();
         this.var_350.reset();
         this.var_351.start();
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(this.var_77 == null || this.var_77.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_77.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_1086:
               _loc2_.bitmap = this.var_907.clone();
               _loc2_.width = this.var_907.width;
               _loc2_.height = this.var_907.height;
               _loc2_.y = (this.var_77.height - this.var_907.height) / 2;
               _loc2_.x = this.var_77.width - 1;
               break;
            case const_434:
               _loc2_.bitmap = this.var_714.clone();
               _loc2_.width = this.var_714.width;
               _loc2_.height = this.var_714.height;
               _loc2_.y = (this.var_77.height - this.var_714.height) / 2;
               _loc2_.x = -1 * this.var_714.width + 1;
         }
         _loc2_.invalidate();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.show();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         this.hide();
      }
   }
}
