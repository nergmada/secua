rm ./build -rf
rm ./secua-build -rf
echo "moonc -t ./secua-build ./src" | cmd
mv ./secua-build/src/* ./secua-build
rm ./secua-build/src -rf