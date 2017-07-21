cd ./build
zip -9 -r "secua-"$(sh ../VERSION)".zip" ./secua/*
tar -zcvf "secua-"$(sh ../VERSION)".tar.gz" ./secua
mv "secua-"$(sh ../VERSION)".zip" ..
mv "secua-"$(sh ../VERSION)".tar.gz" ..