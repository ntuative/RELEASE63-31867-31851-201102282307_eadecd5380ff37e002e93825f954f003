package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2512:XML;
      
      private var var_2511:XML;
      
      private var var_2509:XML;
      
      private var var_925:IWindowContainer;
      
      private var var_609:IButtonWindow;
      
      private var var_2820:IButtonWindow;
      
      private var var_1773:ITextWindow;
      
      private var var_1772:ITextWindow;
      
      private var var_1774:ITextWindow;
      
      private var var_2783:ITextWindow;
      
      private var var_91:Offer;
      
      private var var_2510:String = "";
      
      private var var_1404:Function;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         events.removeEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.removeEventListener(WidgetEvent.const_639,this.onSetParameter);
         events.removeEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2512 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2511 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2509 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_639,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1404 = param1.callback;
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_667:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2512) as IWindowContainer;
               break;
            case Offer.const_1175:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2511) as IWindowContainer;
               break;
            case Offer.const_1049:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2509) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_91.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_925 != null)
            {
               _window.removeChild(this.var_925);
               this.var_925.dispose();
            }
            this.var_925 = _loc2_;
            _window.addChild(_loc2_);
            this.var_925.x = 0;
            this.var_925.y = 0;
         }
         this.var_1773 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_1772 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_1774 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2783 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_609 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_609 != null)
         {
            if(this.var_1404 != null)
            {
               this.var_609.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1404);
            }
            else
            {
               this.var_609.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1404);
               this.var_609.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_609.disable();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_91 = param1.offer;
         this.attachStub(this.var_91.priceType);
         if(this.var_1773 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_91.priceInCredits));
            this.var_1773.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_91.activityPointType == Purse.const_172 ? "pixels" : "activitypoints";
         if(this.var_1772 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_91.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_91.priceInActivityPoints.toString());
            this.var_1772.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_1774 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_91.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_91.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_91.priceInActivityPoints));
            this.var_1774.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_91.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_609 != null)
         {
            this.var_609.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_2510 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_91 != null)
         {
            Logger.log("Init Purchase: " + this.var_91.offerId + " " + this.var_91.localizationId);
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_91,page.pageId,this.var_2510);
         }
      }
   }
}
