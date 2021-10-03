package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_742:TileHeightMap = null;
      
      private var var_1138:LegacyWallGeometry = null;
      
      private var var_1139:RoomCamera = null;
      
      private var var_744:SelectedRoomObjectData = null;
      
      private var var_743:SelectedRoomObjectData = null;
      
      private var var_2550:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1138 = new LegacyWallGeometry();
         this.var_1139 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_742;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_742 != null)
         {
            this.var_742.dispose();
         }
         this.var_742 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1138;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1139;
      }
      
      public function get worldType() : String
      {
         return this.var_2550;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2550 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_744;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_744 != null)
         {
            this.var_744.dispose();
         }
         this.var_744 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_743;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_743 != null)
         {
            this.var_743.dispose();
         }
         this.var_743 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_742 != null)
         {
            this.var_742.dispose();
            this.var_742 = null;
         }
         if(this.var_1138 != null)
         {
            this.var_1138.dispose();
            this.var_1138 = null;
         }
         if(this.var_1139 != null)
         {
            this.var_1139.dispose();
            this.var_1139 = null;
         }
         if(this.var_744 != null)
         {
            this.var_744.dispose();
            this.var_744 = null;
         }
         if(this.var_743 != null)
         {
            this.var_743.dispose();
            this.var_743 = null;
         }
      }
   }
}
