package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_192;
         param1["bound_to_parent_rect"] = const_100;
         param1["child_window"] = const_1151;
         param1["embedded_controller"] = const_1112;
         param1["resize_to_accommodate_children"] = const_70;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_727;
         param1["mouse_dragging_target"] = const_259;
         param1["mouse_dragging_trigger"] = const_385;
         param1["mouse_scaling_target"] = const_286;
         param1["mouse_scaling_trigger"] = const_435;
         param1["horizontal_mouse_scaling_trigger"] = const_231;
         param1["vertical_mouse_scaling_trigger"] = const_233;
         param1["observe_parent_input_events"] = const_1149;
         param1["optimize_region_to_layout_size"] = const_532;
         param1["parent_window"] = const_1192;
         param1["relative_horizontal_scale_center"] = const_182;
         param1["relative_horizontal_scale_fixed"] = const_139;
         param1["relative_horizontal_scale_move"] = const_371;
         param1["relative_horizontal_scale_strech"] = const_373;
         param1["relative_scale_center"] = const_1004;
         param1["relative_scale_fixed"] = const_787;
         param1["relative_scale_move"] = const_1012;
         param1["relative_scale_strech"] = const_1128;
         param1["relative_vertical_scale_center"] = const_175;
         param1["relative_vertical_scale_fixed"] = const_154;
         param1["relative_vertical_scale_move"] = const_339;
         param1["relative_vertical_scale_strech"] = const_279;
         param1["on_resize_align_left"] = const_816;
         param1["on_resize_align_right"] = const_561;
         param1["on_resize_align_center"] = const_493;
         param1["on_resize_align_top"] = const_777;
         param1["on_resize_align_bottom"] = const_483;
         param1["on_resize_align_middle"] = const_520;
         param1["on_accommodate_align_left"] = const_1121;
         param1["on_accommodate_align_right"] = const_495;
         param1["on_accommodate_align_center"] = const_796;
         param1["on_accommodate_align_top"] = const_979;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_776;
         param1["route_input_events_to_parent"] = const_494;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_1195;
         param1["scalable_with_mouse"] = const_1019;
         param1["reflect_horizontal_resize_to_parent"] = const_559;
         param1["reflect_vertical_resize_to_parent"] = const_514;
         param1["reflect_resize_to_parent"] = const_289;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1114;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
