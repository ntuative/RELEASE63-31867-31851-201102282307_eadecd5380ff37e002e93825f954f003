package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_781;
         param1["bitmap"] = const_808;
         param1["border"] = const_833;
         param1["border_notify"] = const_1373;
         param1["button"] = const_522;
         param1["button_thick"] = const_886;
         param1["button_icon"] = const_1546;
         param1["button_group_left"] = const_873;
         param1["button_group_center"] = const_812;
         param1["button_group_right"] = const_655;
         param1["canvas"] = const_617;
         param1["checkbox"] = const_728;
         param1["closebutton"] = const_1015;
         param1["container"] = const_334;
         param1["container_button"] = const_666;
         param1["display_object_wrapper"] = const_719;
         param1["dropmenu"] = const_534;
         param1["dropmenu_item"] = const_454;
         param1["frame"] = const_370;
         param1["frame_notify"] = const_1594;
         param1["header"] = const_848;
         param1["html"] = const_1166;
         param1["icon"] = const_1059;
         param1["itemgrid"] = const_1152;
         param1["itemgrid_horizontal"] = const_459;
         param1["itemgrid_vertical"] = const_874;
         param1["itemlist"] = const_1005;
         param1["itemlist_horizontal"] = const_405;
         param1["itemlist_vertical"] = const_407;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1551;
         param1["menu"] = const_1499;
         param1["menu_item"] = const_1540;
         param1["submenu"] = const_1034;
         param1["minimizebox"] = const_1532;
         param1["notify"] = const_1530;
         param1["null"] = const_798;
         param1["password"] = const_753;
         param1["radiobutton"] = const_794;
         param1["region"] = const_899;
         param1["restorebox"] = const_1430;
         param1["scaler"] = const_772;
         param1["scaler_horizontal"] = const_1531;
         param1["scaler_vertical"] = const_1417;
         param1["scrollbar_horizontal"] = const_572;
         param1["scrollbar_vertical"] = const_871;
         param1["scrollbar_slider_button_up"] = const_1007;
         param1["scrollbar_slider_button_down"] = const_1081;
         param1["scrollbar_slider_button_left"] = const_1176;
         param1["scrollbar_slider_button_right"] = const_1024;
         param1["scrollbar_slider_bar_horizontal"] = const_1069;
         param1["scrollbar_slider_bar_vertical"] = const_1097;
         param1["scrollbar_slider_track_horizontal"] = const_999;
         param1["scrollbar_slider_track_vertical"] = const_1163;
         param1["scrollable_itemlist"] = const_1464;
         param1["scrollable_itemlist_vertical"] = const_553;
         param1["scrollable_itemlist_horizontal"] = const_1214;
         param1["selector"] = const_837;
         param1["selector_list"] = const_841;
         param1["submenu"] = const_1034;
         param1["tab_button"] = const_441;
         param1["tab_container_button"] = const_984;
         param1["tab_context"] = const_382;
         param1["tab_content"] = const_1075;
         param1["tab_selector"] = const_832;
         param1["text"] = const_450;
         param1["input"] = const_830;
         param1["toolbar"] = const_1512;
         param1["tooltip"] = const_400;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
