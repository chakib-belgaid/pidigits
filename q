java(1)                                                                             Basic Tools                                                                             java(1)

NNAAMMEE
       java - Launches a Java application.

SSYYNNOOPPSSIISS
           jjaavvaa [_o_p_t_i_o_n_s] _c_l_a_s_s_n_a_m_e [_a_r_g_s]

           jjaavvaa [_o_p_t_i_o_n_s] --jjaarr _f_i_l_e_n_a_m_e [_a_r_g_s]

       _o_p_t_i_o_n_s
           Command-line options separated by spaces. See Options.

       _c_l_a_s_s_n_a_m_e
           The name of the class to be launched.

       _f_i_l_e_n_a_m_e
           The name of the Java Archive (JAR) file to be called. Used only with the --jjaarr option.

       _a_r_g_s
           The arguments passed to the mmaaiinn(()) method separated by spaces.

DDEESSCCRRIIPPTTIIOONN
       The jjaavvaa command starts a Java application. It does this by starting the Java Runtime Environment (JRE), loading the specified class, and calling that class's mmaaiinn(())
       method. The method must be declared _p_u_b_l_i_c and _s_t_a_t_i_c, it must not return any value, and it must accept a SSttrriinngg array as a parameter. The method declaration has the
       following form:

           ppuubblliicc ssttaattiicc vvooiidd mmaaiinn((SSttrriinngg[[]] aarrggss))

       The jjaavvaa command can be used to launch a JavaFX application by loading a class that either has a mmaaiinn(()) method or that extends jjaavvaaffxx..aapppplliiccaattiioonn..AApppplliiccaattiioonn. In the latter
       case, the launcher constructs an instance of the AApppplliiccaattiioonn class, calls its iinniitt(()) method, and then calls the ssttaarrtt((jjaavvaaffxx..ssttaaggee..SSttaaggee)) method.

       By default, the first argument that is not an option of the jjaavvaa command is the fully qualified name of the class to be called. If the --jjaarr option is specified, its
       argument is the name of the JAR file containing class and resource files for the application. The startup class must be indicated by the MMaaiinn--CCllaassss manifest header in its
       source code.

       The JRE searches for the startup class (and other classes used by the application) in three sets of locations: the bootstrap class path, the installed extensions, and the
       user’s class path.

       Arguments after the class file name or the JAR file name are passed to the mmaaiinn(()) method.

OOPPTTIIOONNSS
       The jjaavvaa command supports a wide range of options that can be divided into the following categories:

       ·   Standard Options

       ·   Non-Standard Options

       ·   Advanced Runtime Options

       ·   Advanced JIT Compiler Options

       ·   Advanced Serviceability Options

       ·   Advanced Garbage Collection Options

       Standard options are guaranteed to be supported by all implementations of the Java Virtual Machine (JVM). They are used for common actions, such as checking the version of
       the JRE, setting the class path, enabling verbose output, and so on.

       Non-standard options are general purpose options that are specific to the Java HotSpot Virtual Machine, so they are not guaranteed to be supported by all JVM
       implementations, and are subject to change. These options start with --XX.

       Advanced options are not recommended for casual use. These are developer options used for tuning specific areas of the Java HotSpot Virtual Machine operation that often
       have specific system requirements and may require privileged access to system configuration parameters. They are also not guaranteed to be supported by all JVM
       implementations, and are subject to change. Advanced options start with --XXXX.

       To keep track of the options that were deprecated or removed in the latest release, there is a section named Deprecated and Removed Options at the end of the document.

       Boolean options are used to either enable a feature that is disabled by default or disable a feature that is enabled by default. Such options do not require a parameter.
       Boolean --XXXX options are enabled using the plus sign (--XXXX::++_O_p_t_i_o_n_N_a_m_e) and disabled using the minus sign (--XXXX::--_O_p_t_i_o_n_N_a_m_e).

       For options that require an argument, the argument may be separated from the option name by a space, a colon (:), or an equal sign (=), or the argument may directly follow
       the option (the exact syntax differs for each option). If you are expected to specify the size in bytes, you can use no suffix, or use the suffix kk or KK for kilobytes (KB),
       mm or MM for megabytes (MB), gg or GG for gigabytes (GB). For example, to set the size to 8 GB, you can specify either 88gg, 88119922mm, 88338888660088kk, or 88558899993344559922 as the argument. If
       you are expected to specify the percentage, use a number from 0 to 1 (for example, specify 00..2255 for 25%).

   SSttaannddaarrdd OOppttiioonnss
       These are the most commonly used options that are supported by all implementations of the JVM.

       -agentlib:_l_i_b_n_a_m_e[=_o_p_t_i_o_n_s]
           Loads the specified native agent library. After the library name, a comma-separated list of options specific to the library can be used.

           If the option --aaggeennttlliibb::ffoooo is specified, then the JVM attempts to load the library named lliibbffoooo..ssoo in the location specified by the LLDD__LLIIBBRRAARRYY__PPAATTHH system variable (on
           OS X this variable is DDYYLLDD__LLIIBBRRAARRYY__PPAATTHH).

           The following example shows how to load the heap profiling tool (HPROF) library and get sample CPU information every 20 ms, with a stack depth of 3:

               --aaggeennttlliibb::hhpprrooff==ccppuu==ssaammpplleess,,iinntteerrvvaall==2200,,ddeepptthh==33

           The following example shows how to load the Java Debug Wire Protocol (JDWP) library and listen for the socket connection on port 8000, suspending the JVM before the
           main class loads:

               --aaggeennttlliibb::jjddwwpp==ttrraannssppoorrtt==ddtt__ssoocckkeett,,sseerrvveerr==yy,,aaddddrreessss==88000000

           For more information about the native agent libraries, refer to the following:

           ·   The jjaavvaa..llaanngg..iinnssttrruummeenntt package description at http://docs.oracle.com/javase/8/docs/api/java/lang/instrument/package-summary.html

           ·   Agent Command Line Options in the JVM Tools Interface guide at http://docs.oracle.com/javase/8/docs/platform/jvmti/jvmti.html#starting

       -agentpath:_p_a_t_h_n_a_m_e[=_o_p_t_i_o_n_s]
           Loads the native agent library specified by the absolute path name. This option is equivalent to --aaggeennttlliibb but uses the full path and file name of the library.

       -client
           Selects the Java HotSpot Client VM. The 64-bit version of the Java SE Development Kit (JDK) currently ignores this option and instead uses the Server JVM.

           For default JVM selection, see Server-Class Machine Detection at http://docs.oracle.com/javase/8/docs/technotes/guides/vm/server-class.html

       -D_p_r_o_p_e_r_t_y=_v_a_l_u_e
           Sets a system property value. The _p_r_o_p_e_r_t_y variable is a string with no spaces that represents the name of the property. The _v_a_l_u_e variable is a string that represents
           the value of the property. If _v_a_l_u_e is a string with spaces, then enclose it in quotation marks (for example --DDffoooo==""ffoooo bbaarr"").

       -d32
           Runs the application in a 32-bit environment. If a 32-bit environment is not installed or is not supported, then an error will be reported. By default, the application
           is run in a 32-bit environment unless a 64-bit system is used.

       -d64
           Runs the application in a 64-bit environment. If a 64-bit environment is not installed or is not supported, then an error will be reported. By default, the application
           is run in a 32-bit environment unless a 64-bit system is used.

           Currently only the Java HotSpot Server VM supports 64-bit operation, and the --sseerrvveerr option is implicit with the use of --dd6644. The --cclliieenntt option is ignored with the use
           of --dd6644. This is subject to change in a future release.

       -disableassertions[:[_p_a_c_k_a_g_e_n_a_m_e]...|:_c_l_a_s_s_n_a_m_e]
       -da[:[_p_a_c_k_a_g_e_n_a_m_e]...|:_c_l_a_s_s_n_a_m_e]
           Disables assertions. By default, assertions are disabled in all packages and classes.

           With no arguments, --ddiissaabblleeaasssseerrttiioonnss (--ddaa) disables assertions in all packages and classes. With the _p_a_c_k_a_g_e_n_a_m_e argument ending in ......, the switch disables assertions
           in the specified package and any subpackages. If the argument is simply ......, then the switch disables assertions in the unnamed package in the current working
           directory. With the _c_l_a_s_s_n_a_m_e argument, the switch disables assertions in the specified class.

           The --ddiissaabblleeaasssseerrttiioonnss (--ddaa) option applies to all class loaders and to system classes (which do not have a class loader). There is one exception to this rule: if the
           option is provided with no arguments, then it does not apply to system classes. This makes it easy to disable assertions in all classes except for system classes. The
           --ddiissaabblleessyysstteemmaasssseerrttiioonnss option enables you to disable assertions in all system classes.

           To explicitly enable assertions in specific packages or classes, use the --eennaabblleeaasssseerrttiioonnss (--eeaa) option. Both options can be used at the same time. For example, to run
           the MMyyCCllaassss application with assertions enabled in package ccoomm..wwoommbbaatt..ffrruuiittbbaatt (and any subpackages) but disabled in class ccoomm..wwoommbbaatt..ffrruuiittbbaatt..BBrriicckkbbaatt, use the
           following command:

               jjaavvaa --eeaa::ccoomm..wwoommbbaatt..ffrruuiittbbaatt...... --ddaa::ccoomm..wwoommbbaatt..ffrruuiittbbaatt..BBrriicckkbbaatt MMyyCCllaassss

       -disablesystemassertions
       -dsa
           Disables assertions in all system classes.

       -enableassertions[:[_p_a_c_k_a_g_e_n_a_m_e]...|:_c_l_a_s_s_n_a_m_e]
       -ea[:[_p_a_c_k_a_g_e_n_a_m_e]...|:_c_l_a_s_s_n_a_m_e]
           Enables assertions. By default, assertions are disabled in all packages and classes.

           With no arguments, --eennaabblleeaasssseerrttiioonnss (--eeaa) enables assertions in all packages and classes. With the _p_a_c_k_a_g_e_n_a_m_e argument ending in ......, the switch enables assertions in
           the specified package and any subpackages. If the argument is simply ......, then the switch enables assertions in the unnamed package in the current working directory.
           With the _c_l_a_s_s_n_a_m_e argument, the switch enables assertions in the specified class.

           The --eennaabblleeaasssseerrttiioonnss (--eeaa) option applies to all class loaders and to system classes (which do not have a class loader). There is one exception to this rule: if the
           option is provided with no arguments, then it does not apply to system classes. This makes it easy to enable assertions in all classes except for system classes. The
           --eennaabblleessyysstteemmaasssseerrttiioonnss option provides a separate switch to enable assertions in all system classes.

           To explicitly disable assertions in specific packages or classes, use the --ddiissaabblleeaasssseerrttiioonnss (--ddaa) option. If a single command contains multiple instances of these
           switches, then they are processed in order before loading any classes. For example, to run the MMyyCCllaassss application with assertions enabled only in package
           ccoomm..wwoommbbaatt..ffrruuiittbbaatt (and any subpackages) but disabled in class ccoomm..wwoommbbaatt..ffrruuiittbbaatt..BBrriicckkbbaatt, use the following command:

               jjaavvaa --eeaa::ccoomm..wwoommbbaatt..ffrruuiittbbaatt...... --ddaa::ccoomm..wwoommbbaatt..ffrruuiittbbaatt..BBrriicckkbbaatt MMyyCCllaassss

       -enablesystemassertions
       -esa
           Enables assertions in all system classes.

       -help
       -?
           Displays usage information for the jjaavvaa command without actually running the JVM.

       -jar _f_i_l_e_n_a_m_e
           Executes a program encapsulated in a JAR file. The _f_i_l_e_n_a_m_e argument is the name of a JAR file with a manifest that contains a line in the form MMaaiinn--CCllaassss::_c_l_a_s_s_n_a_m_e
           that defines the class with the ppuubblliicc ssttaattiicc vvooiidd mmaaiinn((SSttrriinngg[[]] aarrggss)) method that serves as your application's starting point.

           When you use the --jjaarr option, the specified JAR file is the source of all user classes, and other class path settings are ignored.

           For more information about JAR files, see the following resources:

           ·   jar(1)

           ·   The Java Archive (JAR) Files guide at http://docs.oracle.com/javase/8/docs/technotes/guides/jar/index.html

           ·   Lesson: Packaging Programs in JAR Files at

               http://docs.oracle.com/javase/tutorial/deployment/jar/index.html

       -javaagent:_j_a_r_p_a_t_h[=_o_p_t_i_o_n_s]
           Loads the specified Java programming language agent. For more information about instrumenting Java applications, see the jjaavvaa..llaanngg..iinnssttrruummeenntt package description in the
           Java API documentation at http://docs.oracle.com/javase/8/docs/api/java/lang/instrument/package-summary.html

       -jre-restrict-search
           Includes user-private JREs in the version search.

       -no-jre-restrict-search
           Excludes user-private JREs from the version search.

       -server
           Selects the Java HotSpot Server VM. The 64-bit version of the JDK supports only the Server VM, so in that case the option is implicit.

           For default JVM selection, see Server-Class Machine Detection at http://docs.oracle.com/javase/8/docs/technotes/guides/vm/server-class.html

       -showversion
           Displays version information and continues execution of the application. This option is equivalent to the --vveerrssiioonn option except that the latter instructs the JVM to
           exit after displaying version information.

       -splash:_i_m_g_n_a_m_e
           Shows the splash screen with the image specified by _i_m_g_n_a_m_e. For example, to show the ssppllaasshh..ggiiff file from the iimmaaggeess directory when starting your application, use the
           following option:

               --ssppllaasshh::iimmaaggeess//ssppllaasshh..ggiiff

       -verbose:class
           Displays information about each loaded class.

       -verbose:gc
           Displays information about each garbage collection (GC) event.

       -verbose:jni
           Displays information about the use of native methods and other Java Native Interface (JNI) activity.

       -version
           Displays version information and then exits. This option is equivalent to the --sshhoowwvveerrssiioonn option except that the latter does not instruct the JVM to exit after
           displaying version information.

       -version:_r_e_l_e_a_s_e
           Specifies the release version to be used for running the application. If the version of the jjaavvaa command called does not meet this specification and an appropriate
           implementation is found on the system, then the appropriate implementation will be used.

           The _r_e_l_e_a_s_e argument specifies either the exact version string, or a list of version strings and ranges separated by spaces. A _v_e_r_s_i_o_n _s_t_r_i_n_g is the developer
           designation of the version number in the following form: 11.._x..00___u (where _x is the major version number, and _u is the update version number). A _v_e_r_s_i_o_n _r_a_n_g_e is made up
           of a version string followed by a plus sign (++) to designate this version or later, or a part of a version string followed by an asterisk (**) to designate any version
           string with a matching prefix. Version strings and ranges can be combined using a space for a logical _O_R combination, or an ampersand (&&) for a logical _A_N_D combination
           of two version strings/ranges. For example, if running the class or JAR file requires either JRE 6u13 (1.6.0_13), or any JRE 6 starting from 6u10 (1.6.0_10), specify
           the following:

               --vveerrssiioonn::""11..66..00__1133 11..66** && 11..66..00__1100++""

           Quotation marks are necessary only if there are spaces in the _r_e_l_e_a_s_e parameter.

           For JAR files, the preference is to specify version requirements in the JAR file manifest rather than on the command line.

   NNoonn--SSttaannddaarrdd OOppttiioonnss
       These options are general purpose options that are specific to the Java HotSpot Virtual Machine.

       -X
           Displays help for all available --XX options.

       -Xbatch
           Disables background compilation. By default, the JVM compiles the method as a background task, running the method in interpreter mode until the background compilation
           is finished. The --XXbbaattcchh flag disables background compilation so that compilation of all methods proceeds as a foreground task until completed.

           This option is equivalent to --XXXX::--BBaacckkggrroouunnddCCoommppiillaattiioonn.

       -Xbootclasspath:_p_a_t_h
           Specifies a list of directories, JAR files, and ZIP archives separated by colons (:) to search for boot class files. These are used in place of the boot class files
           included in the JDK.

           Do not deploy applications that use this option to override a class in rrtt..jjaarr, because this violates the JRE binary code license.

       -Xbootclasspath/a:_p_a_t_h
           Specifies a list of directories, JAR files, and ZIP archives separated by colons (:) to append to the end of the default bootstrap class path.

           Do not deploy applications that use this option to override a class in rrtt..jjaarr, because this violates the JRE binary code license.

       -Xbootclasspath/p:_p_a_t_h
           Specifies a list of directories, JAR files, and ZIP archives separated by colons (:) to prepend to the front of the default bootstrap class path.

           Do not deploy applications that use this option to override a class in rrtt..jjaarr, because this violates the JRE binary code license.

       -Xcheck:jni
           Performs additional checks for Java Native Interface (JNI) functions. Specifically, it validates the parameters passed to the JNI function and the runtime environment
           data before processing the JNI request. Any invalid data encountered indicates a problem in the native code, and the JVM will terminate with an irrecoverable error in
           such cases. Expect a performance degradation when this option is used.

       -Xcomp
           Forces compilation of methods on first invocation. By default, the Client VM (--cclliieenntt) performs 1,000 interpreted method invocations and the Server VM (--sseerrvveerr)
           performs 10,000 interpreted method invocations to gather information for efficient compilation. Specifying the --XXccoommpp option disables interpreted method invocations to
           increase compilation performance at the expense of efficiency.

           You can also change the number of interpreted method invocations before compilation using the --XXXX::CCoommppiilleeTThhrreesshhoolldd option.

       -Xdebug
           Does nothing. Provided for backward compatibility.

       -Xdiag
           Shows additional diagnostic messages.

       -Xfuture
           Enables strict class-file format checks that enforce close conformance to the class-file format specification. Developers are encouraged to use this flag when
           developing new code because the stricter checks will become the default in future releases.

       -Xint
           Runs the application in interpreted-only mode. Compilation to native code is disabled, and all bytecode is executed by the interpreter. The performance benefits offered
           by the just in time (JIT) compiler are not present in this mode.

       -Xinternalversion
           Displays more detailed JVM version information than the --vveerrssiioonn option, and then exits.

       -Xloggc:_f_i_l_e_n_a_m_e
           Sets the file to which verbose GC events information should be redirected for logging. The information written to this file is similar to the output of --vveerrbboossee::ggcc with
           the time elapsed since the first GC event preceding each logged event. The --XXllooggggcc option overrides --vveerrbboossee::ggcc if both are given with the same jjaavvaa command.

           Example:

               --XXllooggggcc::ggaarrbbaaggee--ccoolllleeccttiioonn..lloogg

       -Xmaxjitcodesize=_s_i_z_e
           Specifies the maximum code cache size (in bytes) for JIT-compiled code. Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate
           gigabytes. The default maximum code cache size is 240 MB; if you disable tiered compilation with the option --XXXX::--TTiieerreeddCCoommppiillaattiioonn, then the default size is 48 MB:

               --XXmmaaxxjjiittccooddeessiizzee==224400mm

           This option is equivalent to --XXXX::RReesseerrvveeddCCooddeeCCaacchheeSSiizzee.

       -Xmixed
           Executes all bytecode by the interpreter except for hot methods, which are compiled to native code.

       -Xmn_s_i_z_e
           Sets the initial and maximum size (in bytes) of the heap for the young generation (nursery). Append the letter kk or KK to indicate kilobytes, mm or MM to indicate
           megabytes, gg or GG to indicate gigabytes.

           The young generation region of the heap is used for new objects. GC is performed in this region more often than in other regions. If the size for the young generation
           is too small, then a lot of minor garbage collections will be performed. If the size is too large, then only full garbage collections will be performed, which can take
           a long time to complete. Oracle recommends that you keep the size for the young generation between a half and a quarter of the overall heap size.

           The following examples show how to set the initial and maximum size of young generation to 256 MB using various units:

               --XXmmnn225566mm
               --XXmmnn226622114444kk
               --XXmmnn226688443355445566

           Instead of the --XXmmnn option to set both the initial and maximum size of the heap for the young generation, you can use --XXXX::NNeewwSSiizzee to set the initial size and
           --XXXX::MMaaxxNNeewwSSiizzee to set the maximum size.

       -Xms_s_i_z_e
           Sets the initial size (in bytes) of the heap. This value must be a multiple of 1024 and greater than 1 MB. Append the letter kk or KK to indicate kilobytes, mm or MM to
           indicate megabytes, gg or GG to indicate gigabytes.

           The following examples show how to set the size of allocated memory to 6 MB using various units:

               --XXmmss66229911445566
               --XXmmss66114444kk
               --XXmmss66mm

           If you do not set this option, then the initial size will be set as the sum of the sizes allocated for the old generation and the young generation. The initial size of
           the heap for the young generation can be set using the --XXmmnn option or the --XXXX::NNeewwSSiizzee option.

       -Xmx_s_i_z_e
           Specifies the maximum size (in bytes) of the memory allocation pool in bytes. This value must be a multiple of 1024 and greater than 2 MB. Append the letter kk or KK to
           indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate gigabytes. The default value is chosen at runtime based on system configuration. For server
           deployments, --XXmmss and --XXmmxx are often set to the same value. See the section "Ergonomics" in _J_a_v_a _S_E _H_o_t_S_p_o_t _V_i_r_t_u_a_l _M_a_c_h_i_n_e _G_a_r_b_a_g_e _C_o_l_l_e_c_t_i_o_n _T_u_n_i_n_g _G_u_i_d_e at
           http://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/index.html.

           The following examples show how to set the maximum allowed size of allocated memory to 80 MB using various units:

               --XXmmxx8833888866008800
               --XXmmxx8811992200kk
               --XXmmxx8800mm

           The --XXmmxx option is equivalent to --XXXX::MMaaxxHHeeaappSSiizzee.

       -Xnoclassgc
           Disables garbage collection (GC) of classes. This can save some GC time, which shortens interruptions during the application run.

           When you specify --XXnnooccllaassssggcc at startup, the class objects in the application will be left untouched during GC and will always be considered live. This can result in
           more memory being permanently occupied which, if not used carefully, will throw an out of memory exception.

       -Xprof
           Profiles the running program and sends profiling data to standard output. This option is provided as a utility that is useful in program development and is not intended
           to be used in production systems.

       -Xrs
           Reduces the use of operating system signals by the JVM.

           Shutdown hooks enable orderly shutdown of a Java application by running user cleanup code (such as closing database connections) at shutdown, even if the JVM terminates
           abruptly.

           The JVM catches signals to implement shutdown hooks for unexpected termination. The JVM uses SSIIGGHHUUPP, SSIIGGIINNTT, and SSIIGGTTEERRMM to initiate the running of shutdown hooks.

           The JVM uses a similar mechanism to implement the feature of dumping thread stacks for debugging purposes. The JVM uses SSIIGGQQUUIITT to perform thread dumps.

           Applications embedding the JVM frequently need to trap signals such as SSIIGGIINNTT or SSIIGGTTEERRMM, which can lead to interference with the JVM signal handlers. The --XXrrss option
           is available to address this issue. When --XXrrss is used, the signal masks for SSIIGGIINNTT, SSIIGGTTEERRMM, SSIIGGHHUUPP, and SSIIGGQQUUIITT are not changed by the JVM, and signal handlers for
           these signals are not installed.

           There are two consequences of specifying --XXrrss:

           ·   SSIIGGQQUUIITT thread dumps are not available.

           ·   User code is responsible for causing shutdown hooks to run, for example, by calling SSyysstteemm..eexxiitt(()) when the JVM is to be terminated.

       -Xshare:_m_o_d_e
           Sets the class data sharing (CDS) mode. Possible _m_o_d_e arguments for this option include the following:

           auto
               Use CDS if possible. This is the default value for Java HotSpot 32-Bit Client VM.

           on
               Require the use of CDS. Print an error message and exit if class data sharing cannot be used.

           off
               Do not use CDS. This is the default value for Java HotSpot 32-Bit Server VM, Java HotSpot 64-Bit Client VM, and Java HotSpot 64-Bit Server VM.

           dump
               Manually generate the CDS archive. Specify the application class path as described in "Setting the Class Path ".

               You should regenerate the CDS archive with each new JDK release.

       -XshowSettings:_c_a_t_e_g_o_r_y
           Shows settings and continues. Possible _c_a_t_e_g_o_r_y arguments for this option include the following:

           all
               Shows all categories of settings. This is the default value.

           locale
               Shows settings related to locale.

           properties
               Shows settings related to system properties.

           vm
               Shows the settings of the JVM.

       -Xss_s_i_z_e
           Sets the thread stack size (in bytes). Append the letter kk or KK to indicate KB, mm or MM to indicate MB, gg or GG to indicate GB. The default value depends on the platform:

           ·   Linux/ARM (32-bit): 320 KB

           ·   Linux/i386 (32-bit): 320 KB

           ·   Linux/x64 (64-bit): 1024 KB

           ·   OS X (64-bit): 1024 KB

           ·   Oracle Solaris/i386 (32-bit): 320 KB

           ·   Oracle Solaris/x64 (64-bit): 1024 KB

           The following examples set the thread stack size to 1024 KB in different units:

               --XXssss11mm
               --XXssss11002244kk
               --XXssss11004488557766

           This option is equivalent to --XXXX::TThhrreeaaddSSttaacckkSSiizzee.

       -Xusealtsigs
           Use alternative signals instead of SSIIGGUUSSRR11 and SSIIGGUUSSRR22 for JVM internal signals. This option is equivalent to --XXXX::++UUsseeAAllttSSiiggss.

       -Xverify:_m_o_d_e
           Sets the mode of the bytecode verifier. Bytecode verification helps to troubleshoot some problems, but it also adds overhead to the running application. Possible _m_o_d_e
           arguments for this option include the following:

           none
               Do not verify the bytecode. This reduces startup time and also reduces the protection provided by Java.

           remote
               Verify those classes that are not loaded by the bootstrap class loader. This is the default behavior if you do not specify the --XXvveerriiffyy option.

           all
               Verify all classes.

   AAddvvaanncceedd RRuunnttiimmee OOppttiioonnss
       These options control the runtime behavior of the Java HotSpot VM.

       -XX:+CheckEndorsedAndExtDirs
           Enables the option to prevent the jjaavvaa command from running a Java application if it uses the endorsed-standards override mechanism or the extension mechanism. This
           option checks if an application is using one of these mechanisms by checking the following:

           ·   The jjaavvaa..eexxtt..ddiirrss or jjaavvaa..eennddoorrsseedd..ddiirrss system property is set.

           ·   The lliibb//eennddoorrsseedd directory exists and is not empty.

           ·   The lliibb//eexxtt directory contains any JAR files other than those of the JDK.

           ·   The system-wide platform-specific extension directory contains any JAR files.

       -XX:+DisableAttachMechanism
           Enables the option that disables the mechanism that lets tools attach to the JVM. By default, this option is disabled, meaning that the attach mechanism is enabled and
           you can use tools such as jjccmmdd, jjssttaacckk, jjmmaapp, and jjiinnffoo.

       -XX:ErrorFile=_f_i_l_e_n_a_m_e
           Specifies the path and file name to which error data is written when an irrecoverable error occurs. By default, this file is created in the current working directory
           and named hhss__eerrrr__ppiidd_p_i_d..lloogg where _p_i_d is the identifier of the process that caused the error. The following example shows how to set the default log file (note that the
           identifier of the process is specified as %%pp):

               --XXXX::EErrrroorrFFiillee==..//hhss__eerrrr__ppiidd%%pp..lloogg

           The following example shows how to set the error log to //vvaarr//lloogg//jjaavvaa//jjaavvaa__eerrrroorr..lloogg:

               --XXXX::EErrrroorrFFiillee==//vvaarr//lloogg//jjaavvaa//jjaavvaa__eerrrroorr..lloogg

           If the file cannot be created in the specified directory (due to insufficient space, permission problem, or another issue), then the file is created in the temporary
           directory for the operating system. The temporary directory is //ttmmpp.

       -XX:+FailOverToOldVerifier
           Enables automatic failover to the old verifier when the new type checker fails. By default, this option is disabled and it is ignored (that is, treated as disabled) for
           classes with a recent bytecode version. You can enable it for classes with older versions of the bytecode.

       -XX:LargePageSizeInBytes=_s_i_z_e
           On Solaris, sets the maximum size (in bytes) for large pages used for Java heap. The _s_i_z_e argument must be a power of 2 (2, 4, 8, 16, ...). Append the letter kk or KK to
           indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate gigabytes. By default, the size is set to 0, meaning that the JVM chooses the size for large pages
           automatically.

           The following example illustrates how to set the large page size to 4 megabytes (MB):

               --XXXX::LLaarrggeePPaaggeeSSiizzeeIInnBByytteess==44mm

       -XX:MaxDirectMemorySize=_s_i_z_e
           Sets the maximum total size (in bytes) of the New I/O (the jjaavvaa..nniioo package) direct-buffer allocations. Append the letter kk or KK to indicate kilobytes, mm or MM to
           indicate megabytes, gg or GG to indicate gigabytes. By default, the size is set to 0, meaning that the JVM chooses the size for NIO direct-buffer allocations
           automatically.

           The following examples illustrate how to set the NIO size to 1024 KB in different units:

               --XXXX::MMaaxxDDiirreeccttMMeemmoorryySSiizzee==11mm
               --XXXX::MMaaxxDDiirreeccttMMeemmoorryySSiizzee==11002244kk
               --XXXX::MMaaxxDDiirreeccttMMeemmoorryySSiizzee==11004488557766

       -XX:NativeMemoryTracking=_m_o_d_e
           Specifies the mode for tracking JVM native memory usage. Possible _m_o_d_e arguments for this option include the following:

           off
               Do not track JVM native memory usage. This is the default behavior if you do not specify the --XXXX::NNaattiivveeMMeemmoorryyTTrraacckkiinngg option.

           summary
               Only track memory usage by JVM subsystems, such as Java heap, class, code, and thread.

           detail
               In addition to tracking memory usage by JVM subsystems, track memory usage by individual CCaallllSSiittee, individual virtual memory region and its committed regions.

       -XX:ObjectAlignmentInBytes=_a_l_i_g_n_m_e_n_t
           Sets the memory alignment of Java objects (in bytes). By default, the value is set to 8 bytes. The specified value should be a power of two, and must be within the
           range of 8 and 256 (inclusive). This option makes it possible to use compressed pointers with large Java heap sizes.

           The heap size limit in bytes is calculated as:

           44GGBB ** OObbjjeeccttAAlliiggnnmmeennttIInnBByytteess

           Note: As the alignment value increases, the unused space between objects will also increase. As a result, you may not realize any benefits from using compressed
           pointers with large Java heap sizes.

       -XX:OnError=_s_t_r_i_n_g
           Sets a custom command or a series of semicolon-separated commands to run when an irrecoverable error occurs. If the string contains spaces, then it must be enclosed in
           quotation marks.

           The following example shows how the --XXXX::OOnnEErrrroorr option can be used to run the ggccoorree command to create the core image, and the debugger is started to attach to the
           process in case of an irrecoverable error (the %%pp designates the current process):

               --XXXX::OOnnEErrrroorr==""ggccoorree %%pp;;ddbbxx -- %%pp""

       -XX:OnOutOfMemoryError=_s_t_r_i_n_g
           Sets a custom command or a series of semicolon-separated commands to run when an OOuuttOOffMMeemmoorryyEErrrroorr exception is first thrown. If the string contains spaces, then it must
           be enclosed in quotation marks. For an example of a command string, see the description of the --XXXX::OOnnEErrrroorr option.

       -XX:+PerfDataSaveToFile
           If enabled, saves jstat(1) binary data when the Java application exits. This binary data is saved in a file named hhssppeerrffddaattaa___<_p_i_d_>, where _<_p_i_d_> is the process
           identifier of the Java application you ran. Use jjssttaatt to display the performance data contained in this file as follows:

               jjssttaatt --ccllaassss ffiillee:://////_<_p_a_t_h_>//hhssppeerrffddaattaa___<_p_i_d_>
               jjssttaatt --ggcc ffiillee:://////_<_p_a_t_h_>//hhssppeerrffddaattaa___<_p_i_d_>

       -XX:+PrintCommandLineFlags
           Enables printing of ergonomically selected JVM flags that appeared on the command line. It can be useful to know the ergonomic values set by the JVM, such as the heap
           space size and the selected garbage collector. By default, this option is disabled and flags are not printed.

       -XX:+PrintNMTStatistics
           Enables printing of collected native memory tracking data at JVM exit when native memory tracking is enabled (see --XXXX::NNaattiivveeMMeemmoorryyTTrraacckkiinngg). By default, this option is
           disabled and native memory tracking data is not printed.

       -XX:+RelaxAccessControlCheck
           Decreases the amount of access control checks in the verifier. By default, this option is disabled, and it is ignored (that is, treated as disabled) for classes with a
           recent bytecode version. You can enable it for classes with older versions of the bytecode.

       -XX:+ShowMessageBoxOnError
           Enables displaying of a dialog box when the JVM experiences an irrecoverable error. This prevents the JVM from exiting and keeps the process active so that you can
           attach a debugger to it to investigate the cause of the error. By default, this option is disabled.

       -XX:ThreadStackSize=_s_i_z_e
           Sets the thread stack size (in bytes). Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate gigabytes. The default value
           depends on the platform:

           ·   Linux/ARM (32-bit): 320 KB

           ·   Linux/i386 (32-bit): 320 KB

           ·   Linux/x64 (64-bit): 1024 KB

           ·   OS X (64-bit): 1024 KB

           ·   Oracle Solaris/i386 (32-bit): 320 KB

           ·   Oracle Solaris/x64 (64-bit): 1024 KB

           The following examples show how to set the thread stack size to 1024 KB in different units:

               --XXXX::TThhrreeaaddSSttaacckkSSiizzee==11mm
               --XXXX::TThhrreeaaddSSttaacckkSSiizzee==11002244kk
               --XXXX::TThhrreeaaddSSttaacckkSSiizzee==11004488557766

           This option is equivalent to --XXssss.

       -XX:+TraceClassLoading
           Enables tracing of classes as they are loaded. By default, this option is disabled and classes are not traced.

       -XX:+TraceClassLoadingPreorder
           Enables tracing of all loaded classes in the order in which they are referenced. By default, this option is disabled and classes are not traced.

       -XX:+TraceClassResolution
           Enables tracing of constant pool resolutions. By default, this option is disabled and constant pool resolutions are not traced.

       -XX:+TraceClassUnloading
           Enables tracing of classes as they are unloaded. By default, this option is disabled and classes are not traced.

       -XX:+TraceLoaderConstraints
           Enables tracing of the loader constraints recording. By default, this option is disabled and loader constraints recording is not traced.

       -XX:+UseAltSigs
           Enables the use of alternative signals instead of SSIIGGUUSSRR11 and SSIIGGUUSSRR22 for JVM internal signals. By default, this option is disabled and alternative signals are not
           used. This option is equivalent to --XXuusseeaallttssiiggss.

       -XX:-UseBiasedLocking
           Disables the use of biased locking. Some applications with significant amounts of uncontended synchronization may attain significant speedups with this flag enabled,
           whereas applications with certain patterns of locking may see slowdowns. For more information about the biased locking technique, see the example in Java Tuning White
           Paper at http://www.oracle.com/technetwork/java/tuning-139912.html#section4.2.5

           By default, this option is enabled.

       -XX:-UseCompressedOops
           Disables the use of compressed pointers. By default, this option is enabled, and compressed pointers are used when Java heap sizes are less than 32 GB. When this option
           is enabled, object references are represented as 32-bit offsets instead of 64-bit pointers, which typically increases performance when running the application with Java
           heap sizes less than 32 GB. This option works only for 64-bit JVMs.

           It is also possible to use compressed pointers when Java heap sizes are greater than 32GB. See the --XXXX::OObbjjeeccttAAlliiggnnmmeennttIInnBByytteess option.

       -XX:+UseHugeTLBFS
           This option for Linux is the equivalent of specifying --XXXX::++UUsseeLLaarrggeePPaaggeess. This option is disabled by default. This option pre-allocates all large pages up-front, when
           memory is reserved; consequently the JVM cannot dynamically grow or shrink large pages memory areas; see --XXXX::UUsseeTTrraannssppaarreennttHHuuggeePPaaggeess if you want this behavior.

           For more information, see "Large Pages".

       -XX:+UseLargePages
           Enables the use of large page memory. By default, this option is disabled and large page memory is not used.

           For more information, see "Large Pages".

       -XX:+UseMembar
           Enables issuing of membars on thread state transitions. This option is disabled by default on all platforms except ARM servers, where it is enabled. (It is recommended
           that you do not disable this option on ARM servers.)

       -XX:+UsePerfData
           Enables the ppeerrffddaattaa feature. This option is enabled by default to allow JVM monitoring and performance testing. Disabling it suppresses the creation of the
           hhssppeerrffddaattaa__uusseerriidd directories. To disable the ppeerrffddaattaa feature, specify --XXXX::--UUsseePPeerrffDDaattaa.

       -XX:+UseTransparentHugePages
           On Linux, enables the use of large pages that can dynamically grow or shrink. This option is disabled by default. You may encounter performance problems with
           transparent huge pages as the OS moves other pages around to create huge pages; this option is made available for experimentation.

           For more information, see "Large Pages".

       -XX:+AllowUserSignalHandlers
           Enables installation of signal handlers by the application. By default, this option is disabled and the application is not allowed to install signal handlers.

   AAddvvaanncceedd JJIITT CCoommppiilleerr OOppttiioonnss
       These options control the dynamic just-in-time (JIT) compilation performed by the Java HotSpot VM.

       -XX:+AggressiveOpts
           Enables the use of aggressive performance optimization features, which are expected to become default in upcoming releases. By default, this option is disabled and
           experimental performance features are not used.

       -XX:AllocateInstancePrefetchLines=_l_i_n_e_s
           Sets the number of lines to prefetch ahead of the instance allocation pointer. By default, the number of lines to prefetch is set to 1:

               --XXXX::AAllllooccaatteeIInnssttaanncceePPrreeffeettcchhLLiinneess==11

           Only the Java HotSpot Server VM supports this option.

       -XX:AllocatePrefetchDistance=_s_i_z_e
           Sets the size (in bytes) of the prefetch distance for object allocation. Memory about to be written with the value of new objects is prefetched up to this distance
           starting from the address of the last allocated object. Each Java thread has its own allocation point.

           Negative values denote that prefetch distance is chosen based on the platform. Positive values are bytes to prefetch. Append the letter kk or KK to indicate kilobytes, mm
           or MM to indicate megabytes, gg or GG to indicate gigabytes. The default value is set to -1.

           The following example shows how to set the prefetch distance to 1024 bytes:

               --XXXX::AAllllooccaatteePPrreeffeettcchhDDiissttaannccee==11002244

           Only the Java HotSpot Server VM supports this option.

       -XX:AllocatePrefetchInstr=_i_n_s_t_r_u_c_t_i_o_n
           Sets the prefetch instruction to prefetch ahead of the allocation pointer. Only the Java HotSpot Server VM supports this option. Possible values are from 0 to 3. The
           actual instructions behind the values depend on the platform. By default, the prefetch instruction is set to 0:

               --XXXX::AAllllooccaatteePPrreeffeettcchhIInnssttrr==00

           Only the Java HotSpot Server VM supports this option.

       -XX:AllocatePrefetchLines=_l_i_n_e_s
           Sets the number of cache lines to load after the last object allocation by using the prefetch instructions generated in compiled code. The default value is 1 if the
           last allocated object was an instance, and 3 if it was an array.

           The following example shows how to set the number of loaded cache lines to 5:

               --XXXX::AAllllooccaatteePPrreeffeettcchhLLiinneess==55

           Only the Java HotSpot Server VM supports this option.

       -XX:AllocatePrefetchStepSize=_s_i_z_e
           Sets the step size (in bytes) for sequential prefetch instructions. Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate
           gigabytes. By default, the step size is set to 16 bytes:

               --XXXX::AAllllooccaatteePPrreeffeettcchhSStteeppSSiizzee==1166

           Only the Java HotSpot Server VM supports this option.

       -XX:AllocatePrefetchStyle=_s_t_y_l_e
           Sets the generated code style for prefetch instructions. The _s_t_y_l_e argument is an integer from 0 to 3:

           0
               Do not generate prefetch instructions.

           1
               Execute prefetch instructions after each allocation. This is the default parameter.

           2
               Use the thread-local allocation block (TLAB) watermark pointer to determine when prefetch instructions are executed.

           3
               Use BIS instruction on SPARC for allocation prefetch.

           Only the Java HotSpot Server VM supports this option.

       -XX:+BackgroundCompilation
           Enables background compilation. This option is enabled by default. To disable background compilation, specify --XXXX::--BBaacckkggrroouunnddCCoommppiillaattiioonn (this is equivalent to
           specifying --XXbbaattcchh).

       -XX:CICompilerCount=_t_h_r_e_a_d_s
           Sets the number of compiler threads to use for compilation. By default, the number of threads is set to 2 for the server JVM, to 1 for the client JVM, and it scales to
           the number of cores if tiered compilation is used. The following example shows how to set the number of threads to 2:

               --XXXX::CCIICCoommppiilleerrCCoouunntt==22

       -XX:CodeCacheMinimumFreeSpace=_s_i_z_e
           Sets the minimum free space (in bytes) required for compilation. Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate
           gigabytes. When less than the minimum free space remains, compiling stops. By default, this option is set to 500 KB. The following example shows how to set the minimum
           free space to 1024 MB:

               --XXXX::CCooddeeCCaacchheeMMiinniimmuummFFrreeeeSSppaaccee==11002244mm

       -XX:CompileCommand=_c_o_m_m_a_n_d,_m_e_t_h_o_d[,_o_p_t_i_o_n]
           Specifies a command to perform on a method. For example, to exclude the iinnddeexxOOff(()) method of the SSttrriinngg class from being compiled, use the following:

               --XXXX::CCoommppiilleeCCoommmmaanndd==eexxcclluuddee,,jjaavvaa//llaanngg//SSttrriinngg..iinnddeexxOOff

           Note that the full class name is specified, including all packages and subpackages separated by a slash (//). For easier cut and paste operations, it is also possible to
           use the method name format produced by the --XXXX::++PPrriinnttCCoommppiillaattiioonn and --XXXX::++LLooggCCoommppiillaattiioonn options:

               --XXXX::CCoommppiilleeCCoommmmaanndd==eexxcclluuddee,,jjaavvaa..llaanngg..SSttrriinngg::::iinnddeexxOOff

           If the method is specified without the signature, the command will be applied to all methods with the specified name. However, you can also specify the signature of the
           method in the class file format. In this case, you should enclose the arguments in quotation marks, because otherwise the shell treats the semicolon as command end. For
           example, if you want to exclude only the iinnddeexxOOff((SSttrriinngg)) method of the SSttrriinngg class from being compiled, use the following:

               --XXXX::CCoommppiilleeCCoommmmaanndd==""eexxcclluuddee,,jjaavvaa//llaanngg//SSttrriinngg..iinnddeexxOOff,,((LLjjaavvaa//llaanngg//SSttrriinngg;;))II""

           You can also use the asterisk (*) as a wildcard for class and method names. For example, to exclude all iinnddeexxOOff(()) methods in all classes from being compiled, use the
           following:

               --XXXX::CCoommppiilleeCCoommmmaanndd==eexxcclluuddee,,**..iinnddeexxOOff

           The commas and periods are aliases for spaces, making it easier to pass compiler commands through a shell. You can pass arguments to --XXXX::CCoommppiilleeCCoommmmaanndd using spaces as
           separators by enclosing the argument in quotation marks:

               --XXXX::CCoommppiilleeCCoommmmaanndd==""eexxcclluuddee jjaavvaa//llaanngg//SSttrriinngg iinnddeexxOOff""

           Note that after parsing the commands passed on the command line using the --XXXX::CCoommppiilleeCCoommmmaanndd options, the JIT compiler then reads commands from the ..hhoottssppoott__ccoommppiilleerr
           file. You can add commands to this file or specify a different file using the --XXXX::CCoommppiilleeCCoommmmaannddFFiillee option.

           To add several commands, either specify the --XXXX::CCoommppiilleeCCoommmmaanndd option multiple times, or separate each argument with the newline separator (\\nn). The following commands
           are available:

           break
               Set a breakpoint when debugging the JVM to stop at the beginning of compilation of the specified method.

           compileonly
               Exclude all methods from compilation except for the specified method. As an alternative, you can use the --XXXX::CCoommppiilleeOOnnllyy option, which allows to specify several
               methods.

           dontinline
               Prevent inlining of the specified method.

           exclude
               Exclude the specified method from compilation.

           help
               Print a help message for the --XXXX::CCoommppiilleeCCoommmmaanndd option.

           inline
               Attempt to inline the specified method.

           log
               Exclude compilation logging (with the --XXXX::++LLooggCCoommppiillaattiioonn option) for all methods except for the specified method. By default, logging is performed for all compiled
               methods.

           option
               This command can be used to pass a JIT compilation option to the specified method in place of the last argument (_o_p_t_i_o_n). The compilation option is set at the end,
               after the method name. For example, to enable the BBlloocckkLLaayyoouuttBByyFFrreeqquueennccyy option for the aappppeenndd(()) method of the SSttrriinnggBBuuffffeerr class, use the following:

                   --XXXX::CCoommppiilleeCCoommmmaanndd==ooppttiioonn,,jjaavvaa//llaanngg//SSttrriinnggBBuuffffeerr..aappppeenndd,,BBlloocckkLLaayyoouuttBByyFFrreeqquueennccyy

               You can specify multiple compilation options, separated by commas or spaces.

           print
               Print generated assembler code after compilation of the specified method.

           quiet
               Do not print the compile commands. By default, the commands that you specify with the -XXXX::CCoommppiilleeCCoommmmaanndd option are printed; for example, if you exclude from
               compilation the iinnddeexxOOff(()) method of the SSttrriinngg class, then the following will be printed to standard output:

                   CCoommppiilleerrOOrraaccllee:: eexxcclluuddee jjaavvaa//llaanngg//SSttrriinngg..iinnddeexxOOff

               You can suppress this by specifying the --XXXX::CCoommppiilleeCCoommmmaanndd==qquuiieett option before other --XXXX::CCoommppiilleeCCoommmmaanndd options.

       -XX:CompileCommandFile=_f_i_l_e_n_a_m_e
           Sets the file from which JIT compiler commands are read. By default, the ..hhoottssppoott__ccoommppiilleerr file is used to store commands performed by the JIT compiler.

           Each line in the command file represents a command, a class name, and a method name for which the command is used. For example, this line prints assembly code for the
           ttooSSttrriinngg(()) method of the SSttrriinngg class:

               pprriinntt jjaavvaa//llaanngg//SSttrriinngg ttooSSttrriinngg

           For more information about specifying the commands for the JIT compiler to perform on methods, see the --XXXX::CCoommppiilleeCCoommmmaanndd option.

       -XX:CompileOnly=_m_e_t_h_o_d_s
           Sets the list of methods (separated by commas) to which compilation should be restricted. Only the specified methods will be compiled. Specify each method with the full
           class name (including the packages and subpackages). For example, to compile only the lleennggtthh(()) method of the SSttrriinngg class and the ssiizzee(()) method of the LLiisstt class, use
           the following:

               --XXXX::CCoommppiilleeOOnnllyy==jjaavvaa//llaanngg//SSttrriinngg..lleennggtthh,,jjaavvaa//uuttiill//LLiisstt..ssiizzee

           Note that the full class name is specified, including all packages and subpackages separated by a slash (//). For easier cut and paste operations, it is also possible to
           use the method name format produced by the --XXXX::++PPrriinnttCCoommppiillaattiioonn and --XXXX::++LLooggCCoommppiillaattiioonn options:

               --XXXX::CCoommppiilleeOOnnllyy==jjaavvaa..llaanngg..SSttrriinngg::::lleennggtthh,,jjaavvaa..uuttiill..LLiisstt::::ssiizzee

           Although wildcards are not supported, you can specify only the class or package name to compile all methods in that class or package, as well as specify just the method
           to compile methods with this name in any class:

               --XXXX::CCoommppiilleeOOnnllyy==jjaavvaa//llaanngg//SSttrriinngg
               --XXXX::CCoommppiilleeOOnnllyy==jjaavvaa//llaanngg
               --XXXX::CCoommppiilleeOOnnllyy==..lleennggtthh

       -XX:CompileThreshold=_i_n_v_o_c_a_t_i_o_n_s
           Sets the number of interpreted method invocations before compilation. By default, in the server JVM, the JIT compiler performs 10,000 interpreted method invocations to
           gather information for efficient compilation. For the client JVM, the default setting is 1,500 invocations. This option is ignored when tiered compilation is enabled;
           see the option --XXXX::++TTiieerreeddCCoommppiillaattiioonn. The following example shows how to set the number of interpreted method invocations to 5,000:

               --XXXX::CCoommppiilleeTThhrreesshhoolldd==55000000

           You can completely disable interpretation of Java methods before compilation by specifying the --XXccoommpp option.

       -XX:+DoEscapeAnalysis
           Enables the use of escape analysis. This option is enabled by default. To disable the use of escape analysis, specify --XXXX::--DDooEEssccaappeeAAnnaallyyssiiss. Only the Java HotSpot
           Server VM supports this option.

       -XX:InitialCodeCacheSize=_s_i_z_e
           Sets the initial code cache size (in bytes). Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate gigabytes. The default
           value is set to 500 KB. The initial code cache size should be not less than the system's minimal memory page size. The following example shows how to set the initial
           code cache size to 32 KB:

               --XXXX::IInniittiiaallCCooddeeCCaacchheeSSiizzee==3322kk

       -XX:+Inline
           Enables method inlining. This option is enabled by default to increase performance. To disable method inlining, specify --XXXX::--IInnlliinnee.

       -XX:InlineSmallCode=_s_i_z_e
           Sets the maximum code size (in bytes) for compiled methods that should be inlined. Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG
           to indicate gigabytes. Only compiled methods with the size smaller than the specified size will be inlined. By default, the maximum code size is set to 1000 bytes:

               --XXXX::IInnlliinneeSSmmaallllCCooddee==11000000

       -XX:+LogCompilation
           Enables logging of compilation activity to a file named hhoottssppoott..lloogg in the current working directory. You can specify a different log file path and name using the
           --XXXX::LLooggFFiillee option.

           By default, this option is disabled and compilation activity is not logged. The --XXXX::++LLooggCCoommppiillaattiioonn option has to be used together with the
           --XXXX::UUnnlloocckkDDiiaaggnnoossttiiccVVMMOOppttiioonnss option that unlocks diagnostic JVM options.

           You can enable verbose diagnostic output with a message printed to the console every time a method is compiled by using the --XXXX::++PPrriinnttCCoommppiillaattiioonn option.

       -XX:MaxInlineSize=_s_i_z_e
           Sets the maximum bytecode size (in bytes) of a method to be inlined. Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate
           gigabytes. By default, the maximum bytecode size is set to 35 bytes:

               --XXXX::MMaaxxIInnlliinneeSSiizzee==3355

       -XX:MaxNodeLimit=_n_o_d_e_s
           Sets the maximum number of nodes to be used during single method compilation. By default, the maximum number of nodes is set to 65,000:

               --XXXX::MMaaxxNNooddeeLLiimmiitt==6655000000

       -XX:MaxTrivialSize=_s_i_z_e
           Sets the maximum bytecode size (in bytes) of a trivial method to be inlined. Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to
           indicate gigabytes. By default, the maximum bytecode size of a trivial method is set to 6 bytes:

               --XXXX::MMaaxxTTrriivviiaallSSiizzee==66

       -XX:+OptimizeStringConcat
           Enables the optimization of SSttrriinngg concatenation operations. This option is enabled by default. To disable the optimization of SSttrriinngg concatenation operations, specify
           --XXXX::--OOppttiimmiizzeeSSttrriinnggCCoonnccaatt. Only the Java HotSpot Server VM supports this option.

       -XX:+PrintAssembly
           Enables printing of assembly code for bytecoded and native methods by using the external ddiissaasssseemmbblleerr..ssoo library. This enables you to see the generated code, which may
           help you to diagnose performance issues.

           By default, this option is disabled and assembly code is not printed. The --XXXX::++PPrriinnttAAsssseemmbbllyy option has to be used together with the --XXXX::UUnnlloocckkDDiiaaggnnoossttiiccVVMMOOppttiioonnss
           option that unlocks diagnostic JVM options.

       -XX:+PrintCompilation
           Enables verbose diagnostic output from the JVM by printing a message to the console every time a method is compiled. This enables you to see which methods actually get
           compiled. By default, this option is disabled and diagnostic output is not printed.

           You can also log compilation activity to a file by using the --XXXX::++LLooggCCoommppiillaattiioonn option.

       -XX:+PrintInlining
           Enables printing of inlining decisions. This enables you to see which methods are getting inlined.

           By default, this option is disabled and inlining information is not printed. The --XXXX::++PPrriinnttIInnlliinniinngg option has to be used together with the
           --XXXX::++UUnnlloocckkDDiiaaggnnoossttiiccVVMMOOppttiioonnss option that unlocks diagnostic JVM options.

       -XX:ReservedCodeCacheSize=_s_i_z_e
           Sets the maximum code cache size (in bytes) for JIT-compiled code. Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate
           gigabytes. The default maximum code cache size is 240 MB; if you disable tiered compilation with the option --XXXX::--TTiieerreeddCCoommppiillaattiioonn, then the default size is 48 MB. This
           option has a limit of 2 GB; otherwise, an error is generated. The maximum code cache size should not be less than the initial code cache size; see the option
           --XXXX::IInniittiiaallCCooddeeCCaacchheeSSiizzee. This option is equivalent to --XXmmaaxxjjiittccooddeessiizzee.

       -XX:RTMAbortRatio=_a_b_o_r_t___r_a_t_i_o
           The RTM abort ratio is specified as a percentage (%) of all executed RTM transactions. If a number of aborted transactions becomes greater than this ratio, then the
           compiled code will be deoptimized. This ratio is used when the --XXXX::++UUsseeRRTTMMDDeeoopptt option is enabled. The default value of this option is 50. This means that the compiled
           code will be deoptimized if 50% of all transactions are aborted.

       -XX:RTMRetryCount=_n_u_m_b_e_r___o_f___r_e_t_r_i_e_s
           RTM locking code will be retried, when it is aborted or busy, the number of times specified by this option before falling back to the normal locking mechanism. The
           default value for this option is 5. The --XXXX::UUsseeRRTTMMLLoocckkiinngg option must be enabled.

       -XX:-TieredCompilation
           Disables the use of tiered compilation. By default, this option is enabled. Only the Java HotSpot Server VM supports this option.

       -XX:+UseAES
           Enables hardware-based AES intrinsics for Intel, AMD, and SPARC hardware. Intel Westmere (2010 and newer), AMD Bulldozer (2011 and newer), and SPARC (T4 and newer) are
           the supported hardware. UseAES is used in conjunction with UseAESIntrinsics.

       -XX:+UseAESIntrinsics
           UseAES and UseAESIntrinsics flags are enabled by default and are supported only for Java HotSpot Server VM 32-bit and 64-bit. To disable hardware-based AES intrinsics,
           specify --XXXX::--UUsseeAAEESS --XXXX::--UUsseeAAEESSIInnttrriinnssiiccss. For example, to enable hardware AES, use the following flags:

               --XXXX::++UUsseeAAEESS --XXXX::++UUsseeAAEESSIInnttrriinnssiiccss

           To support UseAES and UseAESIntrinsics flags for 32-bit and 64-bit use --sseerrvveerr option to choose Java HotSpot Server VM. These flags are not supported on Client VM.

       -XX:+UseCodeCacheFlushing
           Enables flushing of the code cache before shutting down the compiler. This option is enabled by default. To disable flushing of the code cache before shutting down the
           compiler, specify --XXXX::--UUsseeCCooddeeCCaacchheeFFlluusshhiinngg.

       -XX:+UseCondCardMark
           Enables checking of whether the card is already marked before updating the card table. This option is disabled by default and should only be used on machines with
           multiple sockets, where it will increase performance of Java applications that rely heavily on concurrent operations. Only the Java HotSpot Server VM supports this
           option.

       -XX:+UseRTMDeopt
           Auto-tunes RTM locking depending on the abort ratio. This ratio is specified by --XXXX::RRTTMMAAbboorrttRRaattiioo option. If the number of aborted transactions exceeds the abort ratio,
           then the method containing the lock will be deoptimized and recompiled with all locks as normal locks. This option is disabled by default. The --XXXX::++UUsseeRRTTMMLLoocckkiinngg option
           must be enabled.

       -XX:+UseRTMLocking
           Generate Restricted Transactional Memory (RTM) locking code for all inflated locks, with the normal locking mechanism as the fallback handler. This option is disabled
           by default. Options related to RTM are only available for the Java HotSpot Server VM on x86 CPUs that support Transactional Synchronization Extensions (TSX).

           RTM is part of Intel's TSX, which is an x86 instruction set extension and facilitates the creation of multithreaded applications. RTM introduces the new instructions
           XXBBEEGGIINN, XXAABBOORRTT, XXEENNDD, and XXTTEESSTT. The XXBBEEGGIINN and XXEENNDD instructions enclose a set of instructions to run as a transaction. If no conflict is found when running the
           transaction, the memory and register modifications are committed together at the XXEENNDD instruction. The XXAABBOORRTT instruction can be used to explicitly abort a transaction
           and the XXEENNDD instruction to check if a set of instructions are being run in a transaction.

           A lock on a transaction is inflated when another thread tries to access the same transaction, thereby blocking the thread that did not originally request access to the
           transaction. RTM requires that a fallback set of operations be specified in case a transaction aborts or fails. An RTM lock is a lock that has been delegated to the
           TSX's system.

           RTM improves performance for highly contended locks with low conflict in a critical region (which is code that must not be accessed by more than one thread
           concurrently). RTM also improves the performance of coarse-grain locking, which typically does not perform well in multithreaded applications. (Coarse-grain locking is
           the strategy of holding locks for long periods to minimize the overhead of taking and releasing locks, while fine-grained locking is the strategy of trying to achieve
           maximum parallelism by locking only when necessary and unlocking as soon as possible.) Also, for lightly contended locks that are used by different threads, RTM can
           reduce false cache line sharing, also known as cache line ping-pong. This occurs when multiple threads from different processors are accessing different resources, but
           the resources share the same cache line. As a result, the processors repeatedly invalidate the cache lines of other processors, which forces them to read from main
           memory instead of their cache.

       -XX:+UseSHA
           Enables hardware-based intrinsics for SHA crypto hash functions for SPARC hardware.  UUsseeSSHHAA is used in conjunction with the UUsseeSSHHAA11IInnttrriinnssiiccss, UUsseeSSHHAA225566IInnttrriinnssiiccss, and
           UUsseeSSHHAA551122IInnttrriinnssiiccss options.

           The UUsseeSSHHAA and UUsseeSSHHAA**IInnttrriinnssiiccss flags are enabled by default, and are supported only for Java HotSpot Server VM 64-bit on SPARC T4 and newer.

           This feature is only applicable when using the ssuunn..sseeccuurriittyy..pprroovviiddeerr..SSuunn provider for SHA operations.

           To disable all hardware-based SHA intrinsics, specify --XXXX::--UUsseeSSHHAA. To disable only a particular SHA intrinsic, use the appropriate corresponding option. For example:
           --XXXX::--UUsseeSSHHAA225566IInnttrriinnssiiccss.

       -XX:+UseSHA1Intrinsics
           Enables intrinsics for SHA-1 crypto hash function.

       -XX:+UseSHA256Intrinsics
           Enables intrinsics for SHA-224 and SHA-256 crypto hash functions.

       -XX:+UseSHA512Intrinsics
           Enables intrinsics for SHA-384 and SHA-512 crypto hash functions.

       -XX:+UseSuperWord
           Enables the transformation of scalar operations into superword operations. This option is enabled by default. To disable the transformation of scalar operations into
           superword operations, specify --XXXX::--UUsseeSSuuppeerrWWoorrdd. Only the Java HotSpot Server VM supports this option.

   AAddvvaanncceedd SSeerrvviicceeaabbiilliittyy OOppttiioonnss
       These options provide the ability to gather system information and perform extensive debugging.

       -XX:+ExtendedDTraceProbes
           Enables additional ddttrraaccee tool probes that impact the performance. By default, this option is disabled and ddttrraaccee performs only standard probes.

       -XX:+HeapDumpOnOutOfMemory
           Enables the dumping of the Java heap to a file in the current directory by using the heap profiler (HPROF) when a jjaavvaa..llaanngg..OOuuttOOffMMeemmoorryyEErrrroorr exception is thrown. You
           can explicitly set the heap dump file path and name using the --XXXX::HHeeaappDDuummppPPaatthh option. By default, this option is disabled and the heap is not dumped when an
           OOuuttOOffMMeemmoorryyEErrrroorr exception is thrown.

       -XX:HeapDumpPath=_p_a_t_h
           Sets the path and file name for writing the heap dump provided by the heap profiler (HPROF) when the --XXXX::++HHeeaappDDuummppOOnnOOuuttOOffMMeemmoorryyEErrrroorr option is set. By default, the file
           is created in the current working directory, and it is named jjaavvaa__ppiidd_p_i_d..hhpprrooff where _p_i_d is the identifier of the process that caused the error. The following example
           shows how to set the default file explicitly (%%pp represents the current process identificator):

               --XXXX::HHeeaappDDuummppPPaatthh==..//jjaavvaa__ppiidd%%pp..hhpprrooff

           The following example shows how to set the heap dump file to //vvaarr//lloogg//jjaavvaa//jjaavvaa__hheeaappdduummpp..hhpprrooff:

               --XXXX::HHeeaappDDuummppPPaatthh==//vvaarr//lloogg//jjaavvaa//jjaavvaa__hheeaappdduummpp..hhpprrooff

       -XX:LogFile=_p_a_t_h
           Sets the path and file name where log data is written. By default, the file is created in the current working directory, and it is named hhoottssppoott..lloogg.

           The following example shows how to set the log file to //vvaarr//lloogg//jjaavvaa//hhoottssppoott..lloogg:

               --XXXX::LLooggFFiillee==//vvaarr//lloogg//jjaavvaa//hhoottssppoott..lloogg

       -XX:+PrintClassHistogram
           Enables printing of a class instance histogram after a CCoonnttrrooll++CC event (SSIIGGTTEERRMM). By default, this option is disabled.

           Setting this option is equivalent to running the jjmmaapp --hhiissttoo command, or the jjccmmdd _p_i_d GGCC..ccllaassss__hhiissttooggrraamm command, where _p_i_d is the current Java process identifier.

       -XX:+PrintConcurrentLocks
           Enables printing of locks after a event. By default, this option is disabled.

           Enables printing of jjaavvaa..uuttiill..ccoonnccuurrrreenntt locks after a CCoonnttrrooll++CC event (SSIIGGTTEERRMM). By default, this option is disabled.

           Setting this option is equivalent to running the jjssttaacckk --ll command or the jjccmmdd _p_i_d TThhrreeaadd..pprriinntt --ll command, where _p_i_d is the current Java process identifier.

       -XX:+UnlockDiagnosticVMOptions
           Unlocks the options intended for diagnosing the JVM. By default, this option is disabled and diagnostic options are not available.

   AAddvvaanncceedd GGaarrbbaaggee CCoolllleeccttiioonn OOppttiioonnss
       These options control how garbage collection (GC) is performed by the Java HotSpot VM.

       -XX:+AggressiveHeap
           Enables Java heap optimization. This sets various parameters to be optimal for long-running jobs with intensive memory allocation, based on the configuration of the
           computer (RAM and CPU). By default, the option is disabled and the heap is not optimized.

       -XX:+AlwaysPreTouch
           Enables touching of every page on the Java heap during JVM initialization. This gets all pages into the memory before entering the mmaaiinn(()) method. The option can be used
           in testing to simulate a long-running system with all virtual memory mapped to physical memory. By default, this option is disabled and all pages are committed as JVM
           heap space fills.

       -XX:+CMSClassUnloadingEnabled
           Enables class unloading when using the concurrent mark-sweep (CMS) garbage collector. This option is enabled by default. To disable class unloading for the CMS garbage
           collector, specify --XXXX::--CCMMSSCCllaassssUUnnllooaaddiinnggEEnnaabblleedd.

       -XX:CMSExpAvgFactor=_p_e_r_c_e_n_t
           Sets the percentage of time (0 to 100) used to weight the current sample when computing exponential averages for the concurrent collection statistics. By default, the
           exponential averages factor is set to 25%. The following example shows how to set the factor to 15%:

               --XXXX::CCMMSSEExxppAAvvggFFaaccttoorr==1155

       -XX:CMSInitiatingOccupancyFraction=_p_e_r_c_e_n_t
           Sets the percentage of the old generation occupancy (0 to 100) at which to start a CMS collection cycle. The default value is set to -1. Any negative value (including
           the default) implies that --XXXX::CCMMSSTTrriiggggeerrRRaattiioo is used to define the value of the initiating occupancy fraction.

           The following example shows how to set the occupancy fraction to 20%:

               --XXXX::CCMMSSIInniittiiaattiinnggOOccccuuppaannccyyFFrraaccttiioonn==2200

       -XX:+CMSScavengeBeforeRemark
           Enables scavenging attempts before the CMS remark step. By default, this option is disabled.

       -XX:CMSTriggerRatio=_p_e_r_c_e_n_t
           Sets the percentage (0 to 100) of the value specified by --XXXX::MMiinnHHeeaappFFrreeeeRRaattiioo that is allocated before a CMS collection cycle commences. The default value is set to
           80%.

           The following example shows how to set the occupancy fraction to 75%:

               --XXXX::CCMMSSTTrriiggggeerrRRaattiioo==7755

       -XX:ConcGCThreads=_t_h_r_e_a_d_s
           Sets the number of threads used for concurrent GC. The default value depends on the number of CPUs available to the JVM.

           For example, to set the number of threads for concurrent GC to 2, specify the following option:

               --XXXX::CCoonnccGGCCTThhrreeaaddss==22

       -XX:+DisableExplicitGC
           Enables the option that disables processing of calls to SSyysstteemm..ggcc(()). This option is disabled by default, meaning that calls to SSyysstteemm..ggcc(()) are processed. If processing
           of calls to SSyysstteemm..ggcc(()) is disabled, the JVM still performs GC when necessary.

       -XX:+ExplicitGCInvokesConcurrent
           Enables invoking of concurrent GC by using the SSyysstteemm..ggcc(()) request. This option is disabled by default and can be enabled only together with the --XXXX::++UUsseeCCoonnccMMaarrkkSSwweeeeppGGCC
           option.

       -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses
           Enables invoking of concurrent GC by using the SSyysstteemm..ggcc(()) request and unloading of classes during the concurrent GC cycle. This option is disabled by default and can
           be enabled only together with the --XXXX::++UUsseeCCoonnccMMaarrkkSSwweeeeppGGCC option.

       -XX:G1HeapRegionSize=_s_i_z_e
           Sets the size of the regions into which the Java heap is subdivided when using the garbage-first (G1) collector. The value can be between 1 MB and 32 MB. The default
           region size is determined ergonomically based on the heap size.

           The following example shows how to set the size of the subdivisions to 16 MB:

               --XXXX::GG11HHeeaappRReeggiioonnSSiizzee==1166mm

       -XX:+G1PrintHeapRegions
           Enables the printing of information about which regions are allocated and which are reclaimed by the G1 collector. By default, this option is disabled.

       -XX:G1ReservePercent=_p_e_r_c_e_n_t
           Sets the percentage of the heap (0 to 50) that is reserved as a false ceiling to reduce the possibility of promotion failure for the G1 collector. By default, this
           option is set to 10%.

           The following example shows how to set the reserved heap to 20%:

               --XXXX::GG11RReesseerrvveePPeerrcceenntt==2200

       -XX:InitialHeapSize=_s_i_z_e
           Sets the initial size (in bytes) of the memory allocation pool. This value must be either 0, or a multiple of 1024 and greater than 1 MB. Append the letter kk or KK to
           indicate kilobytes, mm or MM to indicate megabytes, gg or GG to indicate gigabytes. The default value is chosen at runtime based on system configuration. See the section
           "Ergonomics" in _J_a_v_a _S_E _H_o_t_S_p_o_t _V_i_r_t_u_a_l _M_a_c_h_i_n_e _G_a_r_b_a_g_e _C_o_l_l_e_c_t_i_o_n _T_u_n_i_n_g _G_u_i_d_e at http://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/index.html.

           The following examples show how to set the size of allocated memory to 6 MB using various units:

               --XXXX::IInniittiiaallHHeeaappSSiizzee==66229911445566
               --XXXX::IInniittiiaallHHeeaappSSiizzee==66114444kk
               --XXXX::IInniittiiaallHHeeaappSSiizzee==66mm

           If you set this option to 0, then the initial size will be set as the sum of the sizes allocated for the old generation and the young generation. The size of the heap
           for the young generation can be set using the --XXXX::NNeewwSSiizzee option.

       -XX:InitialSurvivorRatio=_r_a_t_i_o
           Sets the initial survivor space ratio used by the throughput garbage collector (which is enabled by the --XXXX::++UUsseePPaarraalllleellGGCC and/or -XXXX::++UUsseePPaarraalllleellOOllddGGCC options).
           Adaptive sizing is enabled by default with the throughput garbage collector by using the --XXXX::++UUsseePPaarraalllleellGGCC and --XXXX::++UUsseePPaarraalllleellOOllddGGCC options, and survivor space is
           resized according to the application behavior, starting with the initial value. If adaptive sizing is disabled (using the --XXXX::--UUsseeAAddaappttiivveeSSiizzeePPoolliiccyy option), then the
           --XXXX::SSuurrvviivvoorrRRaattiioo option should be used to set the size of the survivor space for the entire execution of the application.

           The following formula can be used to calculate the initial size of survivor space (S) based on the size of the young generation (Y), and the initial survivor space
           ratio (R):

               SS==YY//((RR++22))

           The 2 in the equation denotes two survivor spaces. The larger the value specified as the initial survivor space ratio, the smaller the initial survivor space size.

           By default, the initial survivor space ratio is set to 8. If the default value for the young generation space size is used (2 MB), the initial size of the survivor
           space will be 0.2 MB.

           The following example shows how to set the initial survivor space ratio to 4:

               --XXXX::IInniittiiaallSSuurrvviivvoorrRRaattiioo==44

       -XX:InitiatingHeapOccupancyPercent=_p_e_r_c_e_n_t
           Sets the percentage of the heap occupancy (0 to 100) at which to start a concurrent GC cycle. It is used by garbage collectors that trigger a concurrent GC cycle based
           on the occupancy of the entire heap, not just one of the generations (for example, the G1 garbage collector).

           By default, the initiating value is set to 45%. A value of 0 implies nonstop GC cycles. The following example shows how to set the initiating heap occupancy to 75%:

               --XXXX::IInniittiiaattiinnggHHeeaappOOccccuuppaannccyyPPeerrcceenntt==7755

       -XX:MaxGCPauseMillis=_t_i_m_e
           Sets a target for the maximum GC pause time (in milliseconds). This is a soft goal, and the JVM will make its best effort to achieve it. By default, there is no maximum
           pause time value.

           The following example shows how to set the maximum target pause time to 500 ms:

               --XXXX::MMaaxxGGCCPPaauusseeMMiilllliiss==550000

       -XX:MaxHeapSize=_s_i_z_e
           Sets the maximum size (in byes) of the memory allocation pool. This value must be a multiple of 1024 and greater than 2 MB. Append the letter kk or KK to indicate
           kilobytes, mm or MM to indicate megabytes, gg or GG to indicate gigabytes. The default value is chosen at runtime based on system configuration. For server deployments,
           --XXXX::IInniittiiaallHHeeaappSSiizzee and --XXXX::MMaaxxHHeeaappSSiizzee are often set to the same value. See the section "Ergonomics" in _J_a_v_a _S_E _H_o_t_S_p_o_t _V_i_r_t_u_a_l _M_a_c_h_i_n_e _G_a_r_b_a_g_e _C_o_l_l_e_c_t_i_o_n _T_u_n_i_n_g _G_u_i_d_e
           at http://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/index.html.

           The following examples show how to set the maximum allowed size of allocated memory to 80 MB using various units:

               --XXXX::MMaaxxHHeeaappSSiizzee==8833888866008800
               --XXXX::MMaaxxHHeeaappSSiizzee==8811992200kk
               --XXXX::MMaaxxHHeeaappSSiizzee==8800mm

           On Oracle Solaris 7 and Oracle Solaris 8 SPARC platforms, the upper limit for this value is approximately 4,000 MB minus overhead amounts. On Oracle Solaris 2.6 and x86
           platforms, the upper limit is approximately 2,000 MB minus overhead amounts. On Linux platforms, the upper limit is approximately 2,000 MB minus overhead amounts.

           The --XXXX::MMaaxxHHeeaappSSiizzee option is equivalent to --XXmmxx.

       -XX:MaxHeapFreeRatio=_p_e_r_c_e_n_t
           Sets the maximum allowed percentage of free heap space (0 to 100) after a GC event. If free heap space expands above this value, then the heap will be shrunk. By
           default, this value is set to 70%.

           The following example shows how to set the maximum free heap ratio to 75%:

               --XXXX::MMaaxxHHeeaappFFrreeeeRRaattiioo==7755

       -XX:MaxMetaspaceSize=_s_i_z_e
           Sets the maximum amount of native memory that can be allocated for class metadata. By default, the size is not limited. The amount of metadata for an application
           depends on the application itself, other running applications, and the amount of memory available on the system.

           The following example shows how to set the maximum class metadata size to 256 MB:

               --XXXX::MMaaxxMMeettaassppaacceeSSiizzee==225566mm

       -XX:MaxNewSize=_s_i_z_e
           Sets the maximum size (in bytes) of the heap for the young generation (nursery). The default value is set ergonomically.

       -XX:MaxTenuringThreshold=_t_h_r_e_s_h_o_l_d
           Sets the maximum tenuring threshold for use in adaptive GC sizing. The largest value is 15. The default value is 15 for the parallel (throughput) collector, and 6 for
           the CMS collector.

           The following example shows how to set the maximum tenuring threshold to 10:

               --XXXX::MMaaxxTTeennuurriinnggTThhrreesshhoolldd==1100

       -XX:MetaspaceSize=_s_i_z_e
           Sets the size of the allocated class metadata space that will trigger a garbage collection the first time it is exceeded. This threshold for a garbage collection is
           increased or decreased depending on the amount of metadata used. The default size depends on the platform.

       -XX:MinHeapFreeRatio=_p_e_r_c_e_n_t
           Sets the minimum allowed percentage of free heap space (0 to 100) after a GC event. If free heap space falls below this value, then the heap will be expanded. By
           default, this value is set to 40%.

           The following example shows how to set the minimum free heap ratio to 25%:

               --XXXX::MMiinnHHeeaappFFrreeeeRRaattiioo==2255

       -XX:NewRatio=_r_a_t_i_o
           Sets the ratio between young and old generation sizes. By default, this option is set to 2. The following example shows how to set the young/old ratio to 1:

               --XXXX::NNeewwRRaattiioo==11

       -XX:NewSize=_s_i_z_e
           Sets the initial size (in bytes) of the heap for the young generation (nursery). Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to
           indicate gigabytes.

           The young generation region of the heap is used for new objects. GC is performed in this region more often than in other regions. If the size for the young generation
           is too low, then a large number of minor GCs will be performed. If the size is too high, then only full GCs will be performed, which can take a long time to complete.
           Oracle recommends that you keep the size for the young generation between a half and a quarter of the overall heap size.

           The following examples show how to set the initial size of young generation to 256 MB using various units:

               --XXXX::NNeewwSSiizzee==225566mm
               --XXXX::NNeewwSSiizzee==226622114444kk
               --XXXX::NNeewwSSiizzee==226688443355445566

           The --XXXX::NNeewwSSiizzee option is equivalent to --XXmmnn.

       -XX:ParallelGCThreads=_t_h_r_e_a_d_s
           Sets the number of threads used for parallel garbage collection in the young and old generations. The default value depends on the number of CPUs available to the JVM.

           For example, to set the number of threads for parallel GC to 2, specify the following option:

               --XXXX::PPaarraalllleellGGCCTThhrreeaaddss==22

       -XX:+ParallelRefProcEnabled
           Enables parallel reference processing. By default, this option is disabled.

       -XX:+PrintAdaptiveSizePolicy
           Enables printing of information about adaptive generation sizing. By default, this option is disabled.

       -XX:+PrintGC
           Enables printing of messages at every GC. By default, this option is disabled.

       -XX:+PrintGCApplicationConcurrentTime
           Enables printing of how much time elapsed since the last pause (for example, a GC pause). By default, this option is disabled.

       -XX:+PrintGCApplicationStoppedTime
           Enables printing of how much time the pause (for example, a GC pause) lasted. By default, this option is disabled.

       -XX:+PrintGCDateStamps
           Enables printing of a date stamp at every GC. By default, this option is disabled.

       -XX:+PrintGCDetails
           Enables printing of detailed messages at every GC. By default, this option is disabled.

       -XX:+PrintGCTaskTimeStamps
           Enables printing of time stamps for every individual GC worker thread task. By default, this option is disabled.

       -XX:+PrintGCTimeStamps
           Enables printing of time stamps at every GC. By default, this option is disabled.

       -XX:+PrintStringDeduplicationStatistics
           Prints detailed deduplication statistics. By default, this option is disabled. See the --XXXX::++UUsseeSSttrriinnggDDeedduupplliiccaattiioonn option.

       -XX:+PrintTenuringDistribution
           Enables printing of tenuring age information. The following is an example of the output:

               DDeessiirreedd ssuurrvviivvoorr ssiizzee 4488228866992244 bbyytteess,, nneeww tthhrreesshhoolldd 1100 ((mmaaxx 1100))
               -- aaggee 11:: 2288999922002244 bbyytteess,, 2288999922002244 ttoottaall
               -- aaggee 22:: 11336666886644 bbyytteess,, 3300335588888888 ttoottaall
               -- aaggee 33:: 11442255991122 bbyytteess,, 3311778844880000 ttoottaall
               ......

           Age 1 objects are the youngest survivors (they were created after the previous scavenge, survived the latest scavenge, and moved from eden to survivor space). Age 2
           objects have survived two scavenges (during the second scavenge they were copied from one survivor space to the next). And so on.

           In the preceding example, 28 992 024 bytes survived one scavenge and were copied from eden to survivor space, 1 366 864 bytes are occupied by age 2 objects, etc. The
           third value in each row is the cumulative size of objects of age n or less.

           By default, this option is disabled.

       -XX:+ScavengeBeforeFullGC
           Enables GC of the young generation before each full GC. This option is enabled by default. Oracle recommends that you _d_o _n_o_t disable it, because scavenging the young
           generation before a full GC can reduce the number of objects reachable from the old generation space into the young generation space. To disable GC of the young
           generation before each full GC, specify --XXXX::--SSccaavveennggeeBBeeffoorreeFFuullllGGCC.

       -XX:SoftRefLRUPolicyMSPerMB=_t_i_m_e
           Sets the amount of time (in milliseconds) a softly reachable object is kept active on the heap after the last time it was referenced. The default value is one second of
           lifetime per free megabyte in the heap. The --XXXX::SSooffttRReeffLLRRUUPPoolliiccyyMMSSPPeerrMMBB option accepts integer values representing milliseconds per one megabyte of the current heap
           size (for Java HotSpot Client VM) or the maximum possible heap size (for Java HotSpot Server VM). This difference means that the Client VM tends to flush soft
           references rather than grow the heap, whereas the Server VM tends to grow the heap rather than flush soft references. In the latter case, the value of the --XXmmxx option
           has a significant effect on how quickly soft references are garbage collected.

           The following example shows how to set the value to 2.5 seconds:

               --XXXX::SSooffttRReeffLLRRUUPPoolliiccyyMMSSPPeerrMMBB==22550000

       -XX:StringDeduplicationAgeThreshold=_t_h_r_e_s_h_o_l_d
           SSttrriinngg objects reaching the specified age are considered candidates for deduplication. An object's age is a measure of how many times it has survived garbage
           collection. This is sometimes referred to as tenuring; see the --XXXX::++PPrriinnttTTeennuurriinnggDDiissttrriibbuuttiioonn option. Note that SSttrriinngg objects that are promoted to an old heap region
           before this age has been reached are always considered candidates for deduplication. The default value for this option is 33. See the --XXXX::++UUsseeSSttrriinnggDDeedduupplliiccaattiioonn option.

       -XX:SurvivorRatio=_r_a_t_i_o
           Sets the ratio between eden space size and survivor space size. By default, this option is set to 8. The following example shows how to set the eden/survivor space
           ratio to 4:

               --XXXX::SSuurrvviivvoorrRRaattiioo==44

       -XX:TargetSurvivorRatio=_p_e_r_c_e_n_t
           Sets the desired percentage of survivor space (0 to 100) used after young garbage collection. By default, this option is set to 50%.

           The following example shows how to set the target survivor space ratio to 30%:

               --XXXX::TTaarrggeettSSuurrvviivvoorrRRaattiioo==3300

       -XX:TLABSize=_s_i_z_e
           Sets the initial size (in bytes) of a thread-local allocation buffer (TLAB). Append the letter kk or KK to indicate kilobytes, mm or MM to indicate megabytes, gg or GG to
           indicate gigabytes. If this option is set to 0, then the JVM chooses the initial size automatically.

           The following example shows how to set the initial TLAB size to 512 KB:

               --XXXX::TTLLAABBSSiizzee==551122kk

       -XX:+UseAdaptiveSizePolicy
           Enables the use of adaptive generation sizing. This option is enabled by default. To disable adaptive generation sizing, specify --XXXX::--UUsseeAAddaappttiivveeSSiizzeePPoolliiccyy and set the
           size of the memory allocation pool explicitly (see the --XXXX::SSuurrvviivvoorrRRaattiioo option).

       -XX:+UseCMSInitiatingOccupancyOnly
           Enables the use of the occupancy value as the only criterion for initiating the CMS collector. By default, this option is disabled and other criteria may be used.

       -XX:+UseConcMarkSweepGC
           Enables the use of the CMS garbage collector for the old generation. Oracle recommends that you use the CMS garbage collector when application latency requirements
           cannot be met by the throughput (--XXXX::++UUsseePPaarraalllleellGGCC) garbage collector. The G1 garbage collector (--XXXX::++UUsseeGG11GGCC) is another alternative.

           By default, this option is disabled and the collector is chosen automatically based on the configuration of the machine and type of the JVM. When this option is
           enabled, the --XXXX::++UUsseePPaarrNNeewwGGCC option is automatically set and you should not disable it, because the following combination of options has been deprecated in JDK 8:
           --XXXX::++UUsseeCCoonnccMMaarrkkSSwweeeeppGGCC --XXXX::--UUsseePPaarrNNeewwGGCC.

       -XX:+UseG1GC
           Enables the use of the garbage-first (G1) garbage collector. It is a server-style garbage collector, targeted for multiprocessor machines with a large amount of RAM. It
           meets GC pause time goals with high probability, while maintaining good throughput. The G1 collector is recommended for applications requiring large heaps (sizes of
           around 6 GB or larger) with limited GC latency requirements (stable and predictable pause time below 0.5 seconds).

           By default, this option is disabled and the collector is chosen automatically based on the configuration of the machine and type of the JVM.

       -XX:+UseGCOverheadLimit
           Enables the use of a policy that limits the proportion of time spent by the JVM on GC before an OOuuttOOffMMeemmoorryyEErrrroorr exception is thrown. This option is enabled, by default
           and the parallel GC will throw an OOuuttOOffMMeemmoorryyEErrrroorr if more than 98% of the total time is spent on garbage collection and less than 2% of the heap is recovered. When the
           heap is small, this feature can be used to prevent applications from running for long periods of time with little or no progress. To disable this option, specify
           --XXXX::--UUsseeGGCCOOvveerrhheeaaddLLiimmiitt.

       -XX:+UseNUMA
           Enables performance optimization of an application on a machine with nonuniform memory architecture (NUMA) by increasing the application's use of lower latency memory.
           By default, this option is disabled and no optimization for NUMA is made. The option is only available when the parallel garbage collector is used (--XXXX::++UUsseePPaarraalllleellGGCC).

       -XX:+UseParallelGC
           Enables the use of the parallel scavenge garbage collector (also known as the throughput collector) to improve the performance of your application by leveraging
           multiple processors.

           By default, this option is disabled and the collector is chosen automatically based on the configuration of the machine and type of the JVM. If it is enabled, then the
           --XXXX::++UUsseePPaarraalllleellOOllddGGCC option is automatically enabled, unless you explicitly disable it.

       -XX:+UseParallelOldGC
           Enables the use of the parallel garbage collector for full GCs. By default, this option is disabled. Enabling it automatically enables the --XXXX::++UUsseePPaarraalllleellGGCC option.

       -XX:+UseParNewGC
           Enables the use of parallel threads for collection in the young generation. By default, this option is disabled. It is automatically enabled when you set the
           --XXXX::++UUsseeCCoonnccMMaarrkkSSwweeeeppGGCC option. Using the --XXXX::++UUsseePPaarrNNeewwGGCC option without the --XXXX::++UUsseeCCoonnccMMaarrkkSSwweeeeppGGCC option was deprecated in JDK 8.

       -XX:+UseSerialGC
           Enables the use of the serial garbage collector. This is generally the best choice for small and simple applications that do not require any special functionality from
           garbage collection. By default, this option is disabled and the collector is chosen automatically based on the configuration of the machine and type of the JVM.

       -XX:+UseSHM
           On Linux, enables the JVM to use shared memory to setup large pages.

           For more information, see "Large Pages".

       -XX:+UseStringDeduplication
           Enables string deduplication. By default, this option is disabled. To use this option, you must enable the garbage-first (G1) garbage collector. See the --XXXX::++UUsseeGG11GGCC
           option.

           _S_t_r_i_n_g _d_e_d_u_p_l_i_c_a_t_i_o_n reduces the memory footprint of SSttrriinngg objects on the Java heap by taking advantage of the fact that many SSttrriinngg objects are identical. Instead of
           each SSttrriinngg object pointing to its own character array, identical SSttrriinngg objects can point to and share the same character array.

       -XX:+UseTLAB
           Enables the use of thread-local allocation blocks (TLABs) in the young generation space. This option is enabled by default. To disable the use of TLABs, specify
           --XXXX::--UUsseeTTLLAABB.

   DDeepprreeccaatteedd aanndd RReemmoovveedd OOppttiioonnss
       These options were included in the previous release, but have since been considered unnecessary.

       -Xincgc
           Enables incremental garbage collection. This option was deprecated in JDK 8 with no replacement.

       -Xrun_l_i_b_n_a_m_e
           Loads the specified debugging/profiling library. This option was superseded by the --aaggeennttlliibb option.

       -XX:CMSIncrementalDutyCycle=_p_e_r_c_e_n_t
           Sets the percentage of time (0 to 100) between minor collections that the concurrent collector is allowed to run. This option was deprecated in JDK 8 with no
           replacement, following the deprecation of the --XXXX::++CCMMSSIInnccrreemmeennttaallMMooddee option.

       -XX:CMSIncrementalDutyCycleMin=_p_e_r_c_e_n_t
           Sets the percentage of time (0 to 100) between minor collections that is the lower bound for the duty cycle when --XXXX::++CCMMSSIInnccrreemmeennttaallPPaacciinngg is enabled. This option was
           deprecated in JDK 8 with no replacement, following the deprecation of the --XXXX::++CCMMSSIInnccrreemmeennttaallMMooddee option.

       -XX:+CMSIncrementalMode
           Enables the incremental mode for the CMS collector. This option was deprecated in JDK 8 with no replacement, along with other options that start with CCMMSSIInnccrreemmeennttaall.

       -XX:CMSIncrementalOffset=_p_e_r_c_e_n_t
           Sets the percentage of time (0 to 100) by which the incremental mode duty cycle is shifted to the right within the period between minor collections. This option was
           deprecated in JDK 8 with no replacement, following the deprecation of the --XXXX::++CCMMSSIInnccrreemmeennttaallMMooddee option.

       -XX:+CMSIncrementalPacing
           Enables automatic adjustment of the incremental mode duty cycle based on statistics collected while the JVM is running. This option was deprecated in JDK 8 with no
           replacement, following the deprecation of the --XXXX::++CCMMSSIInnccrreemmeennttaallMMooddee option.

       -XX:CMSIncrementalSafetyFactor=_p_e_r_c_e_n_t
           Sets the percentage of time (0 to 100) used to add conservatism when computing the duty cycle. This option was deprecated in JDK 8 with no replacement, following the
           deprecation of the --XXXX::++CCMMSSIInnccrreemmeennttaallMMooddee option.

       -XX:CMSInitiatingPermOccupancyFraction=_p_e_r_c_e_n_t
           Sets the percentage of the permanent generation occupancy (0 to 100) at which to start a GC. This option was deprecated in JDK 8 with no replacement.

       -XX:MaxPermSize=_s_i_z_e
           Sets the maximum permanent generation space size (in bytes). This option was deprecated in JDK 8, and superseded by the --XXXX::MMaaxxMMeettaassppaacceeSSiizzee option.

       -XX:PermSize=_s_i_z_e
           Sets the space (in bytes) allocated to the permanent generation that triggers a garbage collection if it is exceeded. This option was deprecated un JDK 8, and
           superseded by the --XXXX::MMeettaassppaacceeSSiizzee option.

       -XX:+UseSplitVerifier
           Enables splitting of the verification process. By default, this option was enabled in the previous releases, and verification was split into two phases: type
           referencing (performed by the compiler) and type checking (performed by the JVM runtime). This option was deprecated in JDK 8, and verification is now split by default
           without a way to disable it.

       -XX:+UseStringCache
           Enables caching of commonly allocated strings. This option was removed from JDK 8 with no replacement.

PPEERRFFOORRMMAANNCCEE TTUUNNIINNGG EEXXAAMMPPLLEESS
       The following examples show how to use experimental tuning flags to either optimize throughput or to provide lower response time.

       EExxaammppllee 11 Tuning for Higher Throughput

               jjaavvaa --dd6644 --sseerrvveerr --XXXX::++AAggggrreessssiivveeOOppttss --XXXX::++UUsseeLLaarrggeePPaaggeess --XXmmnn1100gg  --XXmmss2266gg --XXmmxx2266gg

       EExxaammppllee 22 Tuning for Lower Response Time

               jjaavvaa --dd6644 --XXXX::++UUsseeGG11GGCC --XXmmss2266gg XXmmxx2266gg --XXXX::MMaaxxGGCCPPaauusseeMMiilllliiss==550000 --XXXX::++PPrriinnttGGCCTTiimmeeSSttaammpp

LLAARRGGEE PPAAGGEESS
       Also known as huge pages, large pages are memory pages that are significantly larger than the standard memory page size (which varies depending on the processor and
       operating system). Large pages optimize processor Translation-Lookaside Buffers.

       A Translation-Lookaside Buffer (TLB) is a page translation cache that holds the most-recently used virtual-to-physical address translations. TLB is a scarce system
       resource. A TLB miss can be costly as the processor must then read from the hierarchical page table, which may require multiple memory accesses. By using a larger memory
       page size, a single TLB entry can represent a larger memory range. There will be less pressure on TLB, and memory-intensive applications may have better performance.

       However, large pages page memory can negatively affect system performance. For example, when a large mount of memory is pinned by an application, it may create a shortage
       of regular memory and cause excessive paging in other applications and slow down the entire system. Also, a system that has been up for a long time could produce excessive
       fragmentation, which could make it impossible to reserve enough large page memory. When this happens, either the OS or JVM reverts to using regular pages.

   LLaarrggee PPaaggeess SSuuppppoorrtt
       Solaris and Linux support large pages.

       SSoollaarriiss
           Solaris 9 and later include Multiple Page Size Support (MPSS); no additional configuration is necessary. See
           http://www.oracle.com/technetwork/server-storage/solaris10/overview/solaris9-features-scalability-135663.html.

       LLiinnuuxx
           The 2.6 kernel supports large pages. Some vendors have backported the code to their 2.4-based releases. To check if your system can support large page memory, try the
           following:

               ## ccaatt //pprroocc//mmeemmiinnffoo || ggrreepp HHuuggee
               HHuuggeePPaaggeess__TToottaall:: 00
               HHuuggeePPaaggeess__FFrreeee:: 00
               HHuuggeeppaaggeessiizzee:: 22004488 kkBB

           If the output shows the three "Huge" variables, then your system can support large page memory but it needs to be configured. If the command prints nothing, then your
           system does not support large pages. To configure the system to use large page memory, login as rroooott, and then follow these steps:

            1. If you are using the option --XXXX::++UUsseeSSHHMM (instead of --XXXX::++UUsseeHHuuggeeTTLLBBFFSS), then increase the SSHHMMMMAAXX value. It must be larger than the Java heap size. On a system with
               4 GB of physical RAM (or less), the following will make all the memory sharable:

                   ## eecchhoo 44229944996677229955 >> //pprroocc//ssyyss//kkeerrnneell//sshhmmmmaaxx

            2. If you are using the option --XXXX::++UUsseeSSHHMM or --XXXX::++UUsseeHHuuggeeTTLLBBFFSS, then specify the number of large pages. In the following example, 3 GB of a 4 GB system are reserved
               for large pages (assuming a large page size of 2048kB, then 3 GB = 3 * 1024 MB = 3072 MB = 3072 * 1024 kB = 3145728 kB and 3145728 kB / 2048 kB = 1536):

                   ## eecchhoo 11553366 >> //pprroocc//ssyyss//vvmm//nnrr__hhuuggeeppaaggeess

               NNoottee
               ┌──────────────────────────────────────────────────────────────────────────────────────────┐
               │                                                                                          │
               │               ·   Note that the values contained in //pprroocc will reset after you reboot    │
               │                   your system, so may want to set them in an initialization script (for  │
               │                   example, rrcc..llooccaall or ssyyssccttll..ccoonnff).                                     │
               │                                                                                          │
               │               ·   If you configure (or resize) the OS kernel parameters                  │
               │                   //pprroocc//ssyyss//kkeerrnneell//sshhmmmmaaxx or //pprroocc//ssyyss//vvmm//nnrr__hhuuggeeppaaggeess, Java processes   │
               │                   may allocate large pages for areas in addition to the Java heap. These │
               │                   steps can allocate large pages for the following areas:                │
               │                                                                                          │
               │                   ·   Java heap                                                          │
               │                                                                                          │
               │                   ·   Code cache                                                         │
               │                                                                                          │
               │                   ·   The marking bitmap data structure for the parallel GC              │
               │                                                                                          │
               │                   Consequently, if you configure the nnrr__hhuuggeeppaaggeess parameter to the size  │
               │                   of the Java heap, then the JVM can fail in allocating the code cache   │
               │                   areas on large pages because these areas are quite large in size.      │
               └──────────────────────────────────────────────────────────────────────────────────────────┘

EEXXIITT SSTTAATTUUSS
       The following exit values are typically returned by the launcher when the launcher is called with the wrong arguments, serious errors, or exceptions thrown by the JVM.
       However, a Java application may choose to return any value by using the API call SSyysstteemm..eexxiitt((eexxiittVVaalluuee)). The values are:

       ·   00: Successful completion

       ·   >>00: An error occurred

SSEEEE AALLSSOO
       ·   javac(1)

       ·   jdb(1)

       ·   javah(1)

       ·   jar(1)

       ·   jstat(1)

JDK 8                                                                              03 March 2015                                                                            java(1)
