" Vim syntax file
" Language:	Davinci
" Maintainer:	Sean Marshall <seanm@mars.asu.edu>
" From Vim syntax file for Matlab, by Preben 'Peppe' Guldberg <peppe-vim@wielders.org>; original author Mario Eusebio; 30 May 2003
" Last Change:	December 10, 2010

" Note that the functions resample and round are both core and user-defined
"  But core supersedes user-defined, so here they are both listed as core

"" For version 5.x: Clear all syntax items
"" For version 6.x: Quit when a syntax file was already loaded
"if version < 600
"  syntax clear
"elseif exists("b:current_syntax")
"  finish
"endif

syn keyword davinciStatement		define return
"syn keyword davinciLabel		where
syn keyword davinciConditional		else if where
syn keyword davinciRepeat		for while

"syn keyword davinciTodo			contained  TODO

" If you do not want these operators lit, uncommment them and the "hi link" below
syn match davinciArithmeticOperator	"[-+]"
syn match davinciArithmeticOperator	"[*/^%]"
" Originally "\.\=[*/\\^]", but no dot or backslash in Davinci
syn match davinciRelationalOperator	"[=!]="
syn match davinciRelationalOperator	"[<>]=\="
syn match davinciLogicalOperator	"[&|~]"

"syn match davinciLineContinuation	"\.\{3}"

"syn match davinciIdentifier		"\<\a\w*\>"

" String
syn region davinciString			start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=davinciFormat,davinciSpecialCharacter

syn match	davinciFormat		display "%[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([uoxXfeEgGcs]\|\[\^\=.[^]]*\]\)" contained
syn match	davinciFormat		display "%d" contained
" Does not recognize %d otherwise
" Originally: display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([bdiuoxXDOUfeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
"  I removed the ones that don't work in Davinci
syn match	davinciFormat		display "%%" contained
syn match	davinciSpecialCharacter display "\\[\"\\nt]" contained
" Originally: display "\\['\"?\\abefnrtv]" contained (copied from c.vim)
"  I removed the characters which do not need the backslash in Davinci
""L\='\\['\"?\\abefnrtv]'"

" If you don't like tabs
"syn match davinciTab			"\t"

" Standard numbers
syn match davinciNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match davinciFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match davinciFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" System variables/constants with keywords:
syn match davinciNumberKeyword		"\$[0-9]"
syn match davinciNumberKeyword		"\$ARGC"
syn match davinciNumberKeyword		"\$ARGV"
syn match davinciNumberKeyword		"\$EDITOR"
syn match davinciNumberKeyword		"\$DV_VIEWER"
syn match davinciNumberKeyword		"\$GPLOT_CMD"
syn match davinciNumberKeyword		"\$DV_MOD_PATH"
syn match davinciNumberKeyword		"\$DVHELP"
syn match davinciNumberKeyword		"\$DV_AQUA"
syn match davinciNumberKeyword		"\$DV_HOME"
syn match davinciNumberKeyword		"\$DV_LIB"
syn match davinciNumberKeyword		"\$DV_SCRIPT_FILES"
syn match davinciNumberKeyword		"\$DV_EX"
syn match davinciNumberKeyword		"\$DV_BROWSER"
syn match davinciNumberKeyword		"\$DV_KRC"
syn match davinciNumberKeyword		"\$TMPDIR"
"syn match davinciNumberKeyword		"SCALE"
"syn match davinciNumberKeyword		"VERBOSE"

" More constants (perhaps not truly constants, since their value can easily be
"  changed by the user, but they are supposed to be constant)
syn keyword davinciConstant		SCALE VERBOSE
syn keyword davinciConstant		con eps eps2 ignore intmax null pi un
syn keyword davinciConstant		Sun Earth Moon Mars Phobos Deimos
syn keyword davinciConstant		months weekdays TAI_UTC timezone

" Transpose character and delimiters: Either use just [...] or (...) as well
syn match davinciDelimiter		"[][]"
"syn match davinciDelimiter		"[][()]"
"syn match davinciTransposeOperator	"[])a-zA-Z0-9.]'"lc=1

"syn match davinciSemicolon		";"

syn match davinciComment		"#.*$"	contains=davinciTodo,davinciTab
" Originally "%.*$"	contains=davinciTodo,davinciTab

" NOTE: This list of functions was generated on December 2, 2010, using the core
"  function ls to get lists of functions in the Moeur Building library.

" Core/system functions
" To get current list, do ls(sfunc=1) in Davinci, and save the output to a text file
"syn keyword davinciOperator		break zeros default margin round ones rand
"syn keyword davinciOperator		ceil floor size clear zeros eye mean std cov
syn keyword davinciOperator		abs acos acosd add_struct ascii asin asind
syn keyword davinciOperator		atan atan2 atand atod atof atoi audit avg
syn keyword davinciOperator		basename basis bbr bil bindct binidct bip
syn keyword davinciOperator		boxfilter bsq btemp byte
syn keyword davinciOperator		cat ccount ceil char chdir cinterp clone
syn keyword davinciOperator		cluster contour convolve
syn match davinciOperator		"contains"
" Have to be careful with the core function 'contains', since that word is reserved in VIM syntax definition files
syn keyword davinciOperator		convolve2 convolve3 copy coreg coreg2 corr
syn keyword davinciOperator		cos cosd covar create
syn keyword davinciOperator		dct delete deleted delim dim dirname
syn keyword davinciOperator		display distance_map double drawshape dump
syn keyword davinciOperator		echo edit eigen entropy equals eval exit
syn keyword davinciOperator		exp export extract
syn keyword davinciOperator		fexists fft filetype fit float flood_fill
syn keyword davinciOperator		floor fncc fncc_cmplx_mul
syn keyword davinciOperator		fncc_fft_conv_real fncc_fft2d fncc_ifft2d
syn keyword davinciOperator		fncc_write_mat fork format fprintf fremove
syn keyword davinciOperator		fsize
syn keyword davinciOperator		gconvolve geom_ghost get_struct
syn keyword davinciOperator		get_struct_key global gnoise gplot
syn keyword davinciOperator		grassfile grep
syn keyword davinciOperator		h hasvalue HasValue header histogram
syn keyword davinciOperator		history hstats hstretch hsv2rgb
syn keyword davinciOperator		identity ifft ifill image_resize
syn keyword davinciOperator		insert_struct insmod int interp interp2d
syn keyword davinciOperator		ipi irfft irfft2 irfft3 isis issubstring
syn keyword davinciOperator		jfjll kfill killall
syn keyword davinciOperator		length list list_modules ln load load_bin5
syn keyword davinciOperator		load_fits load_frame load_ir load_module
syn keyword davinciOperator		load_paci load_PDS load_pds load_raw
syn keyword davinciOperator		load_specpr load_tdb load_vanilla
syn keyword davinciOperator		load_vis local_max log log10 ls lsmod
syn keyword davinciOperator		ludcomp
syn keyword davinciOperator		max maxchan maxpos min minchan minpos
syn keyword davinciOperator		minvert moment moments mxm my_round
syn keyword davinciOperator		nop order org
syn keyword davinciOperator		pause pcs plot pnmcrop pnmcut pow printf
syn keyword davinciOperator		putenv radial_symmetry radial_symmetry2
syn keyword davinciOperator		radial_symmetry3 ramp rand random read
syn keyword davinciOperator		read_ascii read_lines read_text
syn keyword davinciOperator		remove_struct resample resize rfft rfft2
syn keyword davinciOperator		rfft3 rgb rgb2hsv rice rmmod rnoise rotate
syn keyword davinciOperator		round rtrim
syn keyword davinciOperator		save save_pds sawtooth scp self_convolve
syn keyword davinciOperator		set_deleted shade shade2 shell short sin
syn keyword davinciOperator		sind slant sort source splot sprintf sqrt
syn keyword davinciOperator		sstretch stddev string strlen strstr
syn keyword davinciOperator		strsub struct sum syscall system
syn keyword davinciOperator		tan tand text translate type
syn keyword davinciOperator		unique unload_module unrice unslant
syn keyword davinciOperator		unslant_shear
syn keyword davinciOperator		valpos version vignette vis_downshift
syn keyword davinciOperator		vis_upshift vplot warp window write
syn keyword davinciOperator		write_fits write_isis write_pds xplot


" User-defined functions
" To get current list, do ls(ufunc=1) in Davinci, and save the output to a text file
" Originally error eval function
syn keyword davinciFunction		_max _min
syn keyword davinciFunction		add_grid angsepd arc atrem autoradcorr
syn keyword davinciFunction		available_maps
syn keyword davinciFunction		batch_extract_fs batch_plot_fs bb_vm
syn keyword davinciFunction		bbr_fs bbrw binbyte binomcdf binompmf
syn keyword davinciFunction		blend blendx bounding_box bounding_box2
syn keyword davinciFunction		btemp_fs btemp_vm
syn keyword davinciFunction		calc_rad_fs calc_rad_raw_fs cart2sph cbrt
syn keyword davinciFunction		checkdate checktime cleandcs clip
syn match davinciFunction		"clock"
syn keyword davinciFunction		cm2micron co2_new coef colorize commonx
syn keyword davinciFunction		conhelp convertfs2dav convolve_themis
syn keyword davinciFunction		cosh cot create_indices create_indices_key
syn keyword davinciFunction		crism_atm crism_destripe crism_destripe_old
syn keyword davinciFunction		crism_resample crism_speclib cross csc
syn keyword davinciFunction		ctof ctok
syn keyword davinciFunction		date2str dcs dd2dms deconstruct deddi
syn keyword davinciFunction		degrade degrade_ir dehyd2
syn keyword davinciFunction		delete_object_vars DeltaT destreak destripe
syn keyword davinciFunction		det dewobble3 diag dispa displayp dispp
syn keyword davinciFunction		do_coreg do_coreg2 do_dcs do_hsv
syn keyword davinciFunction		do_isis_geometry do_isis_geometry_nadir
syn keyword davinciFunction		do_rdcs do_rgb dot dots
syn keyword davinciFunction		earthtime eigen2 emcal emiss_fs erf ET_UTC
syn keyword davinciFunction		ET_UTCM ET2JD ET2MJD ET2ORB expand
syn keyword davinciFunction		expand_ir extract_text_fs
syn keyword davinciFunction		fact factor fake_rdr fib filterx filtery
syn keyword davinciFunction		filterz find_band fix fix_missing fs_help
syn keyword davinciFunction		fs_software ftoc ftok
syn keyword davinciFunction		gamma gaussian geo_trans get_color
syn keyword davinciFunction		get_crism get_crism_list get_crism_old
syn keyword davinciFunction		get_image get_map get_proj_info getbrowser
syn keyword davinciFunction		getopt getos gvplot
syn keyword davinciFunction		hpf hyp
syn keyword davinciFunction		i2i i2i_tutorial idinfo install_check
syn keyword davinciFunction		intprod inverf invnorm isint isis3setup
syn keyword davinciFunction		isnum isscalar
syn keyword davinciFunction		JD JD2date JD2Dt JD2ET jd2lsubs JD2MJD
syn keyword davinciFunction		JD2TT JDlist
syn keyword davinciFunction		k_fill k_phil key krc_bin krc_one
syn keyword davinciFunction		krc_themis ktoc ktof
syn keyword davinciFunction		label labelxy leftline leg level_adjust
syn keyword davinciFunction		library library_version line_match
syn keyword davinciFunction		line_match2 lines linespoints linfit ln_fit
syn keyword davinciFunction		load_aster load_coreg load_krc log2 logb
syn keyword davinciFunction		lon2tzo lpf lsq lsqnn lsqsn lstretch lsubs
syn keyword davinciFunction		mag make_band make_lab1x make_mtesx
syn keyword davinciFunction		make_temp_rad make_tesx make_themisx
syn keyword davinciFunction		make_xaxis_fs map_trans mars_bin marstime
syn keyword davinciFunction		marstimeglobal marstimelocal med
syn keyword davinciFunction		mission_time_plot MJD MJD2date MJD2Dt
syn keyword davinciFunction		MJD2ET MJD2JD MJD2TT MJD2unix MJDlist
syn keyword davinciFunction		mola_overlay mos_bounds multiplot
syn keyword davinciFunction		nCk night_deplaid nokey nomultiplot
syn keyword davinciFunction		norm_spec normalize normcdf normpdf nPk
syn keyword davinciFunction		nstretch nullim numint
syn keyword davinciFunction		offset_plot opt_usage ORB2ET outline
syn keyword davinciFunction		overlay
syn keyword davinciFunction		p_surf pc2pg pca pca2 pca2_recon pdfplot
syn keyword davinciFunction		pg2pc plim plot_functions plot_loop
syn keyword davinciFunction		plot_metas plot_sma plot_sma_tutorial
syn keyword davinciFunction		pngplot points pplot pplot_examples
syn keyword davinciFunction		pplot_tutorial process_bin52 process_crism
syn keyword davinciFunction		product project_crism project_crism_index
syn keyword davinciFunction		prplot psplot pt
syn keyword davinciFunction		r2t_hi r2t_lo rad_corr2 rad2tb2 rad3tb
syn keyword davinciFunction		radcalc rboxfilter rdcs read_meta read_vm
syn keyword davinciFunction		refit_sma reform_speclib rematm2 replot
syn keyword davinciFunction		respf_fs restore_session
syn keyword davinciFunction		reverse_spectrum rightline rm_arrow
syn keyword davinciFunction		rm_quote rmlabel rmnoise_pca
syn keyword davinciFunction		rrmnoise_pca rsstretch rsstretch_bf rtilt
syn keyword davinciFunction		s2dhms scale_bar scale_bar_text scalebar
syn keyword davinciFunction		sec shift show_arrow showlabel sign sinc
syn keyword davinciFunction		sinh sma solsys sort_cube sph2cart
syn keyword davinciFunction		split_ock sstretch_old stack_plot str2date
syn keyword davinciFunction		stretch strsplit sum_group_conc summary_sma
syn keyword davinciFunction		summary_sma_group sunclock surfcalc
syn keyword davinciFunction		tanh TB_TT tb2rad tb2rad2 tdb2struct
syn keyword davinciFunction		temp2dn themis_plot themis_to_isis3
syn keyword davinciFunction		themis3db themisx thmproc_find time2str
syn keyword davinciFunction		tmodel triplot tzo2str
syn keyword davinciFunction		uddw uniq unithelp unix2MJD
syn keyword davinciFunction		v_add v_border v_clip v_contains v_create
syn keyword davinciFunction		v_cut v_insert v_intersect v_make v_paste
syn keyword davinciFunction		v_union vert_line
syn keyword davinciFunction		weight_array wiki write_vm
syn keyword davinciFunction		xramp xt2 xt2d

"syn keyword davinciImplicit		abs acos atan asin cos cosh exp log prod sum
"syn keyword davinciImplicit		log10 max min sign sin sqrt tan reshape

syn match davinciError	"-\=\<\d\+\.\d\+\.[^*/\\^]"
syn match davinciError	"-\=\<\d\+\.\d\+[eEdD][-+]\=\d\+\.\([^*/\\^]\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_davinci_syntax_inits")
  if version < 508
    let did_davinci_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink davinciFormat			davinciSpecial
  HiLink davinciSpecialCharacter	davinciSpecial
  HiLink davinciOperator		Operator
  HiLink davinciTransposeOperator	davinciOperator
  HiLink davinciLineContinuation	Special
  HiLink davinciLabel			Label
  HiLink davinciConditional		Conditional
  HiLink davinciRepeat			Repeat
  HiLink davinciTodo			Todo
  HiLink davinciString			String
  HiLink davinciDelimiter		Identifier
  HiLink davinciTransposeOther		Identifier
  HiLink davinciConstant		constant
  HiLink davinciNumberKeyword		constant
  HiLink davinciNumber			Number
  HiLink davinciFloat			Float
  HiLink davinciFunction		Function
  HiLink davinciError			Error
  HiLink davinciStatement		Statement
  HiLink davinciImplicit		davinciStatement
"  HiLink davinciSemicolon		SpecialChar
  HiLink davinciSpecial			SpecialChar
  HiLink davinciComment			Comment

  HiLink davinciArithmeticOperator	davinciOperator
  HiLink davinciRelationalOperator	davinciOperator
  HiLink davinciLogicalOperator		davinciOperator

"optional highlighting
  "HiLink davinciIdentifier		Identifier
  "HiLink davinciTab			Error

  delcommand HiLink
endif

let b:current_syntax = "davinci"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0

