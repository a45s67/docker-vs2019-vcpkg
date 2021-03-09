cd chocolatey
docker build -t chocolatey .
cd ../vcpkg_dir
docker build -t vcpkg_dir .
cd ../vs2019
docker build -t vs2019 .

cd ../vcpkg
docker build -t vcpkg .