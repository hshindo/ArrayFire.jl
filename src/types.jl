# Automatically generated using Clang.jl wrap_c, version 0.0.0

#using Compat

# Skipping MacroDefinition: AFAPI __attribute__ ( ( visibility ( "default" ) ) )

#const SIZE_T_FRMT_SPECIFIER = "%zu"

# Skipping MacroDefinition: DEPRECATED ( msg ) __attribute__ ( ( deprecated ) )

#const AF_VERSION = "3.2.2"
#const AF_VERSION_MAJOR = 3
#const AF_VERSION_MINOR = 2
#const AF_VERSION_PATCH = 2
#const AF_API_VERSION = AF_API_VERSION_CURRENT
const AF_MAX_DIMS = 4

typealias dim_t Clonglong
typealias intl Clonglong
typealias uintl Culonglong

# begin enum ANONYMOUS_1
typealias ANONYMOUS_1 UInt32
const AF_SUCCESS = (UInt32)(0)
const AF_ERR_NO_MEM = (UInt32)(101)
const AF_ERR_DRIVER = (UInt32)(102)
const AF_ERR_RUNTIME = (UInt32)(103)
const AF_ERR_INVALID_ARRAY = (UInt32)(201)
const AF_ERR_ARG = (UInt32)(202)
const AF_ERR_SIZE = (UInt32)(203)
const AF_ERR_TYPE = (UInt32)(204)
const AF_ERR_DIFF_TYPE = (UInt32)(205)
const AF_ERR_BATCH = (UInt32)(207)
const AF_ERR_NOT_SUPPORTED = (UInt32)(301)
const AF_ERR_NOT_CONFIGURED = (UInt32)(302)
const AF_ERR_NONFREE = (UInt32)(303)
const AF_ERR_NO_DBL = (UInt32)(401)
const AF_ERR_NO_GFX = (UInt32)(402)
const AF_ERR_LOAD_LIB = (UInt32)(501)
const AF_ERR_LOAD_SYM = (UInt32)(502)
const AF_ERR_ARR_BKND_MISMATCH = (UInt32)(503)
const AF_ERR_INTERNAL = (UInt32)(998)
const AF_ERR_UNKNOWN = (UInt32)(999)
# end enum ANONYMOUS_1

# begin enum af_err
typealias af_err UInt32
const AF_SUCCESS = (UInt32)(0)
const AF_ERR_NO_MEM = (UInt32)(101)
const AF_ERR_DRIVER = (UInt32)(102)
const AF_ERR_RUNTIME = (UInt32)(103)
const AF_ERR_INVALID_ARRAY = (UInt32)(201)
const AF_ERR_ARG = (UInt32)(202)
const AF_ERR_SIZE = (UInt32)(203)
const AF_ERR_TYPE = (UInt32)(204)
const AF_ERR_DIFF_TYPE = (UInt32)(205)
const AF_ERR_BATCH = (UInt32)(207)
const AF_ERR_NOT_SUPPORTED = (UInt32)(301)
const AF_ERR_NOT_CONFIGURED = (UInt32)(302)
const AF_ERR_NONFREE = (UInt32)(303)
const AF_ERR_NO_DBL = (UInt32)(401)
const AF_ERR_NO_GFX = (UInt32)(402)
const AF_ERR_LOAD_LIB = (UInt32)(501)
const AF_ERR_LOAD_SYM = (UInt32)(502)
const AF_ERR_ARR_BKND_MISMATCH = (UInt32)(503)
const AF_ERR_INTERNAL = (UInt32)(998)
const AF_ERR_UNKNOWN = (UInt32)(999)
# end enum af_err

# begin enum ANONYMOUS_2
typealias ANONYMOUS_2 UInt32
const f32 = (UInt32)(0)
const c32 = (UInt32)(1)
const f64 = (UInt32)(2)
const c64 = (UInt32)(3)
const b8 = (UInt32)(4)
const s32 = (UInt32)(5)
const u32 = (UInt32)(6)
const u8 = (UInt32)(7)
const s64 = (UInt32)(8)
const u64 = (UInt32)(9)
const s16 = (UInt32)(10)
const u16 = (UInt32)(11)
# end enum ANONYMOUS_2

# begin enum af_dtype
typealias af_dtype UInt32
const f32 = (UInt32)(0)
const c32 = (UInt32)(1)
const f64 = (UInt32)(2)
const c64 = (UInt32)(3)
const b8 = (UInt32)(4)
const s32 = (UInt32)(5)
const u32 = (UInt32)(6)
const u8 = (UInt32)(7)
const s64 = (UInt32)(8)
const u64 = (UInt32)(9)
const s16 = (UInt32)(10)
const u16 = (UInt32)(11)
# end enum af_dtype

# begin enum ANONYMOUS_3
typealias ANONYMOUS_3 UInt32
const afDevice = (UInt32)(0)
const afHost = (UInt32)(1)
# end enum ANONYMOUS_3

# begin enum af_source
typealias af_source UInt32
const afDevice = (UInt32)(0)
const afHost = (UInt32)(1)
# end enum af_source

typealias af_array Ptr{Void}

# begin enum ANONYMOUS_4
typealias ANONYMOUS_4 UInt32
const AF_INTERP_NEAREST = (UInt32)(0)
const AF_INTERP_LINEAR = (UInt32)(1)
const AF_INTERP_BILINEAR = (UInt32)(2)
const AF_INTERP_CUBIC = (UInt32)(3)
const AF_INTERP_LOWER = (UInt32)(4)
# end enum ANONYMOUS_4

# begin enum af_interp_type
typealias af_interp_type UInt32
const AF_INTERP_NEAREST = (UInt32)(0)
const AF_INTERP_LINEAR = (UInt32)(1)
const AF_INTERP_BILINEAR = (UInt32)(2)
const AF_INTERP_CUBIC = (UInt32)(3)
const AF_INTERP_LOWER = (UInt32)(4)
# end enum af_interp_type

# begin enum ANONYMOUS_5
typealias ANONYMOUS_5 UInt32
const AF_PAD_ZERO = (UInt32)(0)
const AF_PAD_SYM = (UInt32)(1)
# end enum ANONYMOUS_5

# begin enum af_border_type
typealias af_border_type UInt32
const AF_PAD_ZERO = (UInt32)(0)
const AF_PAD_SYM = (UInt32)(1)
# end enum af_border_type

# begin enum ANONYMOUS_6
typealias ANONYMOUS_6 UInt32
const AF_CONNECTIVITY_4 = (UInt32)(4)
const AF_CONNECTIVITY_8 = (UInt32)(8)
# end enum ANONYMOUS_6

# begin enum af_connectivity
typealias af_connectivity UInt32
const AF_CONNECTIVITY_4 = (UInt32)(4)
const AF_CONNECTIVITY_8 = (UInt32)(8)
# end enum af_connectivity

# begin enum ANONYMOUS_7
typealias ANONYMOUS_7 UInt32
const AF_CONV_DEFAULT = (UInt32)(0)
const AF_CONV_EXPAND = (UInt32)(1)
# end enum ANONYMOUS_7

# begin enum af_conv_mode
typealias af_conv_mode UInt32
const AF_CONV_DEFAULT = (UInt32)(0)
const AF_CONV_EXPAND = (UInt32)(1)
# end enum af_conv_mode

# begin enum ANONYMOUS_8
typealias ANONYMOUS_8 UInt32
const AF_CONV_AUTO = (UInt32)(0)
const AF_CONV_SPATIAL = (UInt32)(1)
const AF_CONV_FREQ = (UInt32)(2)
# end enum ANONYMOUS_8

# begin enum af_conv_domain
typealias af_conv_domain UInt32
const AF_CONV_AUTO = (UInt32)(0)
const AF_CONV_SPATIAL = (UInt32)(1)
const AF_CONV_FREQ = (UInt32)(2)
# end enum af_conv_domain

# begin enum ANONYMOUS_9
typealias ANONYMOUS_9 UInt32
const AF_SAD = (UInt32)(0)
const AF_ZSAD = (UInt32)(1)
const AF_LSAD = (UInt32)(2)
const AF_SSD = (UInt32)(3)
const AF_ZSSD = (UInt32)(4)
const AF_LSSD = (UInt32)(5)
const AF_NCC = (UInt32)(6)
const AF_ZNCC = (UInt32)(7)
const AF_SHD = (UInt32)(8)
# end enum ANONYMOUS_9

# begin enum af_match_type
typealias af_match_type UInt32
const AF_SAD = (UInt32)(0)
const AF_ZSAD = (UInt32)(1)
const AF_LSAD = (UInt32)(2)
const AF_SSD = (UInt32)(3)
const AF_ZSSD = (UInt32)(4)
const AF_LSSD = (UInt32)(5)
const AF_NCC = (UInt32)(6)
const AF_ZNCC = (UInt32)(7)
const AF_SHD = (UInt32)(8)
# end enum af_match_type

# begin enum ANONYMOUS_10
typealias ANONYMOUS_10 UInt32
const AF_YCC_601 = (UInt32)(601)
const AF_YCC_709 = (UInt32)(709)
const AF_YCC_2020 = (UInt32)(2020)
# end enum ANONYMOUS_10

# begin enum af_ycc_std
typealias af_ycc_std UInt32
const AF_YCC_601 = (UInt32)(601)
const AF_YCC_709 = (UInt32)(709)
const AF_YCC_2020 = (UInt32)(2020)
# end enum af_ycc_std

# begin enum ANONYMOUS_11
typealias ANONYMOUS_11 UInt32
const AF_GRAY = (UInt32)(0)
const AF_RGB = (UInt32)(1)
const AF_HSV = (UInt32)(2)
const AF_YCbCr = (UInt32)(3)
# end enum ANONYMOUS_11

# begin enum af_cspace_t
typealias af_cspace_t UInt32
const AF_GRAY = (UInt32)(0)
const AF_RGB = (UInt32)(1)
const AF_HSV = (UInt32)(2)
const AF_YCbCr = (UInt32)(3)
# end enum af_cspace_t

# begin enum ANONYMOUS_12
typealias ANONYMOUS_12 UInt32
const AF_MAT_NONE = (UInt32)(0)
const AF_MAT_TRANS = (UInt32)(1)
const AF_MAT_CTRANS = (UInt32)(2)
const AF_MAT_CONJ = (UInt32)(4)
const AF_MAT_UPPER = (UInt32)(32)
const AF_MAT_LOWER = (UInt32)(64)
const AF_MAT_DIAG_UNIT = (UInt32)(128)
const AF_MAT_SYM = (UInt32)(512)
const AF_MAT_POSDEF = (UInt32)(1024)
const AF_MAT_ORTHOG = (UInt32)(2048)
const AF_MAT_TRI_DIAG = (UInt32)(4096)
const AF_MAT_BLOCK_DIAG = (UInt32)(8192)
# end enum ANONYMOUS_12

# begin enum af_mat_prop
typealias af_mat_prop UInt32
const AF_MAT_NONE = (UInt32)(0)
const AF_MAT_TRANS = (UInt32)(1)
const AF_MAT_CTRANS = (UInt32)(2)
const AF_MAT_CONJ = (UInt32)(4)
const AF_MAT_UPPER = (UInt32)(32)
const AF_MAT_LOWER = (UInt32)(64)
const AF_MAT_DIAG_UNIT = (UInt32)(128)
const AF_MAT_SYM = (UInt32)(512)
const AF_MAT_POSDEF = (UInt32)(1024)
const AF_MAT_ORTHOG = (UInt32)(2048)
const AF_MAT_TRI_DIAG = (UInt32)(4096)
const AF_MAT_BLOCK_DIAG = (UInt32)(8192)
# end enum af_mat_prop

# begin enum ANONYMOUS_13
typealias ANONYMOUS_13 UInt32
const AF_NORM_VECTOR_1 = (UInt32)(0)
const AF_NORM_VECTOR_INF = (UInt32)(1)
const AF_NORM_VECTOR_2 = (UInt32)(2)
const AF_NORM_VECTOR_P = (UInt32)(3)
const AF_NORM_MATRIX_1 = (UInt32)(4)
const AF_NORM_MATRIX_INF = (UInt32)(5)
const AF_NORM_MATRIX_2 = (UInt32)(6)
const AF_NORM_MATRIX_L_PQ = (UInt32)(7)
const AF_NORM_EUCLID = (UInt32)(2)
# end enum ANONYMOUS_13

# begin enum af_norm_type
typealias af_norm_type UInt32
const AF_NORM_VECTOR_1 = (UInt32)(0)
const AF_NORM_VECTOR_INF = (UInt32)(1)
const AF_NORM_VECTOR_2 = (UInt32)(2)
const AF_NORM_VECTOR_P = (UInt32)(3)
const AF_NORM_MATRIX_1 = (UInt32)(4)
const AF_NORM_MATRIX_INF = (UInt32)(5)
const AF_NORM_MATRIX_2 = (UInt32)(6)
const AF_NORM_MATRIX_L_PQ = (UInt32)(7)
const AF_NORM_EUCLID = (UInt32)(2)
# end enum af_norm_type

# begin enum ANONYMOUS_14
typealias ANONYMOUS_14 UInt32
const AF_COLORMAP_DEFAULT = (UInt32)(0)
const AF_COLORMAP_SPECTRUM = (UInt32)(1)
const AF_COLORMAP_COLORS = (UInt32)(2)
const AF_COLORMAP_RED = (UInt32)(3)
const AF_COLORMAP_MOOD = (UInt32)(4)
const AF_COLORMAP_HEAT = (UInt32)(5)
const AF_COLORMAP_BLUE = (UInt32)(6)
# end enum ANONYMOUS_14

# begin enum af_colormap
typealias af_colormap UInt32
const AF_COLORMAP_DEFAULT = (UInt32)(0)
const AF_COLORMAP_SPECTRUM = (UInt32)(1)
const AF_COLORMAP_COLORS = (UInt32)(2)
const AF_COLORMAP_RED = (UInt32)(3)
const AF_COLORMAP_MOOD = (UInt32)(4)
const AF_COLORMAP_HEAT = (UInt32)(5)
const AF_COLORMAP_BLUE = (UInt32)(6)
# end enum af_colormap

# begin enum ANONYMOUS_15
typealias ANONYMOUS_15 UInt32
const AF_FIF_BMP = (UInt32)(0)
const AF_FIF_ICO = (UInt32)(1)
const AF_FIF_JPEG = (UInt32)(2)
const AF_FIF_JNG = (UInt32)(3)
const AF_FIF_PNG = (UInt32)(13)
const AF_FIF_PPM = (UInt32)(14)
const AF_FIF_PPMRAW = (UInt32)(15)
const AF_FIF_TIFF = (UInt32)(18)
const AF_FIF_PSD = (UInt32)(20)
const AF_FIF_HDR = (UInt32)(26)
const AF_FIF_EXR = (UInt32)(29)
const AF_FIF_JP2 = (UInt32)(31)
const AF_FIF_RAW = (UInt32)(34)
# end enum ANONYMOUS_15

# begin enum af_image_format
typealias af_image_format UInt32
const AF_FIF_BMP = (UInt32)(0)
const AF_FIF_ICO = (UInt32)(1)
const AF_FIF_JPEG = (UInt32)(2)
const AF_FIF_JNG = (UInt32)(3)
const AF_FIF_PNG = (UInt32)(13)
const AF_FIF_PPM = (UInt32)(14)
const AF_FIF_PPMRAW = (UInt32)(15)
const AF_FIF_TIFF = (UInt32)(18)
const AF_FIF_PSD = (UInt32)(20)
const AF_FIF_HDR = (UInt32)(26)
const AF_FIF_EXR = (UInt32)(29)
const AF_FIF_JP2 = (UInt32)(31)
const AF_FIF_RAW = (UInt32)(34)
# end enum af_image_format

# begin enum ANONYMOUS_16
typealias ANONYMOUS_16 UInt32
const AF_HOMOGRAPHY_RANSAC = (UInt32)(0)
const AF_HOMOGRAPHY_LMEDS = (UInt32)(1)
# end enum ANONYMOUS_16

# begin enum af_homography_type
typealias af_homography_type UInt32
const AF_HOMOGRAPHY_RANSAC = (UInt32)(0)
const AF_HOMOGRAPHY_LMEDS = (UInt32)(1)
# end enum af_homography_type

# begin enum ANONYMOUS_17
typealias ANONYMOUS_17 UInt32
const AF_BACKEND_DEFAULT = (UInt32)(0)
const AF_BACKEND_CPU = (UInt32)(1)
const AF_BACKEND_CUDA = (UInt32)(2)
const AF_BACKEND_OPENCL = (UInt32)(4)
# end enum ANONYMOUS_17

# begin enum af_backend
typealias af_backend UInt32
const AF_BACKEND_DEFAULT = (UInt32)(0)
const AF_BACKEND_CPU = (UInt32)(1)
const AF_BACKEND_CUDA = (UInt32)(2)
const AF_BACKEND_OPENCL = (UInt32)(4)
# end enum af_backend

# begin enum ANONYMOUS_18
typealias ANONYMOUS_18 UInt32
const AF_ID = (UInt32)(0)
# end enum ANONYMOUS_18

# begin enum af_someenum_t
typealias af_someenum_t UInt32
const AF_ID = (UInt32)(0)
# end enum af_someenum_t

immutable af_seq
    _begin::Cdouble
    _end::Cdouble
    step::Cdouble
end

immutable af_index_t
    idx::Void
    isSeq::Bool
    isBatch::Bool
end

immutable af_cfloat
    real::Cfloat
    imag::Cfloat
end

immutable af_cdouble
    real::Cdouble
    imag::Cdouble
end

typealias af_features Ptr{Void}
typealias af_window Culonglong

immutable af_cell
    row::Cint
    col::Cint
    title::Ptr{UInt8}
    cmap::af_colormap
end
