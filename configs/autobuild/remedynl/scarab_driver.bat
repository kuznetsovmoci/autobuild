cd ..\..\..\
c:\cygwin\bin\svn up
cd configs\autobuild\remedynl

perl C:\ACE\autobuild\autobuild.pl scarab_cidlcstatic.xml
perl C:\ACE\autobuild\autobuild.pl scarab_vc8_version.xml
perl C:\ACE\autobuild\autobuild.pl scarab_vc8.xml
perl C:\ACE\autobuild\autobuild.pl scarab_bcb6ddu.xml
perl C:\ACE\autobuild\autobuild.pl scarab_bcb6dd.xml
perl C:\ACE\autobuild\autobuild.pl scarab_bcb6dr.xml
call scarab.bat
