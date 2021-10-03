package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1316:int = 2;
      
      private static const const_1317:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_306:Array;
      
      private var var_1112:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_306 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1316)
         {
            this.var_306 = new Array();
            this.var_306.push(const_1317);
            this.var_1112 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1112 > 0)
         {
            --this.var_1112;
         }
         if(this.var_1112 == 0)
         {
            if(this.var_306.length > 0)
            {
               super.setAnimation(this.var_306.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
