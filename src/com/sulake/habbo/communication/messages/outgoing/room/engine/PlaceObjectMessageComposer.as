package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_319:int;
      
      private var var_2169:int;
      
      private var var_2168:String;
      
      private var _x:int = 0;
      
      private var var_146:int = 0;
      
      private var var_266:int = 0;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         this.var_319 = param1;
         this.var_2169 = param2;
         this.var_2168 = param3;
         this._x = param4;
         this.var_146 = param5;
         this.var_266 = param6;
         this._roomId = param7;
         this._roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(this.var_2169)
         {
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
               return [this.var_319 + " " + this._x + " " + this.var_146 + " " + this.var_266];
            case RoomObjectCategoryEnum.const_27:
               return [this.var_319 + " " + this.var_2168];
            default:
               return [];
         }
      }
   }
}
