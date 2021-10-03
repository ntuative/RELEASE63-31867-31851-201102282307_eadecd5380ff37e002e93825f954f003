package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_782:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_659)
         {
            _structure = null;
            _assets = null;
            var_228 = null;
            var_271 = null;
            var_645 = null;
            var_533 = null;
            var_315 = null;
            if(!var_1240 && var_44)
            {
               var_44.dispose();
            }
            var_44 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_729 = null;
            var_659 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_782[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_782[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_393:
               switch(_loc3_)
               {
                  case AvatarAction.const_861:
                  case AvatarAction.const_449:
                  case AvatarAction.const_377:
                  case AvatarAction.const_751:
                  case AvatarAction.const_354:
                  case AvatarAction.const_868:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_288:
            case AvatarAction.const_650:
            case AvatarAction.const_218:
            case AvatarAction.const_701:
            case AvatarAction.const_815:
            case AvatarAction.const_621:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
