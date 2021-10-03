package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_396:int = 1;
      
      public static const const_229:int = 2;
      
      public static const const_292:int = 3;
      
      public static const const_403:int = 4;
      
      public static const const_215:int = 5;
      
      public static const const_408:int = 1;
      
      public static const const_835:int = 2;
      
      public static const const_740:int = 3;
      
      public static const const_654:int = 4;
      
      public static const const_232:int = 5;
      
      public static const const_657:int = 6;
      
      public static const const_693:int = 7;
      
      public static const const_251:int = 8;
      
      public static const const_337:int = 9;
      
      public static const const_1839:int = 10;
      
      public static const const_653:int = 11;
      
      public static const const_526:int = 12;
       
      
      private var var_409:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_409 = new Array();
         this.var_409.push(new Tab(this._navigator,const_396,const_526,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_482));
         this.var_409.push(new Tab(this._navigator,const_229,const_408,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_482));
         this.var_409.push(new Tab(this._navigator,const_403,const_653,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1070));
         this.var_409.push(new Tab(this._navigator,const_292,const_232,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_482));
         this.var_409.push(new Tab(this._navigator,const_215,const_251,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_652));
         this.setSelectedTab(const_396);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_403;
      }
      
      public function get tabs() : Array
      {
         return this.var_409;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_409)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_409)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_409)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
