;;; TO ALTER WIND PLOT SECTION

;; PAULS - Attempt to reduce overcrowding of streamlines
; opts_st@stMinDistanceF    = 0.05
; opts_st@stMinLineSpacingF = 0.005
; opts_st@stMinArrowSpacingF = 0.05
; opts_st@stLineColor = "gray"
; opts_st@stLineColor = "magenta"

; Constrain SfcWind (10m) *only* to 0-26 Kt in 2 Kt steps
if(plot_param .eq. "sfcwind" ) then
	opts_ws@ContourParameters = (/ 2., 24., 2. /);
end if

; Constrain SfcWind0 (2m) *only* to 0-18 Kt in 2 Kt steps
if(plot_param .eq. "sfcwind0" ) then
	opts_ws@ContourParameters = (/ 2., 16., 2. /);
end if


;;; WIND SPEEDS
if( plot_param .eq. "blwind" ) then
    opts_ws@ContourParameters = (/ 1., 26., 1. /)
end if
if( plot_param .eq. "sfcwind" ) then
    opts_ws@ContourParameters = (/ 1., 26., 1. /)
end if
if( plot_param .eq. "bltopwind" ) then
    opts_ws@ContourParameters = (/ 1., 26., 1. /)
end if

