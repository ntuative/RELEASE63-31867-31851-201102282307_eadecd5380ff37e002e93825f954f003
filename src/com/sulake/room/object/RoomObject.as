package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1070:int = 0;
       
      
      private var _id:int;
      
      private var _type:String = "";
      
      private var var_81:Vector3d;
      
      private var var_266:Vector3d;
      
      private var var_1662:Vector3d;
      
      private var var_1661:Vector3d;
      
      private var var_575:Array;
      
      private var var_66:RoomObjectModel;
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_576:IRoomObjectEventHandler;
      
      private var _updateID:int;
      
      private var _instanceId:int = 0;
      
      public function RoomObject(param1:int, param2:int)
      {
         super();
         this._id = param1;
         this.var_81 = new Vector3d();
         this.var_266 = new Vector3d();
         this.var_1662 = new Vector3d();
         this.var_1661 = new Vector3d();
         this.var_575 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            this.var_575[_loc3_] = 0;
            _loc3_--;
         }
         this.var_66 = new RoomObjectModel();
         this._visualization = null;
         this.var_576 = null;
         this._updateID = 0;
         this._instanceId = var_1070++;
      }
      
      public function dispose() : void
      {
         this.var_81 = null;
         this.var_266 = null;
         if(this.var_66 != null)
         {
            this.var_66.dispose();
            this.var_66 = null;
         }
         this.var_575 = null;
         this.setVisualization(null);
         this.setEventHandler(null);
      }
      
      public function getId() : int
      {
         return this._id;
      }
      
      public function getType() : String
      {
         return this._type;
      }
      
      public function getInstanceId() : int
      {
         return this._instanceId;
      }
      
      public function getLocation() : IVector3d
      {
         this.var_1662.assign(this.var_81);
         return this.var_1662;
      }
      
      public function getDirection() : IVector3d
      {
         this.var_1661.assign(this.var_266);
         return this.var_1661;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return this.var_66;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return this.var_66;
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < this.var_575.length)
         {
            return this.var_575[param1];
         }
         return -1;
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return this._visualization;
      }
      
      public function setType(param1:String) : void
      {
         this._type = param1;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_81.x != param1.x || this.var_81.y != param1.y || this.var_81.z != param1.z)
         {
            this.var_81.x = param1.x;
            this.var_81.y = param1.y;
            this.var_81.z = param1.z;
            ++this._updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_266.x != param1.x || this.var_266.y != param1.y || this.var_266.z != param1.z)
         {
            this.var_266.x = (param1.x % 360 + 360) % 360;
            this.var_266.y = (param1.y % 360 + 360) % 360;
            this.var_266.z = (param1.z % 360 + 360) % 360;
            ++this._updateID;
         }
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < this.var_575.length)
         {
            if(this.var_575[param2] != param1)
            {
               this.var_575[param2] = param1;
               ++this._updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != this._visualization)
         {
            if(this._visualization != null)
            {
               this._visualization.dispose();
            }
            this._visualization = param1;
            if(this._visualization != null)
            {
               this._visualization.object = this;
            }
         }
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == this.var_576)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = this.var_576;
         if(_loc2_ != null)
         {
            this.var_576 = null;
            _loc2_.object = null;
         }
         this.var_576 = param1;
         if(this.var_576 != null)
         {
            this.var_576.object = this;
         }
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return this.var_576;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return this.getEventHandler();
      }
   }
}
