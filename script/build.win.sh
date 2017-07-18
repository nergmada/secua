rm ./build -rf
rm ./secua-build -rf
echo "moonc -t ./build ./src" | cmd
mv ./build/src/* ./build
mv ./build/bustedconfig.lua ./build/.busted
rm ./build/src -rf