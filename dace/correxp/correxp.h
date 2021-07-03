//
// MATLAB Compiler: 6.5 (R2017b)
// Date: Mon Feb  3 20:57:35 2020
// Arguments: "-B""macro_default""-W""cpplib:correxp""-T""link:lib""correxp.m"
//

#ifndef __correxp_h
#define __correxp_h 1

#if defined(__cplusplus) && !defined(mclmcrrt_h) && defined(__linux__)
#  pragma implementation "mclmcrrt.h"
#endif
#include "mclmcrrt.h"
#include "mclcppclass.h"
#ifdef __cplusplus
extern "C" {
#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_correxp_C_API 
#define LIB_correxp_C_API /* No special import/export declaration */
#endif

/* GENERAL LIBRARY FUNCTIONS -- START */

extern LIB_correxp_C_API 
bool MW_CALL_CONV correxpInitializeWithHandlers(
       mclOutputHandlerFcn error_handler, 
       mclOutputHandlerFcn print_handler);

extern LIB_correxp_C_API 
bool MW_CALL_CONV correxpInitialize(void);

extern LIB_correxp_C_API 
void MW_CALL_CONV correxpTerminate(void);

extern LIB_correxp_C_API 
void MW_CALL_CONV correxpPrintStackTrace(void);

/* GENERAL LIBRARY FUNCTIONS -- END */

/* C INTERFACE -- MLX WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- START */

extern LIB_correxp_C_API 
bool MW_CALL_CONV mlxCorrexp(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[]);

/* C INTERFACE -- MLX WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- END */

#ifdef __cplusplus
}
#endif


/* C++ INTERFACE -- WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- START */

#ifdef __cplusplus

/* On Windows, use __declspec to control the exported API */
#if defined(_MSC_VER) || defined(__MINGW64__)

#ifdef EXPORTING_correxp
#define PUBLIC_correxp_CPP_API __declspec(dllexport)
#else
#define PUBLIC_correxp_CPP_API __declspec(dllimport)
#endif

#define LIB_correxp_CPP_API PUBLIC_correxp_CPP_API

#else

#if !defined(LIB_correxp_CPP_API)
#if defined(LIB_correxp_C_API)
#define LIB_correxp_CPP_API LIB_correxp_C_API
#else
#define LIB_correxp_CPP_API /* empty! */ 
#endif
#endif

#endif

extern LIB_correxp_CPP_API void MW_CALL_CONV correxp(int nargout, mwArray& r, mwArray& dr, const mwArray& theta, const mwArray& d);

/* C++ INTERFACE -- WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- END */
#endif

#endif
