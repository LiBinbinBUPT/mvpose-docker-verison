# mvpose: docker #

* [Fast and Robust Multi-Person 3D Pose Estimation and Tracking From Multiple Views](https://openaccess.thecvf.com/content_CVPR_2019/papers/Dong_Fast_and_Robust_Multi-Person_3D_Pose_Estimation_From_Multiple_Views_CVPR_2019_paper.pdf)  
* Junting Dong, Wen Jiang, Qixing Huang, Hujun Bao, Xiaowei Zhou CVPR 2019  
The docker is make to complish the paper: Fast and Robust Multi-Person 3D Pose Estimation and Tracking From Multiple Views  

## Installation
* Download the git code form the author's github
```linux
git clone https://github.com/zju3dv/mvpose.git 
```
* Download the file in the currrent github
```linux
git clone https://github.com/LiBinbinBUPT/mvpose-docker-verison.git
```
* Copy the Dockerfile and apt-sources.list to mvpose
```linux
sudo cp /mvpose-docker-version/* /mvpose
```
* Come to the mvpose directory and build the images for mvpose
```linux
cd mvpose
docker build -f Dockerfile -t mvpose .
```
* Build the docker based on the images using 11g GPU memory and go in docker
```linux
docker  run -it --gpus=all --name mvpose --shm-size 11g -v path/to/mvpose:/mvpose mvpose /bin/bash
docker exec -it mvpose /bin/bash
```
* Install [python3.6.3](https://www.python.org/downloads/release/python-363/) for your docker and install pip and some libs
```linux
apt-get install -y python3-pip && python3.6 -m pip install --upgrade pip
apt-get update && apt-get install -y libsm6 libxext6 libxrender-dev
```
* Download tcl8.6.8 and tk8.6.8 from [tcl, tk](http://www.tcl.tk/software/tcltk/download.html) and configure
* Install the requirements
```python
python3.6 -m pip install ipython sklearn Pillow==6.1
python3 -m pip install -r requirements.txt 
```
* Compile the `backend/tf_cpn/lib` and `backend/light_head_rcnn/lib`
```linux
cd mvpose/backend/tf_cpn/lib/
make
cd ./lib_kernel/lib_nms
bash compile.sh
```
```linux
cd mvpose/backend/light_head_rcnn/lib/
bash make.sh
```
* Compile the pictorial function for acceleration
```linux
cd mvpose/src/m_lib/
python setup.py build_ext --inplace
```
## Prepare the model and datasets


