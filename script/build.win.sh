rm ./build -rf
echo "moonc -t ./build ./src" | cmd
mv ./build/src/* ./build
rm ./build/src -rf