# Canon 6D Datasets For Learning-to-See-in-the-Dark

The goal of this project is to present two new datasets that seek to expand the capability of the [Learning to See in the Dark](https://github.com/cchen156/Learning-to-See-in-the-Dark) Low-light enhancement CNN for the Canon 6D DSLR, and explore how the network performs when modified in various ways, both pruning it and making it deeper.

The original paper Learning to See in the Dark was published in CVPR 2018, by [Chen Chen](http://cchen156.web.engr.illinois.edu/), [Qifeng Chen](http://cqf.io/), [Jia Xu](http://pages.cs.wisc.edu/~jiaxu/), and [Vladlen Koltun](http://vladlen.info/).

### Requirements
Required python (version 2.7) libraries: Tensorflow (>=1.1) + Scipy + Numpy + Rawpy, as per original release of [Learning to See in the Dark](https://github.com/cchen156/Learning-to-See-in-the-Dark).

Tested in Ubuntu + Intel Xeon CPU + Nvidia 1080 Ti GPU, with 64 GB RAM.

### Dataset

We provide a dataset for training and testing for the Canon 6D, taken at a constant ISO 200. Download [Canon 6D dataset from Google Drive](https://drive.google.com/file/d/1hpQ_lMqpIDi0ptbbDsp4YRgcoEvEsvDN).

We also provide a dataset for training and testing for the Canon 6D, taken at a constant ISO of 12600 in order to push the low light capability of the sensor. Download [Canon 6D ISO 12600 dataset from Google Drive](https://drive.google.com/file/d/1dfxgxyICt3ycl3366h37dnWdLO1HqjFu)

The pretrained models for the Canon 6D: normal SID network trained on ISO 200 dataset, normal SID network trained on ISO 12600 dataset, 3 modified SID network variants trained with ISO 200 dataset, and author's original Sony trained model for comparison. Download [pretrained models from Google Drive](https://drive.google.com/open?id=104X-_eMb_T3Jem1JRdWh0c8qR2DBjhRS)

The file name contains the image information: the first value is 0 for training, 1 for testing, following up a unique 4 digit value for identification. The final values in the string is the exposure length in seconds. 

### Testing
1. Clone this repository.
2. Download the pretrained models from Google Drive.
3. Run "python test_Canon.py" to run the ISO 200 testing dataset through the pretrained ISO 200 model. 
4. Run other training scripts similarly. 
5. On our training hardware, each image was processed in about 1 second. On a modern laptop using the CPU it may take minutes.

### Training Models
1. To train a model, run "python train_type.py". The result and model iis saved in the folder named result_type, where type is the unique name of the training script.

On our Training hardware, the training of the original network took several hours. It would take several days to train using just a CPU.
