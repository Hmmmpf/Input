function __input_class_combo_container(_name, _combo_def) constructor
{
    __name = _name;
    __combo_def = _combo_def;
    __active_index = 1;
    __combo_state_array = [];
    
    array_push(__combo_state_array, new __input_class_combo_state(__name, __combo_def));
    
    __get_highest_variables();
    
    static __reset = function()
    {
        var i = 0;
        repeat(__active_index)
        {
            __combo_state_array[i].__reset();
            i++;
        }
        __active_index = 1;
        __get_highest_variables();
    }
    
    static __get_highest_variables = function()
    {
        var _highest_phase = __combo_state_array[0];
        __success   = _highest_phase.__success;
        __direction = _highest_phase.__direction;
        
        __new_phase   = _highest_phase.__new_phase;
        __phase       = _highest_phase.__phase;
        __start_time  = _highest_phase.__start_time;
        
        __charge_trigger    = _highest_phase.__charge_trigger;
        __charge_measure    = _highest_phase.__charge_measure;
        __charge_start_time = _highest_phase.__charge_start_time;
        __charge_end_time   = _highest_phase.__charge_end_time;
    }
    
    static __evaluate = function(_player_verb_struct)
    {
        var _result = false;
        var i = 0;
        var _min_phase = 0;
        
        repeat(__active_index)
        {
            _result = _result || __combo_state_array[i].__evaluate(_player_verb_struct);
            _min_phase = min(_min_phase, __combo_state_array[i].__phase);
            i++;
        }
        if(_min_phase > 0){
            if(array_length(__combo_state_array) = i)
            {
                array_push(__combo_state_array, new __input_class_combo_state(__name, __combo_def));
            }
        
            _result = _result || __combo_state_array[i].__evaluate(_player_verb_struct);
            if(__combo_state_array[i].__phase > 0){
                __active_index += 1;
            }
        }
        show_debug_message(array_length(__combo_state_array))
        array_sort(__combo_state_array, function(_a,_b){
            return _b.__phase - _a.__phase;
        })
        
        i = 0;
        var _found_inactive = false;
        
        repeat(__active_index)
        {
            if(__combo_state_array[i].__phase == 0){
                if(!_found_inactive){
                    __active_index = i+1;
                    _found_inactive = true;
                }
            };
            i++;
        }
        if(_result)
        {
            __reset();
        }else{
            __get_highest_variables();
        }
        return _result;
    }
    
}