package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IPetImageListener
   {
      
      private static const const_938:int = 2;
      
      private static const const_1293:Array = [0,0,0];
       
      
      private var var_587:PetVisualizationData = null;
      
      private var var_520:Map;
      
      private var var_1194:int = 0;
      
      private var var_534:int = 0;
      
      private var var_859:Boolean;
      
      private var var_645:String;
      
      private var var_1193:int = 0;
      
      private var _updateTimes:Array;
      
      private var var_588:BitmapDataAsset;
      
      private var _experienceData:ExperienceData;
      
      private var var_659:Boolean = false;
      
      private var var_1897:Boolean = false;
      
      private const const_2001:int = 3;
      
      private var var_1627:int = -1;
      
      private const const_940:int = 0;
      
      private const const_1716:int = 1;
      
      private const const_1683:int = 2;
      
      private const const_1295:int = 3;
      
      private var var_58:IAvatarImage = null;
      
      private var var_236:String = "";
      
      private var _postureParameter:String = "";
      
      private var _isSleeping:Boolean = false;
      
      private var var_1354:Boolean = false;
      
      private var var_1706:Boolean = false;
      
      private var var_1103:Boolean = false;
      
      private var var_1898:Boolean = false;
      
      private var var_1355:String = "";
      
      private var var_1422:int = 0;
      
      private var var_2077:int = 0;
      
      private var var_1702:Number = NaN;
      
      private var var_1703:int = -1;
      
      private var var_1701:int = -1;
      
      public function PetVisualization()
      {
         super();
         this._updateTimes = new Array();
         this.var_520 = new Map();
         this.var_859 = false;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_659;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(this.var_520 != null)
         {
            _loc1_ = this.var_520.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = this.var_520.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         this.var_520.dispose();
         if(this._experienceData)
         {
            this._experienceData.dispose();
         }
         this._experienceData = null;
         this.var_587 = null;
         this.var_659 = true;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_587 = param1 as PetVisualizationData;
         createSprites(this.const_1295);
         var _loc2_:BitmapData = (this.var_587.getAvatarRendererAsset("pet_experience_bubble_png") as BitmapDataAsset).content as BitmapData;
         this._experienceData = new ExperienceData(_loc2_.clone());
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_164)
         {
            this._isSleeping = param1.getNumber(RoomObjectVariableEnum.const_352) > 0;
            this.var_1355 = param1.getString(RoomObjectVariableEnum.const_262);
            this.var_236 = param1.getString(RoomObjectVariableEnum.const_367);
            this._postureParameter = param1.getString(RoomObjectVariableEnum.const_826);
            this.var_1702 = param1.getNumber(RoomObjectVariableEnum.const_317);
            this.var_1422 = param1.getNumber(RoomObjectVariableEnum.const_788);
            this.var_2077 = param1.getNumber(RoomObjectVariableEnum.const_637);
            this.validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_198);
            if(this.var_645 != _loc3_)
            {
               this.var_645 = _loc3_;
               this.resetAvatarImages();
            }
            var_164 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_520)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_520.reset();
         this.var_58 = null;
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         this.var_1898 = false;
         switch(this.var_236)
         {
            case AvatarAction.const_449:
            case AvatarAction.const_1168:
            case AvatarAction.const_1092:
            case AvatarAction.const_1140:
            case AvatarAction.const_1087:
            case AvatarAction.const_1003:
            case AvatarAction.const_902:
            case AvatarAction.const_324:
            case AvatarAction.const_218:
               this.var_1898 = true;
         }
         this.var_1706 = false;
         this.var_1103 = false;
         if(this.var_236 == "lay")
         {
            this.var_1103 = true;
            _loc1_ = int(this._postureParameter);
            if(_loc1_ < 0)
            {
               this.var_1706 = true;
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_447 != param1.getUpdateID() || this.var_1627 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = this.var_1702;
            if(isNaN(this.var_1702))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
            if(_loc4_ != this.var_1703 || param3)
            {
               this.var_1703 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_34,_loc4_);
            }
            if(_loc5_ != this.var_1701 || param3)
            {
               this.var_1701 = _loc5_;
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_50,_loc5_);
            }
            var_447 = param1.getUpdateID();
            this.var_1627 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_520.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_587.getAvatar(this.var_645,param1,this);
            if(_loc3_ != null)
            {
               this.var_520.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1716);
         this.var_588 = null;
         _loc2_ = getSprite(this.const_1716);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 < 48)
         {
            this.var_588 = this.var_58.getAsset("sh_std_sd_1_0_0");
            _loc3_ = -8;
            _loc4_ = -3;
         }
         else
         {
            this.var_588 = this.var_58.getAsset("h_std_sd_1_0_0");
            _loc3_ = -17;
            _loc4_ = -7;
         }
         if(this.var_588)
         {
            _loc2_.asset = this.var_588.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 1;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_587 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         if(this.var_1897)
         {
            this.var_1897 = false;
            this.var_1194 = 0;
            this.var_1193 = 1;
            this.resetAvatarImages();
         }
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = this.updateModel(_loc5_,_loc6_);
         if(_loc9_ || _loc6_ != var_182 || this.var_58 == null)
         {
            if(_loc6_ != var_182)
            {
               var_182 = _loc6_;
               _loc7_ = true;
            }
            if(_loc7_ || this.var_58 == null)
            {
               this.var_58 = this.getAvatarImage(_loc6_);
            }
            if(this.var_58 == null)
            {
               return;
            }
            if(_loc7_)
            {
               this.updateShadow(_loc6_);
            }
            _loc8_ = this.updateObject(_loc4_,param1,true);
            this.updateActions(this.var_58);
         }
         else
         {
            _loc8_ = this.updateObject(_loc4_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = this.var_859 || this.var_1193 > 0 || this.var_1898;
         this._experienceData.alpha = 0;
         if(this.var_1422 > 0)
         {
            _loc12_ = param2 - this.var_1422;
            if(_loc12_ < AvatarAction.const_959)
            {
               this._experienceData.alpha = int(Math.sin(_loc12_ / 0 * 0) * 255);
               this._experienceData.setExperience(this.var_2077);
               this.var_1193 = this.const_2001;
            }
            else
            {
               this.var_1422 = 0;
            }
            _loc13_ = getSprite(this.const_1683);
            if(_loc13_ != null)
            {
               if(this._experienceData.alpha > 0)
               {
                  _loc13_.asset = this._experienceData.image;
                  _loc13_.offsetX = -20;
                  _loc13_.offsetY = -80;
                  _loc13_.alpha = this._experienceData.alpha;
                  _loc13_.visible = true;
               }
               else
               {
                  _loc13_.asset = null;
                  _loc13_.visible = false;
               }
            }
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --this.var_1193;
            ++this.var_534;
            --this.var_1194;
            if(!(this.var_1194 <= 0 || _loc7_))
            {
               return;
            }
            this.var_58.updateAnimationByFrames(1);
            this.var_1194 = const_938;
            this.var_859 = this.var_58.isAnimating();
            _loc14_ = this.var_58.getCanvasOffsets();
            if(_loc14_ == null || _loc14_.length < 3)
            {
               _loc14_ = const_1293;
            }
            _loc15_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc15_ = Math.min(_loc6_ / 2.75,0);
            }
            _loc13_ = getSprite(this.const_940);
            if(_loc13_)
            {
               _loc18_ = this.var_58.getImage(AvatarSetType.const_34,false);
               if(_loc18_ != null)
               {
                  _loc13_.asset = _loc18_;
               }
               if(_loc6_ < 48)
               {
                  _loc13_.offsetX = -16 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 8 + _loc14_[1] + _loc15_;
               }
               else
               {
                  _loc13_.offsetX = -32 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 16 + _loc14_[1] + _loc15_;
               }
            }
            _loc16_ = this.const_1295;
            for each(_loc17_ in this.var_58.getSprites())
            {
               _loc13_ = getSprite(_loc16_);
               if(_loc13_ != null)
               {
                  _loc19_ = this.var_58.getLayerData(_loc17_);
                  _loc20_ = 0;
                  _loc21_ = _loc17_.getDirectionOffsetX(this.var_58.getDirection());
                  _loc22_ = _loc17_.getDirectionOffsetY(this.var_58.getDirection());
                  _loc23_ = _loc17_.getDirectionOffsetZ(this.var_58.getDirection());
                  _loc24_ = 0;
                  if(_loc17_.hasDirections)
                  {
                     _loc24_ = this.var_58.getDirection();
                  }
                  if(_loc19_ != null)
                  {
                     _loc20_ = _loc19_.animationFrame;
                     _loc21_ += _loc19_.dx;
                     _loc22_ += _loc19_.dy;
                     _loc24_ += _loc19_.directionOffset;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc21_ /= 2;
                     _loc22_ /= 2;
                  }
                  if(_loc24_ < 0)
                  {
                     _loc24_ += 8;
                  }
                  if(_loc24_ > 7)
                  {
                     _loc24_ -= 8;
                  }
                  _loc25_ = this.var_58.getScale() + "_" + _loc17_.member + "_" + _loc24_ + "_" + _loc20_;
                  _loc26_ = this.var_58.getAsset(_loc25_);
                  if(_loc26_ != null)
                  {
                     _loc13_.asset = _loc26_.content as BitmapData;
                     _loc13_.offsetX = -1 * _loc26_.offset.x - _loc6_ / 2 + _loc21_;
                     _loc13_.offsetY = -1 * _loc26_.offset.y + _loc22_;
                     _loc13_.relativeDepth = -0.01 - 0.1 * _loc16_ * _loc23_;
                     if(_loc17_.ink == 33)
                     {
                        _loc13_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc13_.blendMode = BlendMode.NORMAL;
                     }
                     _loc16_++;
                  }
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_393,this.var_236,this._postureParameter);
         if(this.var_1355 != null && this.var_1355 != "")
         {
            param1.appendAction(AvatarAction.const_305,this.var_1355);
         }
         if(this._isSleeping || this.var_1354)
         {
            param1.appendAction(AvatarAction.const_528);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + this.const_1295;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function imageReady() : void
      {
         this.var_1897 = true;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.resetAvatarImages();
      }
   }
}
