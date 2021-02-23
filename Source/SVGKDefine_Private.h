/**
SVGKDefine_Private.h

SVGKDefine define some common macro used for private header.
*/

#ifndef SVGKDefine_Private_h
#define SVGKDefine_Private_h

#import "SVGKDefine.h"
//@import CocoaLumberjack;

// These macro is only used inside framework project, does not expose to public header and effect user's define

typedef NS_OPTIONS(NSUInteger, SP_DDLogFlag){
    /**
     *  0...00000 DDLogFlagError
     */
    SP_DDLogFlagError      = (1 << 0),
    
    /**
     *  0...00001 DDLogFlagWarning
     */
    SP_DDLogFlagWarning    = (1 << 1),
    
    /**
     *  0...00010 DDLogFlagInfo
     */
    SP_DDLogFlagInfo       = (1 << 2),
    
    /**
     *  0...00100 DDLogFlagDebug
     */
    SP_DDLogFlagDebug      = (1 << 3),
    
    /**
     *  0...01000 DDLogFlagVerbose
     */
    SP_DDLogFlagVerbose    = (1 << 4)
};

/**
 * This is the single macro that all other macros below compile into.
 * This big multiline macro makes all the other macros easier to read.
 **/
#define SP_LOG_MACRO(isAsynchronous, lvl, flg, ctx, atag, fnct, frmt, ...) NSLog(@"context = %@,file = %@,line = %@",ctx,__FILE__,__LINE__)
//\
//        [DDLog log : isAsynchronous                                     \
//             level : lvl                                                \
//              flag : flg                                                \
//           context : ctx                                                \
//              file : __FILE__                                           \
//          function : fnct                                               \
//              line : __LINE__                                           \
//               tag : atag                                               \
//            format : (frmt), ## __VA_ARGS__]

/**
 * Define version of the macro that only execute if the log level is above the threshold.
 * The compiled versions essentially look like this:
 *
 * if (logFlagForThisLogMsg & ddLogLevel) { execute log message }
 *
 * When LOG_LEVEL_DEF is defined as ddLogLevel.
 *
 * As shown further below, Lumberjack actually uses a bitmask as opposed to primitive log levels.
 * This allows for a great amount of flexibility and some pretty advanced fine grained logging techniques.
 *
 * Note that when compiler optimizations are enabled (as they are for your release builds),
 * the log messages above your logging threshold will automatically be compiled out.
 *
 * (If the compiler sees LOG_LEVEL_DEF/ddLogLevel declared as a constant, the compiler simply checks to see
 *  if the 'if' statement would execute, and if not it strips it from the binary.)
 *
 * We also define shorthand versions for asynchronous and synchronous logging.
 **/
#define SP_LOG_MAYBE(async, lvl, flg, ctx, tag, fnct, frmt, ...) 
//\
        do { if(lvl & flg) SP_LOG_MACRO(async, lvl, flg, ctx, tag, fnct, frmt, ##__VA_ARGS__); } while(0)

#define SP_LOG_ASYNC_ENABLED YES

#define SP_LOG_ASYNC_ERROR    ( NO && SP_LOG_ASYNC_ENABLED)
#define SP_LOG_ASYNC_WARN     (YES && SP_LOG_ASYNC_ENABLED)
#define SP_LOG_ASYNC_INFO     (YES && SP_LOG_ASYNC_ENABLED)
#define SP_LOG_ASYNC_DEBUG    (YES && SP_LOG_ASYNC_ENABLED)
#define SP_LOG_ASYNC_VERBOSE  (YES && SP_LOG_ASYNC_ENABLED)

#define SVGKIT_LOG_CONTEXT 556

#define SVGKitLogError(frmt, ...)   SP_LOG_MAYBE(NO,                SP_LOG_LEVEL_DEF, SP_DDLogFlagError,   SVGKIT_LOG_CONTEXT, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define SVGKitLogWarn(frmt, ...)    SP_LOG_MAYBE(SP_LOG_ASYNC_ENABLED, SP_LOG_LEVEL_DEF, SP_DDLogFlagWarning, SVGKIT_LOG_CONTEXT, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define SVGKitLogInfo(frmt, ...)    SP_LOG_MAYBE(SP_LOG_ASYNC_ENABLED, SP_LOG_LEVEL_DEF, SP_DDLogFlagInfo,    SVGKIT_LOG_CONTEXT, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define SVGKitLogDebug(frmt, ...)   SP_LOG_MAYBE(SP_LOG_ASYNC_ENABLED, SP_LOG_LEVEL_DEF, SP_DDLogFlagDebug,   SVGKIT_LOG_CONTEXT, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define SVGKitLogVerbose(frmt, ...) SP_LOG_MAYBE(SP_LOG_ASYNC_ENABLED, SP_LOG_LEVEL_DEF, SP_DDLogFlagVerbose, SVGKIT_LOG_CONTEXT, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

#if DEBUG
static const int ddLogLevel = SP_DDLogFlagError | SP_DDLogFlagWarning | SP_DDLogFlagInfo | SP_DDLogFlagDebug;//DDLogLevelVerbose;
#else
static const int ddLogLevel = SP_DDLogFlagError | SP_DDLogFlagWarning;//DDLogLevelWarning;
#endif

#define SP_LOG_LEVEL_DEF ddLogLevel

#if SVGKIT_MAC
#define NSStringFromCGRect(rect) NSStringFromRect(rect)
#define NSStringFromCGSize(size) NSStringFromSize(size)
#define NSStringFromCGPoint(point) NSStringFromPoint(point)
#endif

#endif /* SVGKDefine_Private_h */
