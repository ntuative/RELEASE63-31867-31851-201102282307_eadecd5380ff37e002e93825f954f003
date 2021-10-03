package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultData;
   import flash.utils.Dictionary;
   
   public class AvatarSearchResults
   {
       
      
      private var var_397:IAvatarSearchDeps;
      
      private var var_202:Array;
      
      private var var_1573:Array;
      
      private var var_1572:Dictionary;
      
      public function AvatarSearchResults(param1:IAvatarSearchDeps)
      {
         this.var_1572 = new Dictionary();
         super();
         this.var_397 = param1;
      }
      
      public function getResult(param1:int) : HabboSearchResultData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in this.var_202)
         {
            if(_loc2_.avatarId == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc3_ in this.var_1573)
         {
            if(_loc3_.avatarId == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function searchReceived(param1:Array, param2:Array) : void
      {
         this.var_202 = param1;
         this.var_1573 = param2;
         this.var_397.view.refreshList();
      }
      
      public function get friends() : Array
      {
         return this.var_202;
      }
      
      public function get others() : Array
      {
         return this.var_1573;
      }
      
      public function setFriendRequestSent(param1:int) : void
      {
         this.var_1572[param1] = "yes";
      }
      
      public function isFriendRequestSent(param1:int) : Boolean
      {
         return this.var_1572[param1] != null;
      }
   }
}
