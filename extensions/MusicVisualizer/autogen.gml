#define mv_load
/// mv_load(songPath:string)->number
var _buf = MusicVisualizer_prepare_buffer(1);
return mv_load_raw(buffer_get_address(_buf), argument0);

#define mv_get_channels
/// mv_get_channels(AudioID:int)->int
var _buf = MusicVisualizer_prepare_buffer(4);
buffer_write(_buf, buffer_s32, argument0);
return mv_get_channels_raw(buffer_get_address(_buf));

#define mv_get_data
/// mv_get_data(AudioID:int, NowSeconds:number, totalSeconds:number, Size:int)->array<number>
var _buf = MusicVisualizer_prepare_buffer(24);
buffer_write(_buf, buffer_s32, argument0);
buffer_write(_buf, buffer_f64, argument1);
buffer_write(_buf, buffer_f64, argument2);
buffer_write(_buf, buffer_s32, argument3);
var __size__ = mv_get_data_raw(buffer_get_address(_buf));
if (__size__ == 0) return undefined;
if (__size__ <= 4) return [];
if (buffer_get_size(_buf) < __size__) buffer_resize(_buf, __size__);
mv_get_data_raw_post(buffer_get_address(_buf));
buffer_seek(_buf, buffer_seek_start, 0);
var _len_0 = buffer_read(_buf, buffer_u32);
var _arr_0 = array_create(_len_0);
for (var _ind_0 = 0; _ind_0 < _len_0; _ind_0++) {
	_arr_0[_ind_0] = buffer_read(_buf, buffer_f64);
}
return _arr_0;

