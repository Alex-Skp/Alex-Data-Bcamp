
Cookies cookies everywhere and not a cookie to eat!

In this [git folder](https://github.com/student-IH-labs-and-stuff/BER-DAFT-MAR21/tree/main/Labs/Cookies_Lab) you will find 3 csv files about cookies. These rows are gathered via an extended experiment with making batches of cookies. You will also find a jupyter notebook. 

**Task 1) Download and review each csv file in tableau, excel or python - as you can see each batch of cookies varies in things such as sugar, flour, bake temp.** 

To explain the three different files and how they will be used in the notebook :

- Cookies: The training file including the labels of cookies quality. This is the dataset used to build a model that can predict the quality of a batch of cookies
- Cookies_validate: a dataset without the label of cookies quality - this is used to predict the label quality
- Cookies_test: The dataset with the real quality label of the validate set. This data is used to calculate the accuracy of any model run

**Task 2 ) run the pre prepared notebook which includes some EDA steps, wrangling and a simple supervised model against the provided cookie data sets. This gives us an initial accuracy RMSE (the lower the better)**

**Task 3) As you review the notebook, you might find it helpful for your own learning to add annotations about what is being done at each stage, and add additional cells, functions, charts etc which you feel could be useful** 

**Task 4) Add a random forest regressor model to try to get a more accurate score.** You can follow this [tutorial](https://www.geeksforgeeks.org/random-forest-regression-in-python/) , [this one](https://towardsdatascience.com/machine-learning-basics-random-forest-regression-be3e1e3bb91a) or [sklearn_documentation](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestRegressor.html) to import the regressor and fit it to your data, before running the cells below which will calculate your new RMSE accuracy score

Once you have done Tasks 1-4 you can submit the notebook via the student portal!

**(OPTIONAL Bonus ++)** 

**Task 5) what else would you look at improving in the notebook / approach to make the model more effective?** 

have you considered reducing the features, more pre processing steps /cleaning? 

have you thought about tweaking the random forest with more trees, etc - [here](https://www.keboola.com/blog/random-forest-regression) 

What about going for an ensemble approach and combine other models /bootstrap bagging or gradient descent ?  

(the best RMSE score I have seen a student get with this data is 0.6504)

- If you are able to achieve a better accuracy please note down what you did differently in a markdown cell at the top of your notebook, before submitting the notebook to us via the student portal. I would also suggest to flag in the lab-help channel what your best RMSE accuracy is so we can take a look at the notebook submitted and give you some feedback
