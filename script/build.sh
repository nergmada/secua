rm ./build -rf
rm ./secua-build -rf
moonc -t ./build ./src
mv ./build/src/* ./build
mv ./build/bustedconfig.lua ./build/.busted
rm ./build/src -rf