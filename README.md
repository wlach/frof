# About

frof is a convenience script to make generating Gecko SPS profile traces
easier with the Fennec mobile browser. It automates much of the grunt work
you'd normally have to do manually.

For more information on the Gecko Profiler, see: https://developer.mozilla.org/en-US/docs/Performance/Profiling_with_the_Built-in_Profiler

# Installation

* Make arm-eabi-addr2line from the Android NDK visible in your path. In my
  case, I just created a symbolic link from its location in the NDK to a file
  in my home's bin directory:

    ln -s /home/wlach/opt/android-ndk-r6/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86/bin/arm-linux-androideabi-addr2line $HOME/bin/arm-eabi-addr2line

* Then, simply run the 'bootstrap.sh' script from the toplevel directory.

# Usage

* Shut down the running instance of fennec on your phone (if there is one).
* From toplevel, activate the virtualenv from the console:

    source bin/activate

* Run frof.py with arguments corresponding to appname, url, and profile file.
  For example:

    frof org.mozilla.fennec http://wrla.ch profile.zip

Interact with the application as normal, then press enter when you're ready
to stop profiling. You will need to wait a while the profile is taken off
the device and processed.

* When the above process is finished, unzip the symbolicated profile from the
  archive:

    unzip profile.zip

* Open up an instance of the SPS profiler (e.g.
  http://people.mozilla.org/~bgirard/cleopatra) and upload the unpacked
  `symbolicated_profile.txt` file.
