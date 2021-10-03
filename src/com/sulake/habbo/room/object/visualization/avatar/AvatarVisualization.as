package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
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
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_939:String = "avatar";
      
      private static const const_603:Number = -0.01;
      
      private static const const_604:Number = -0.409;
      
      private static const const_938:int = 2;
      
      private static const const_1293:Array = [0,0,0];
      
      private static const const_1294:int = 3;
       
      
      private var var_587:AvatarVisualizationData = null;
      
      private var var_520:Map;
      
      private var var_489:Map;
      
      private var var_1194:int = 0;
      
      private var var_859:Boolean;
      
      private var var_645:String;
      
      private var var_987:String;
      
      private var var_1193:int = 0;
      
      private var var_588:BitmapDataAsset;
      
      private var var_902:BitmapDataAsset;
      
      private var var_1702:int = -1;
      
      private var var_1703:int = -1;
      
      private var var_1701:int = -1;
      
      private const const_940:int = 0;
      
      private const const_1716:int = 1;
      
      private const const_1683:int = 2;
      
      private const const_1684:int = 3;
      
      private const const_1295:int = 4;
      
      private var var_1627:int = -1;
      
      private var var_236:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1704:Boolean = false;
      
      private var var_1705:Boolean = false;
      
      private var _isSleeping:Boolean = false;
      
      private var var_1354:Boolean = false;
      
      private var var_565:Boolean = false;
      
      private var var_1355:int = 0;
      
      private var var_1352:int = 0;
      
      private var var_2408:int = 0;
      
      private var var_705:int = 0;
      
      private var var_707:int = 0;
      
      private var var_586:int = 0;
      
      private var var_1353:int = 0;
      
      private var var_1103:Boolean = false;
      
      private var var_1706:Boolean = false;
      
      private var var_1105:int = 0;
      
      private var var_706:int = 0;
      
      private var var_1700:Boolean = false;
      
      private var var_1104:int = 0;
      
      private var var_58:IAvatarImage = null;
      
      private var var_659:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_520 = new Map();
         this.var_489 = new Map();
         this.var_859 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_520 != null)
         {
            this.resetImages();
            this.var_520.dispose();
            this.var_489.dispose();
            this.var_520 = null;
         }
         this.var_587 = null;
         this.var_588 = null;
         this.var_902 = null;
         super.dispose();
         this.var_659 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_659;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_587 = param1 as AvatarVisualizationData;
         createSprites(this.const_1295);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_164)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_270) > 0 && param3);
            if(_loc5_ != this.var_1704)
            {
               this.var_1704 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_359) > 0;
            if(_loc5_ != this.var_1705)
            {
               this.var_1705 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_352) > 0;
            if(_loc5_ != this._isSleeping)
            {
               this._isSleeping = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_721) > 0 && param3);
            if(_loc5_ != this.var_1354)
            {
               this.var_1354 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_985) > 0;
            if(_loc5_ != this.var_565)
            {
               this.var_565 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_262);
            if(_loc6_ != this.var_1355)
            {
               this.var_1355 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_367);
            if(_loc7_ != this.var_236)
            {
               this.var_236 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_826);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1032);
            if(_loc6_ != this.var_1352)
            {
               this.var_1352 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_512);
            if(_loc6_ != this.var_705)
            {
               this.var_705 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_538);
            if(_loc6_ != this.var_707)
            {
               this.var_707 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_338);
            if(_loc6_ != this.var_586)
            {
               this.var_586 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_317);
            if(_loc6_ != this.var_1702)
            {
               this.var_1702 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_707 > 0 && param1.getNumber(RoomObjectVariableEnum.const_338) > 0)
            {
               if(this.var_586 != this.var_707)
               {
                  this.var_586 = this.var_707;
                  _loc4_ = true;
               }
            }
            else if(this.var_586 != 0)
            {
               this.var_586 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_885);
            if(_loc6_ != this.var_1105)
            {
               this.var_1105 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1119);
            if(_loc7_ != this.var_987)
            {
               this.var_987 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_198);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_164 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_645 != param1)
         {
            this.var_645 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_520)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_489)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_520.reset();
         this.var_489.reset();
         this.var_58 = null;
         _loc2_ = getSprite(this.const_940);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1354 = false;
         }
         if(this.var_236 == "sit" || this.var_236 == "lay")
         {
            this.var_1353 = param1 / 2;
         }
         else
         {
            this.var_1353 = 0;
         }
         this.var_1706 = false;
         this.var_1103 = false;
         if(this.var_236 == "lay")
         {
            this.var_1103 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1706 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_520.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_489.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_587.getAvatar(this.var_645,param1,this.var_987,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_520.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_489.length >= const_1294)
                  {
                     this.var_489.remove(this.var_489.getKeys().shift());
                  }
                  this.var_489.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_447 != param1.getUpdateID() || this.var_1627 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1702;
            if(this.var_236 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1703 || param4)
            {
               _loc5_ = true;
               this.var_1703 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_58.setDirectionAngle(AvatarSetType.const_34,_loc6_);
            }
            if(_loc7_ != this.var_1701 || param4)
            {
               _loc5_ = true;
               this.var_1701 = _loc7_;
               if(this.var_1701 != this.var_1703)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_58.setDirectionAngle(AvatarSetType.const_50,_loc7_);
               }
            }
            var_447 = param1.getUpdateID();
            this.var_1627 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1716);
         this.var_588 = null;
         if(this.var_236 == "mv" || this.var_236 == "std")
         {
            _loc2_.visible = true;
            if(this.var_588 == null || param1 != var_182)
            {
               _loc3_ = 0;
               _loc4_ = 0;
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
               if(this.var_588 != null)
               {
                  _loc2_.asset = this.var_588.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_588 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_902 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1683);
         if(this.var_565)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_902 = this.var_587.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_902 = this.var_587.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_236 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_236 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_902 != null)
            {
               _loc2_.asset = this.var_902.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1684);
         if(this.var_1105 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_587.getAvatarRendererAsset("number_" + this.var_1105 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_587.getAvatarRendererAsset("number_" + this.var_1105 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_236 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_236 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_706 = 1;
               this.var_1700 = true;
               this.var_1104 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_706 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1684);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1700)
         {
            ++this.var_1104;
            if(this.var_1104 < 10)
            {
               return false;
            }
            if(this.var_706 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1104 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_706 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_706 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_706 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_706 = 0;
               this.var_1700 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
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
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = this.var_705;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = this.updateModel(_loc5_,_loc6_,param3);
         if(this.animateNumberBubble(_loc6_))
         {
            increaseUpdateId();
         }
         if(_loc12_ || _loc6_ != var_182 || this.var_58 == null)
         {
            if(_loc6_ != var_182)
            {
               _loc8_ = true;
               this.validateActions(_loc6_);
            }
            if(_loc10_ != this.var_705)
            {
               _loc11_ = true;
            }
            if(_loc8_ || this.var_58 == null || _loc11_)
            {
               this.var_58 = this.getAvatarImage(_loc6_,this.var_705);
               if(this.var_58 == null)
               {
                  return;
               }
               _loc7_ = true;
               _loc15_ = getSprite(this.const_940);
               if(_loc15_ && this.var_58 && this.var_58.isPlaceholder())
               {
                  _loc15_.alpha = 150;
               }
               else if(_loc15_)
               {
                  _loc15_.alpha = 255;
               }
            }
            if(this.var_58 == null)
            {
               return;
            }
            this.updateShadow(_loc6_);
            if(_loc8_)
            {
               this.updateTypingBubble(_loc6_);
               this.updateNumberBubble(_loc6_);
            }
            _loc9_ = this.updateObject(_loc4_,param1,param3,true);
            this.updateActions(this.var_58);
            var_182 = _loc6_;
         }
         else
         {
            _loc9_ = this.updateObject(_loc4_,param1,param3);
         }
         var _loc13_:Boolean = _loc9_ || _loc12_ || _loc8_;
         var _loc14_:Boolean = (this.var_859 || this.var_1193 > 0) && param3;
         if(_loc13_)
         {
            this.var_1193 = const_938;
         }
         if(_loc13_ || _loc14_)
         {
            increaseUpdateId();
            --this.var_1193;
            --this.var_1194;
            if(!(this.var_1194 <= 0 || _loc8_ || _loc12_ || _loc7_))
            {
               return;
            }
            this.var_58.updateAnimationByFrames(1);
            this.var_1194 = const_938;
            _loc17_ = this.var_58.getCanvasOffsets();
            if(_loc17_ == null || _loc17_.length < 3)
            {
               _loc17_ = const_1293;
            }
            _loc16_ = getSprite(this.const_940);
            if(_loc16_ != null)
            {
               _loc20_ = this.var_58.getImage(AvatarSetType.const_34,false);
               if(_loc20_ != null)
               {
                  _loc16_.asset = _loc20_;
               }
               if(_loc16_.asset)
               {
                  _loc16_.offsetX = -1 * _loc6_ / 2 + _loc17_[0];
                  _loc16_.offsetY = -_loc16_.asset.height + _loc6_ / 4 + _loc17_[1] + this.var_1353;
               }
               if(this.var_1103)
               {
                  if(this.var_1706)
                  {
                     _loc16_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc16_.relativeDepth = const_604 + _loc17_[2];
                  }
               }
               else
               {
                  _loc16_.relativeDepth = const_603 + _loc17_[2];
               }
            }
            _loc16_ = getSprite(this.const_1683);
            if(_loc16_ != null && _loc16_.visible)
            {
               if(!this.var_1103)
               {
                  _loc16_.relativeDepth = const_603 - 0.01 + _loc17_[2];
               }
               else
               {
                  _loc16_.relativeDepth = const_604 - 0.01 + _loc17_[2];
               }
            }
            this.var_859 = this.var_58.isAnimating();
            _loc18_ = this.const_1295;
            for each(_loc19_ in this.var_58.getSprites())
            {
               if(_loc19_.id == const_939)
               {
                  _loc16_ = getSprite(this.const_940);
                  _loc21_ = this.var_58.getLayerData(_loc19_);
                  _loc22_ = _loc19_.getDirectionOffsetX(this.var_58.getDirection());
                  _loc23_ = _loc19_.getDirectionOffsetY(this.var_58.getDirection());
                  if(_loc21_ != null)
                  {
                     _loc22_ += _loc21_.dx;
                     _loc23_ += _loc21_.dy;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc22_ /= 2;
                     _loc23_ /= 2;
                  }
                  _loc16_.offsetX += _loc22_;
                  _loc16_.offsetY += _loc23_;
               }
               else
               {
                  _loc16_ = getSprite(_loc18_);
                  if(_loc16_ != null)
                  {
                     _loc16_.capturesMouse = false;
                     _loc16_.visible = true;
                     _loc24_ = this.var_58.getLayerData(_loc19_);
                     _loc25_ = 0;
                     _loc26_ = _loc19_.getDirectionOffsetX(this.var_58.getDirection());
                     _loc27_ = _loc19_.getDirectionOffsetY(this.var_58.getDirection());
                     _loc28_ = _loc19_.getDirectionOffsetZ(this.var_58.getDirection());
                     _loc29_ = 0;
                     if(_loc19_.hasDirections)
                     {
                        _loc29_ = this.var_58.getDirection();
                     }
                     if(_loc24_ != null)
                     {
                        _loc25_ = _loc24_.animationFrame;
                        _loc26_ += _loc24_.dx;
                        _loc27_ += _loc24_.dy;
                        _loc29_ += _loc24_.directionOffset;
                     }
                     if(_loc6_ < 48)
                     {
                        _loc26_ /= 2;
                        _loc27_ /= 2;
                     }
                     if(_loc29_ < 0)
                     {
                        _loc29_ += 8;
                     }
                     else if(_loc29_ > 7)
                     {
                        _loc29_ -= 8;
                     }
                     _loc30_ = this.var_58.getScale() + "_" + _loc19_.member + "_" + _loc29_ + "_" + _loc25_;
                     _loc31_ = this.var_58.getAsset(_loc30_);
                     if(_loc31_ == null)
                     {
                        continue;
                     }
                     _loc16_.asset = _loc31_.content as BitmapData;
                     _loc16_.offsetX = -_loc31_.offset.x - _loc6_ / 2 + _loc26_;
                     _loc16_.offsetY = -_loc31_.offset.y + _loc27_ + this.var_1353;
                     if(this.var_1103)
                     {
                        _loc16_.relativeDepth = const_604 - 0.001 * spriteCount * _loc28_;
                     }
                     else
                     {
                        _loc16_.relativeDepth = const_603 - 0.001 * spriteCount * _loc28_;
                     }
                     if(_loc19_.ink == 33)
                     {
                        _loc16_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc16_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc18_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_393,this.var_236,this._postureParameter);
         if(this.var_1355 > 0)
         {
            param1.appendAction(AvatarAction.const_305,AvatarAction.const_1650[this.var_1355]);
         }
         if(this.var_1352 > 0)
         {
            param1.appendAction(AvatarAction.const_650,this.var_1352);
         }
         if(this.var_2408 > 0)
         {
            param1.appendAction(AvatarAction.const_701,this.var_2408);
         }
         if(this.var_707 > 0)
         {
            param1.appendAction(AvatarAction.const_815,this.var_707);
         }
         if(this.var_586 > 0)
         {
            param1.appendAction(AvatarAction.const_621,this.var_586);
         }
         if(this.var_1704)
         {
            param1.appendAction(AvatarAction.const_324);
         }
         if(this._isSleeping || this.var_1354)
         {
            param1.appendAction(AvatarAction.const_528);
         }
         if(this.var_1705)
         {
            param1.appendAction(AvatarAction.const_218);
         }
         if(this.var_705 > 0)
         {
            param1.appendAction(AvatarAction.const_288,this.var_705);
         }
         param1.endActionAppends();
         this.var_859 = param1.isAnimating();
         var _loc2_:int = this.const_1295;
         for each(_loc3_ in this.var_58.getSprites())
         {
            if(_loc3_.id != const_939)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
