package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_930:int = 20;
      
      private static const const_609:int = 10;
      
      private static const const_1261:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_306:Array;
      
      private var var_665:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_306 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_665)
            {
               this.var_665 = true;
               this.var_306 = new Array();
               this.var_306.push(const_1261);
               this.var_306.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_609)
         {
            if(this.var_665)
            {
               this.var_665 = false;
               this.var_306 = new Array();
               if(_direction == 2)
               {
                  this.var_306.push(const_930 + 5 - param1);
                  this.var_306.push(const_609 + 5 - param1);
               }
               else
               {
                  this.var_306.push(const_930 + param1);
                  this.var_306.push(const_609 + param1);
               }
               this.var_306.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
