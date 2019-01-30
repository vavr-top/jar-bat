echo workspaces_path %1
echo publish-path %2
echo META-INF %3
echo jarname %4

copy /y %1\Web\META-INF\%3\log4j.properties %1\Web\WEB-INF\classes\
echo %1\Web\WEB-INF\classes
jar -cvfm %2\%4  %1\Web\META-INF\%3\MANIFEST.MF -C %1\Web\WEB-INF\classes .
copy /y %1\resources\log4j.properties %1\Web\WEB-INF\classes\
