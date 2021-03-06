package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1644:String = "pricing_model_unknown";
      
      public static const const_473:String = "pricing_model_single";
      
      public static const const_426:String = "pricing_model_multi";
      
      public static const const_453:String = "pricing_model_bundle";
      
      public static const const_1418:String = "price_type_none";
      
      public static const const_667:String = "price_type_credits";
      
      public static const const_1175:String = "price_type_activitypoints";
      
      public static const const_1049:String = "price_type_credits_and_activitypoints";
       
      
      private var var_690:String;
      
      private var var_1083:String;
      
      private var _offerId:int;
      
      private var var_1652:String;
      
      private var var_1085:int;
      
      private var var_1084:int;
      
      private var var_1651:int;
      
      private var var_394:ICatalogPage;
      
      private var var_689:IProductContainer;
      
      private var var_2321:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1652 = param1.localizationId;
         this.var_1085 = param1.priceInCredits;
         this.var_1084 = param1.priceInActivityPoints;
         this.var_1651 = param1.activityPointType;
         this.var_394 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_394;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1652;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1085;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1084;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1651;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_689;
      }
      
      public function get pricingModel() : String
      {
         return this.var_690;
      }
      
      public function get priceType() : String
      {
         return this.var_1083;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2321;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2321 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1652 = "";
         this.var_1085 = 0;
         this.var_1084 = 0;
         this.var_1651 = 0;
         this.var_394 = null;
         if(this.var_689 != null)
         {
            this.var_689.dispose();
            this.var_689 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_690)
         {
            case const_473:
               this.var_689 = new SingleProductContainer(this,param1);
               break;
            case const_426:
               this.var_689 = new MultiProductContainer(this,param1);
               break;
            case const_453:
               this.var_689 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_690);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_690 = const_473;
            }
            else
            {
               this.var_690 = const_426;
            }
         }
         else if(param1.length > 1)
         {
            this.var_690 = const_453;
         }
         else
         {
            this.var_690 = const_1644;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1085 > 0 && this.var_1084 > 0)
         {
            this.var_1083 = const_1049;
         }
         else if(this.var_1085 > 0)
         {
            this.var_1083 = const_667;
         }
         else if(this.var_1084 > 0)
         {
            this.var_1083 = const_1175;
         }
         else
         {
            this.var_1083 = const_1418;
         }
      }
   }
}
