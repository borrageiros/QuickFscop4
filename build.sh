#!/bin/bash -ex
# sudo apt-get install gcc-mingw-w64 nsis

if [[ "$1" == "release" ]]; then
  mkdir -p bin/32 bin/64
  cp F4ST.ini bin/32/
  cp F4ST.ini bin/64/

  i686-w64-mingw32-windres -o f4st.o include/app.rc
  i686-w64-mingw32-gcc -o bin/32/F4ST.exe f4st.c f4st.o -mwindows -lshlwapi -lpsapi -O2 -s -fstack-protector-all -static -Wl,--dynamicbase,--nxcompat -Wp,-D_FORTIFY_SOURCE=2

  x86_64-w64-mingw32-windres -o f4st.o include/app.rc
  x86_64-w64-mingw32-gcc -o bin/64/F4ST.exe f4st.c f4st.o -mwindows -lshlwapi -lpsapi -O2 -s -fstack-protector-all -static -Wl,--dynamicbase,--nxcompat,--high-entropy-va -Wp,-D_FORTIFY_SOURCE=2

  makensis -V2 -Dx64 installer.nsi
else
  x86_64-w64-mingw32-windres -o f4st.o include/app.rc
  x86_64-w64-mingw32-gcc -o F4ST.exe f4st.c f4st.o -mwindows -lshlwapi -lpsapi -O2 -g -DDEBUG
fi
