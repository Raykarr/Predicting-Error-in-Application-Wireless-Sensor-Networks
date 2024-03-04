# Wireless Sensor Networks (WSNs) ALE Prediction

## Overview
This project involves the application of supervised machine learning algorithms to predict the Average Localization Error (ALE) in Wireless Sensor Networks (WSNs). WSNs are crucial for data collection in remote areas, and predicting ALE is essential for enhancing accuracy and efficiency.

## Dataset
The dataset for predicting ALE in WSNs contains 107 rows and 5 columns:
- anchor_ratio
- node_density
- trans_range
- iterations
- ale (Average Localization Error)

This dataset is obtained from UCI and serves as a valuable resource for the development and evaluation of ALE prediction in WSNs.

## Objective
The primary objective of this project is to forecast ALE in WSNs to improve accuracy, manage resources efficiently, enhance network performance, aid in fault detection and repair, and maintain scalability as WSNs grow in size and complexity.

## WSN Overview
Wireless Sensor Networks are networks of distributed sensors that play a critical role in various applications such as environmental monitoring, precision agriculture, and industrial automation. Achieving accurate localization is paramount.

## Motivation
The need for error prediction in WSNs stems from the necessity to preemptively identify and address potential issues, enhancing the performance and reliability of the networks.

## Algorithms Used
- Random Forest Regressor
- Exploratory Data Analysis (EDA)

## Results
The project has shown significant results in predicting ALE with supervised machine learning:
- Training Set Evaluation Metrics
  - MSE: 0.25
  - R2: 0.34
  - EVS: 0.34
- Testing Set Evaluation Metrics
  - MSE: 0.02
  - R2: 0.82
  - EVS: 0.82

## Installation and Usage
To use the code provided in this repository, you need to have R installed along with the following libraries:
- ggplot2
- stats
- dplyr
- tidyr
- scatterplot3d
- randomForest
- caret
- randomForestSRC
- party

After installing R and the necessary libraries, you can run the scripts provided to perform the analysis and model training.

## Contributing
Contributions to this project are welcome. Please open an issue first to discuss what you would like to change or submit a pull request for review.

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Contact
For any additional questions or comments, please contact the repository owner.

## Acknowledgements
Special thanks to the UCI repository for providing the dataset and to all the contributors to this project.
