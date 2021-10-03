package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_166:String = "RSUBE_FIGURE";
       
      
      private var _userId:int = 0;
      
      private var var_645:String = "";
      
      private var var_987:String = "";
      
      private var var_1768:String = "";
      
      private var var_2110:int;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:String, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super(const_166,param1,param7,param8);
         this._userId = param2;
         this.var_645 = param3;
         this.var_987 = param4;
         this.var_1768 = param5;
         this.var_2110 = param6;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get figure() : String
      {
         return this.var_645;
      }
      
      public function get gender() : String
      {
         return this.var_987;
      }
      
      public function get customInfo() : String
      {
         return this.var_1768;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2110;
      }
   }
}
