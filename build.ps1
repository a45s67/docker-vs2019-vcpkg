cd chocolatey
docker build -t chocolatey .
cd ../vs2019
docker build -t vs2019 .
cd ../vcpkg_dir
docker build -t vcpkg_dir .
